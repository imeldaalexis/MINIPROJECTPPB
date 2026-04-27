import 'package:isar/isar.dart';
import 'transaction_model.dart';
import 'menu_model.dart';

part 'transaction_detail_model.g.dart';

@collection
class TransactionDetailModel {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late String firestoreId;

  late String transactionFirestoreId;
  late String menuFirestoreId;
  late String menuName; // denormalized for easy display
  late double menuPrice; // denormalized
  late int quantity;

  bool isSynced = false;

  // Back-link to transaction
  @Backlink(to: 'details')
  final transaction = IsarLink<TransactionModel>();
}