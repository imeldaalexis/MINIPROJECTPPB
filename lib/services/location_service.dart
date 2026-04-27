import 'package:location/location.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LocationService {
  static final Location _location = Location();

  static Future<void> startTracking() async {
    // 1. Cek Service GPS nyala/nggak
    bool serviceEnabled = await _location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await _location.requestService();
      if (!serviceEnabled) return;
    }

    // 2. Cek Izin (Prompt muncul di sini)
    PermissionStatus permissionGranted = await _location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await _location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) return;
    }

    // 3. Ambil User yang lagi login
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    // 4. Set interval (update tiap 10 meter)
    _location.changeSettings(distanceFilter: 10, accuracy: LocationAccuracy.high);

    // 5. Kirim ke Firestore tiap lokasi berubah
    _location.onLocationChanged.listen((LocationData loc) {
      FirebaseFirestore.instance.collection('user_locations').doc(user.uid).set({
        'uid': user.uid,
        'email': user.email,
        'latitude': loc.latitude,
        'longitude': loc.longitude,
        'updatedAt': FieldValue.serverTimestamp(),
      });
    });
  }
}