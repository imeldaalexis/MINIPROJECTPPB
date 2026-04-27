import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../services/firestore_service.dart';
import '../widgets/order_card.dart';
import '../utils/app_theme.dart';
import '../widgets/add_order_sheet.dart';
import '../widgets/edit_order_sheet.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _selectedFilter = 'Semua';
  bool _sortAscending = true;

  final List<String> _filters = ['Semua', 'siang 1', 'siang 2', 'malam 1', 'malam 2'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Hari Ini'),
        actions: [
          IconButton(
            icon: Icon(_sortAscending ? Icons.sort_by_alpha : Icons.sort),
            onPressed: () => setState(() => _sortAscending = !_sortAscending),
            tooltip: 'Multi-level Sort (Nama & Lokasi)',
          ),
        ],
      ),
      body: Column(
        children: [
          // Filter Row (UI tetap sama)
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(16),
            child: Row(
              children: _filters.map((filter) {
                final isSelected = _selectedFilter == filter;
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: FilterChip(
                    label: Text(filter.toUpperCase()),
                    selected: isSelected,
                    onSelected: (bool selected) {
                      setState(() => _selectedFilter = filter);
                    },
                    selectedColor: AppTheme.primary.withOpacity(0.2),
                    checkmarkColor: AppTheme.primary,
                  ),
                );
              }).toList(),
            ),
          ),
          
          // Order List pakai StreamBuilder biar Auto-Sync
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirestoreService.transactionsStream(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return const Center(child: Text('Belum ada pesanan hari ini.'));
                }

                // 1. Ambil data dari Firestore Docs
                var docs = snapshot.data!.docs;

                // 2. Filter berdasarkan jam pengantaran
                if (_selectedFilter != 'Semua') {
                  docs = docs.where((doc) {
                    final data = doc.data() as Map<String, dynamic>;
                    return data['deliveryTime'] == _selectedFilter;
                  }).toList();
                }

                // 3. Sorting (Nama then Lokasi)
                docs.sort((a, b) {
                  final dataA = a.data() as Map<String, dynamic>;
                  final dataB = b.data() as Map<String, dynamic>;
                  
                  int nameCompare = (dataA['customerName'] ?? '').compareTo(dataB['customerName'] ?? '');
                  if (nameCompare != 0) {
                    return _sortAscending ? nameCompare : -nameCompare;
                  }
                  return _sortAscending
                      ? (dataA['customerLocation'] ?? '').compareTo(dataB['customerLocation'] ?? '')
                      : -(dataA['customerLocation'] ?? '').compareTo(dataB['customerLocation'] ?? '');
                });

                if (docs.isEmpty) return const Center(child: Text('Tidak ada pesanan untuk filter ini.'));

                return RefreshIndicator(
                  onRefresh: () => FirestoreService.syncFromFirestore(), // Tetap bisa sync manual ke Isar
                  child: ListView.builder(
                    itemCount: docs.length,
                    padding: const EdgeInsets.only(bottom: 80),
                    itemBuilder: (context, index) {
                      final doc = docs[index];
                      final data = doc.data() as Map<String, dynamic>;

                      return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                        stream: FirestoreService.detailsStream(doc.id),
                        builder: (context, detailSnapshot) {
                          List<Map<String, dynamic>> items = [];
                          if (detailSnapshot.hasData) {
                            items = detailSnapshot.data!.docs.map((d) => {
                              'menuName': d.data()['menuName'],
                              'quantity': d.data()['quantity'],
                              'price': d.data()['menuPrice'],
                            }).toList();
                          }

                          return OrderCard(
                            firestoreId: doc.id,
                            customerName: data['customerName'] ?? '',
                            customerLocation: data['customerLocation'] ?? '',
                            deliveryTime: data['deliveryTime'] ?? '',
                            items: items,
                            sellerEmail: data['sellerEmail'] ?? 'Seller',
                          onEdit: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              builder: (_) => EditOrderSheet(
                                firestoreId: doc.id,
                                currentName: data['customerName'] ?? '',
                                currentLoc: data['customerLocation'] ?? '',
                                currentTime: data['deliveryTime'] ?? '',
                                currentItems: items, // Kirim list item yang sudah di-fetch
                              ),
                            );
                          },
                            onDelete: () => FirestoreService.deleteTransaction(doc.id),
                          );
                        },
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (_) => const AddOrderSheet(),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}