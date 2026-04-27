import 'package:flutter/material.dart';
import '../services/firestore_service.dart';
import '../services/isar_service.dart';
import '../models/menu_model.dart';
import 'package:firebase_auth/firebase_auth.dart';


class AddOrderSheet extends StatefulWidget {
  const AddOrderSheet({super.key});

  @override
  State<AddOrderSheet> createState() => _AddOrderSheetState();
}

class _AddOrderSheetState extends State<AddOrderSheet> {
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _locCtrl = TextEditingController();
  
  String _selectedTime = 'siang 1';
  final List<String> _times = ['siang 1', 'siang 2', 'malam 1', 'malam 2'];

  List<MenuModel> _availableMenus = [];
  final List<Map<String, dynamic>> _orderItems = [];

  @override
  void initState() {
    super.initState();
    _fetchMenus();
  }

  Future<void> _fetchMenus() async {
    final menus = await IsarService.getAllMenus();
    setState(() => _availableMenus = menus);
  }

  void _addMenuItem() {
    if (_availableMenus.isEmpty) return;
    setState(() {
      _orderItems.add({
        'menuId': _availableMenus.first.firestoreId,
        'menuName': _availableMenus.first.menuName,
        'price': _availableMenus.first.price,
        'qty': 1,
      });
    });
  }

  Future<void> _submitOrder() async {
    print("Current User: ${FirebaseAuth.instance.currentUser?.uid}");
    if (!_formKey.currentState!.validate() || _orderItems.isEmpty) return;

    await FirestoreService.addTransaction(
      customerName: _nameCtrl.text,
      customerLocation: _locCtrl.text,
      deliveryTime: _selectedTime,
      items: _orderItems,
    );

    if (mounted) Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 20, right: 20, top: 20,
      ),
      child: Form(
        key: _formKey,
        child: ListView(
          shrinkWrap: true,
          children: [
            const Text('Tambah Pesanan', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            TextFormField(
              controller: _nameCtrl,
              decoration: const InputDecoration(labelText: 'Nama Pelanggan'),
              validator: (v) => v!.isEmpty ? 'Wajib diisi' : null,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _locCtrl,
              decoration: const InputDecoration(labelText: 'Lokasi Pengantaran'),
              validator: (v) => v!.isEmpty ? 'Wajib diisi' : null,
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              value: _selectedTime,
              decoration: const InputDecoration(labelText: 'Jam Pengantaran'),
              items: _times.map((t) => DropdownMenuItem(value: t, child: Text(t))).toList(),
              onChanged: (v) => setState(() => _selectedTime = v!),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Daftar Menu', style: TextStyle(fontWeight: FontWeight.bold)),
                TextButton.icon(
                  onPressed: _addMenuItem,
                  icon: const Icon(Icons.add),
                  label: const Text('Tambah Menu'),
                )
              ],
            ),
            ..._orderItems.asMap().entries.map((entry) {
              int index = entry.key;
              Map<String, dynamic> item = entry.value;
              return Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: DropdownButton<String>(
                      isExpanded: true,
                      value: item['menuId'],
                      items: _availableMenus.map((m) => 
                        DropdownMenuItem(value: m.firestoreId, child: Text(m.menuName))
                      ).toList(),
                      onChanged: (val) {
                        final selected = _availableMenus.firstWhere((m) => m.firestoreId == val);
                        setState(() {
                          _orderItems[index]['menuId'] = selected.firestoreId;
                          _orderItems[index]['menuName'] = selected.menuName;
                          _orderItems[index]['price'] = selected.price;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextFormField(
                      initialValue: item['qty'].toString(),
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(labelText: 'Qty'),
                      onChanged: (val) => _orderItems[index]['qty'] = int.tryParse(val) ?? 1,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.remove_circle, color: Colors.red),
                    onPressed: () => setState(() => _orderItems.removeAt(index)),
                  )
                ],
              );
            }),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _submitOrder,
              child: const Text('Simpan Pesanan'),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}