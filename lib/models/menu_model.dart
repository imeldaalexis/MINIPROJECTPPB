import 'package:isar/isar.dart';

part 'menu_model.g.dart';

@collection
class MenuModel {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late String firestoreId;

  late String menuName;
  late double price;
  DateTime? createdAt;
  DateTime? updatedAt;

  // For syncing
  bool isSynced = false;
}