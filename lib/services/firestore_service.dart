import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';
import '../models/menu_model.dart';
import '../models/transaction_model.dart';
import '../models/transaction_detail_model.dart';
import 'isar_service.dart';

class FirestoreService {
  static final _db = FirebaseFirestore.instance;
  static final _uuid = const Uuid();

  // ─── MENUS ────────────────────────────────────────────────────────────────

  static Stream<QuerySnapshot> menusStream() =>
      _db.collection('menus').orderBy('menuName').snapshots();

  static Future<String> addMenu(String name, double price) async {
    final id = _uuid.v4();
    await _db.collection('menus').doc(id).set({
      'menuName': name,
      'price': price,
      'createdAt': FieldValue.serverTimestamp(),
      'updatedAt': FieldValue.serverTimestamp(),
    });

    final model = MenuModel()
      ..firestoreId = id
      ..menuName = name
      ..price = price
      ..createdAt = DateTime.now()
      ..updatedAt = DateTime.now()
      ..isSynced = true;
    await IsarService.upsertMenu(model);
    return id;
  }

  static Future<void> updateMenu(String firestoreId, String name, double price) async {
    await _db.collection('menus').doc(firestoreId).update({
      'menuName': name,
      'price': price,
      'updatedAt': FieldValue.serverTimestamp(),
    });
    
    final model = await IsarService.getMenuByFirestoreId(firestoreId);
    if (model != null) {
      model
        ..menuName = name
        ..price = price
        ..updatedAt = DateTime.now()
        ..isSynced = true;
      await IsarService.upsertMenu(model);
    }
  }

  static Future<void> deleteMenu(String firestoreId) async {
    await _db.collection('menus').doc(firestoreId).delete();
    await IsarService.deleteMenu(firestoreId);
  }

  // ─── TRANSACTIONS ─────────────────────────────────────────────────────────

  static Stream<QuerySnapshot> transactionsStream() => _db
      .collection('transactions')
      .orderBy('createdAt', descending: true)
      .snapshots();

  static Future<String> addTransaction({
    required String customerName,
    required String customerLocation,
    required String deliveryTime,
    required List<Map<String, dynamic>> items,
  }) async {
    final txnId = _uuid.v4();
    final today = DateTime.now().toIso8601String().substring(0, 10);
    final uid = FirebaseAuth.instance.currentUser?.uid ?? '';
    final userEmail = FirebaseAuth.instance.currentUser?.email ?? '';

    final batch = _db.batch();
    final txnRef = _db.collection('transactions').doc(txnId);

    batch.set(txnRef, {
      'transactionDate': today,
      'deliveryTime': deliveryTime,
      'customerName': customerName,
      'customerLocation': customerLocation,
      'sellerUid': uid,
      'sellerEmail': userEmail,
      'createdAt': FieldValue.serverTimestamp(),
      'updatedAt': FieldValue.serverTimestamp(),
    });

    final List<TransactionDetailModel> detailModels = [];
    for (final item in items) {
      final detailId = _uuid.v4();
      final detailRef = _db.collection('transaction_details').doc(detailId);
      
      batch.set(detailRef, {
        'transactionId': txnId,
        'menuId': item['menuId'],
        'menuName': item['menuName'],
        'menuPrice': item['price'],
        'quantity': item['qty'] ?? item['quantity'],
      });

      detailModels.add(TransactionDetailModel()
        ..firestoreId = detailId
        ..transactionFirestoreId = txnId
        ..menuFirestoreId = item['menuId']
        ..menuName = item['menuName']
        ..menuPrice = (item['price'] as num).toDouble()
        ..quantity = item['qty'] ?? item['quantity']
        ..isSynced = true);
    }

    await batch.commit();

    // Buat notifikasi di koleksi notifications (untuk Awesome Notifications)
    await _db.collection('notifications').add({
      'type': 'new_order',
      'message': 'Pesanan dari $customerName ($deliveryTime) ditambahkan oleh $userEmail',
      'transactionId': txnId,
      'createdAt': FieldValue.serverTimestamp(),
      'senderUid': uid,
    });

    final txnModel = TransactionModel()
      ..firestoreId = txnId
      ..transactionDate = today
      ..deliveryTime = deliveryTime
      ..customerName = customerName
      ..customerLocation = customerLocation
      ..sellerUid = uid
      ..createdAt = DateTime.now()
      ..updatedAt = DateTime.now()
      ..isSynced = true;
    
    await IsarService.upsertTransaction(txnModel, detailModels);
    return txnId;
  }

