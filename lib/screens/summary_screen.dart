import 'package:flutter/material.dart';
import '../services/isar_service.dart';
import '../utils/app_theme.dart';

class SummaryScreen extends StatefulWidget {
  const SummaryScreen({super.key});

  @override
  State<SummaryScreen> createState() => _SummaryScreenState();
}

class _SummaryScreenState extends State<SummaryScreen> {
  String _selectedTime = 'siang 1';
  final List<String> _times = ['siang 1', 'siang 2', 'malam 1', 'malam 2'];
  
  Map<String, int> _summaryData = {}; // menuName -> totalQuantity

  @override
  void initState() {
    super.initState();
    _generateSummary();
  }

  // Equivalent to your requested SQL GROUP BY query
  Future<void> _generateSummary() async {
    final todayTxns = await IsarService.getTodayTransactions();
    
    Map<String, int> newSummary = {};

    for (var txn in todayTxns) {
      if (txn.deliveryTime == _selectedTime) {
        for (var detail in txn.details) {
          // GROUP BY menu_name, SUM(quantity)
          newSummary[detail.menuName] = (newSummary[detail.menuName] ?? 0) + detail.quantity;
        }
      }
    }

    // Convert map to entries and sort by Menu Name (ORDER BY menu_name ASC)
    var sortedEntries = newSummary.entries.toList()
      ..sort((a, b) => a.key.compareTo(b.key));

    setState(() {
      _summaryData = Map.fromEntries(sortedEntries);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rekap Pesanan Hari Ini')),
      body: Column(
        children: [
          // Filter Tabs
          Padding(
            padding: const EdgeInsets.all(16),
            child: SegmentedButton<String>(
              segments: _times.map((t) => ButtonSegment(
                value: t, 
                label: Text(t, style: const TextStyle(fontSize: 12))
              )).toList(),
              selected: {_selectedTime},
              onSelectionChanged: (Set<String> newSelection) {
                setState(() {
                  _selectedTime = newSelection.first;
                  _generateSummary();
                });
              },
            ),
          ),
          // Grouped Data Output
          Expanded(
            child: _summaryData.isEmpty
                ? const Center(child: Text('Tidak ada pesanan untuk shift ini.'))
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: _summaryData.length,
                    itemBuilder: (context, index) {
                      String menuName = _summaryData.keys.elementAt(index);
                      int totalQty = _summaryData[menuName]!;

                      return Card(
                        child: ListTile(
                          leading: const CircleAvatar(
                            backgroundColor: AppTheme.surface,
                            child: Icon(Icons.restaurant, color: AppTheme.primary, size: 20),
                          ),
                          title: Text(menuName, style: const TextStyle(fontWeight: FontWeight.bold)),
                          trailing: Text(
                            'x$totalQty', 
                            style: const TextStyle(fontSize: 18, color: AppTheme.primary, fontWeight: FontWeight.w900)
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}