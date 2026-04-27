import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'menu_screen.dart';
import 'summary_screen.dart';
import 'tracker_screen.dart';
import '../services/location_service.dart';
import '../services/notification_service.dart';
import '../services/firestore_service.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const MenuScreen(),
    const SummaryScreen(),
    const TrackerScreen(),
  ];

  @override
  void initState() {
    super.initState();
    // Sync local DB with cloud on startup
    FirestoreService.syncFromFirestore();
    // Start tracking GPS in the background while logged in
    LocationService.startTracking();
    NotificationService.listenToNewOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false, // Let the bottom nav handle the bottom safe area
        child: IndexedStack(
          index: _currentIndex,
          children: _pages,
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) => setState(() => _currentIndex = index),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: 'Orders'),
            BottomNavigationBarItem(icon: Icon(Icons.restaurant_menu), label: 'Menu'),
            BottomNavigationBarItem(icon: Icon(Icons.analytics_outlined), label: 'Summary'),
            BottomNavigationBarItem(icon: Icon(Icons.map_outlined), label: 'Tracker'),
          ],
        ),
      ),
    );
  }
}