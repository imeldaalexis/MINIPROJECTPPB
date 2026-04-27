import 'package:isar/isar.dart';
import 'transaction_detail_model.dart';

part 'transaction_model.g.dart';

@collection
class TransactionModel {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late String firestoreId;

  late String transactionDate; // yyyy-MM-dd
  late String deliveryTime; // 'siang 1','siang 2','malam 1','malam 2'
  late String customerName;
  late String customerLocation;
  late String sellerUid; // who added this order

  DateTime? createdAt;
  DateTime? updatedAt;
  bool isSynced = false;

  // Link to details
  final details = IsarLinks<TransactionDetailModel>();
}