  static Future<void> updateTransaction({
    required String firestoreId,
    required String customerName,
    required String customerLocation,
    required String deliveryTime,
    required List<Map<String, dynamic>> items,
  }) async {
    final today = DateTime.now().toIso8601String().substring(0, 10);
    final batch = _db.batch();

    // 1. Update Dokumen Transaksi Utama
    final txnRef = _db.collection('transactions').doc(firestoreId);
    batch.update(txnRef, {
      'customerName': customerName,
      'customerLocation': customerLocation,
      'deliveryTime': deliveryTime,
      'updatedAt': FieldValue.serverTimestamp(),
    });

    // 2. Hapus Detail Lama di Firestore
    final oldDetails = await _db
        .collection('transaction_details')
        .where('transactionId', isEqualTo: firestoreId)
        .get();
    for (final doc in oldDetails.docs) {
      batch.delete(doc.reference);
    }

    // 3. Tambah Detail Baru
    final List<TransactionDetailModel> detailModels = [];
    for (final item in items) {
      final detailId = _uuid.v4();
      final detailRef = _db.collection('transaction_details').doc(detailId);
      
      batch.set(detailRef, {
        'transactionId': firestoreId,
        'menuId': item['menuId'],
        'menuName': item['menuName'],
        'menuPrice': item['price'],
        'quantity': item['quantity'] ?? item['qty'],
      });

      detailModels.add(TransactionDetailModel()
        ..firestoreId = detailId
        ..transactionFirestoreId = firestoreId
        ..menuFirestoreId = item['menuId']
        ..menuName = item['menuName']
        ..menuPrice = (item['price'] as num).toDouble()
        ..quantity = item['quantity'] ?? item['qty']
        ..isSynced = true);
    }

    await batch.commit();

    // 4. Sync ke Local Isar
    await IsarService.deleteTransaction(firestoreId);
    final txnModel = TransactionModel()
      ..firestoreId = firestoreId
      ..transactionDate = today
      ..deliveryTime = deliveryTime
      ..customerName = customerName
      ..customerLocation = customerLocation
      ..sellerUid = FirebaseAuth.instance.currentUser?.uid ?? ''
      ..updatedAt = DateTime.now()
      ..isSynced = true;
    
    await IsarService.upsertTransaction(txnModel, detailModels);
  }

  static Future<void> deleteTransaction(String firestoreId) async {
    final batch = _db.batch();
    
    // Hapus dokumen transaksi
    batch.delete(_db.collection('transactions').doc(firestoreId));
    
    // Cari dan hapus semua detail terkait
    final details = await _db
        .collection('transaction_details')
        .where('transactionId', isEqualTo: firestoreId)
        .get();
    
    for (final doc in details.docs) {
      batch.delete(doc.reference);
    }
    
    await batch.commit();
    await IsarService.deleteTransaction(firestoreId);
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> detailsStream(String transactionId) =>
      _db.collection('transaction_details')
          .where('transactionId', isEqualTo: transactionId)
          .snapshots();

  // ─── USER LOCATION ────────────────────────────────────────────────────────

  static Future<void> updateUserLocation(String uid, String email, double lat, double lng) async {
    await _db.collection('user_locations').doc(uid).set({
      'uid': uid,
      'email': email,
      'latitude': lat,
      'longitude': lng,
      'updatedAt': FieldValue.serverTimestamp(),
    });
  }

  static Stream<QuerySnapshot> userLocationsStream() =>
      _db.collection('user_locations').snapshots();

  static Future<void> syncFromFirestore() async {
    try {
      // 1. Sync Semua Menus
      final menus = await _db.collection('menus').get();
      for (final doc in menus.docs) {
        final d = doc.data();
        final model = MenuModel()
          ..firestoreId = doc.id
          ..menuName = d['menuName'] ?? ''
          ..price = (d['price'] as num?)?.toDouble() ?? 0.0
          ..isSynced = true;
        await IsarService.upsertMenu(model);
      }

      // 2. Sync Transaksi Hari Ini
      final today = DateTime.now().toIso8601String().substring(0, 10);
      final txns = await _db
          .collection('transactions')
          .where('transactionDate', isEqualTo: today)
          .get();

      for (final doc in txns.docs) {
        final d = doc.data();
        
        // Ambil detail untuk transaksi ini
        final details = await _db
            .collection('transaction_details')
            .where('transactionId', isEqualTo: doc.id)
            .get();

        final detailModels = details.docs.map((dd) {
          final data = dd.data();
          return TransactionDetailModel()
            ..firestoreId = dd.id
            ..transactionFirestoreId = doc.id
            ..menuFirestoreId = data['menuId'] ?? ''
            ..menuName = data['menuName'] ?? ''
            ..menuPrice = (data['menuPrice'] as num?)?.toDouble() ?? 0.0
            ..quantity = (data['quantity'] ?? data['qty'] ?? 0) as int
            ..isSynced = true;
        }).toList();

        final txnModel = TransactionModel()
          ..firestoreId = doc.id
          ..transactionDate = d['transactionDate'] ?? today
          ..deliveryTime = d['deliveryTime'] ?? 'siang 1'
          ..customerName = d['customerName'] ?? ''
          ..customerLocation = d['customerLocation'] ?? ''
          ..sellerUid = d['sellerUid'] ?? ''
          ..createdAt = (d['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now()
          ..updatedAt = (d['updatedAt'] as Timestamp?)?.toDate() ?? DateTime.now()
          ..isSynced = true;

        await IsarService.upsertTransaction(txnModel, detailModels);
      }
      print("Sync success: Menus and Today's Transactions updated.");
    } catch (e) {
      print("Sync error: $e");
    }
  }
}