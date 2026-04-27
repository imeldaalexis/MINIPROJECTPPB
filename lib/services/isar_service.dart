import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../models/menu_model.dart';
import '../models/transaction_model.dart';
import '../models/transaction_detail_model.dart';

class IsarService {
  static late Isar isar;

  static Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [MenuModelSchema, TransactionModelSchema, TransactionDetailModelSchema],
      directory: dir.path,
    );
  }

  // ─── MENUS ────────────────────────────────────────────────────────────────

  static Future<List<MenuModel>> getAllMenus() async {
    return isar.menuModels.where().findAll();
  }

  static Future<void> upsertMenu(MenuModel menu) async {
    await isar.writeTxn(() async {
      await isar.menuModels.put(menu);
    });
  }

  static Future<void> deleteMenu(String firestoreId) async {
    await isar.writeTxn(() async {
      await isar.menuModels
          .filter()
          .firestoreIdEqualTo(firestoreId)
          .deleteAll();
    });
  }

  // ─── TRANSACTIONS ─────────────────────────────────────────────────────────

  static Future<List<TransactionModel>> getAllTransactions() async {
    final txns = await isar.transactionModels.where().findAll();
    for (final t in txns) {
      await t.details.load();
    }
    return txns;
  }

  static Future<List<TransactionModel>> getTodayTransactions() async {
    final today =
        DateTime.now().toIso8601String().substring(0, 10); // yyyy-MM-dd
    final txns = await isar.transactionModels
        .filter()
        .transactionDateEqualTo(today)
        .findAll();
    for (final t in txns) {
      await t.details.load();
    }
    return txns;
  }

  static Future<void> upsertTransaction(TransactionModel txn,
      List<TransactionDetailModel> details) async {
    await isar.writeTxn(() async {
      final savedId = await isar.transactionModels.put(txn);
      txn.id = savedId;
      for (final d in details) {
        await isar.transactionDetailModels.put(d);
      }
      txn.details.addAll(details);
      await txn.details.save();
    });
  }

  static Future<void> deleteTransaction(String firestoreId) async {
    await isar.writeTxn(() async {
      final txn = await isar.transactionModels
          .filter()
          .firestoreIdEqualTo(firestoreId)
          .findFirst();
      if (txn != null) {
        await isar.transactionDetailModels
            .filter()
            .transactionFirestoreIdEqualTo(firestoreId)
            .deleteAll();
        await isar.transactionModels.delete(txn.id);
      }
    });
  }

  static Future<MenuModel?> getMenuByFirestoreId(String firestoreId) async {
    return isar.menuModels
        .filter()
        .firestoreIdEqualTo(firestoreId)
        .findFirst();
  }
}