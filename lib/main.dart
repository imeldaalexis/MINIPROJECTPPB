import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'services/isar_service.dart';
import 'services/notification_service.dart';
import 'services/location_service.dart';
import 'utils/app_theme.dart';
import 'screens/login_screen.dart';
import 'screens/main_navigation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await IsarService.init();
  await NotificationService.initializeNotification();;
  NotificationService.listenToNewOrders();
  LocationService.startTracking();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JasTip Catering',
      theme: AppTheme.theme,
      debugShowCheckedModeBanner: false,
      
      // Set the first page the user sees
      initialRoute: 'login', 
      
      // Define the "map" of your app's pages
      routes: {
        'login': (context) => const LoginScreen(),
        'home': (context) => const MainNavigation(),
        // Add 'register' here if you have a RegisterScreen file
      },
    );
  }
}