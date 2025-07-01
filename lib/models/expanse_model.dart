import 'package:hive_flutter/hive_flutter.dart';

part 'expanse_model.g.dart';

@HiveType(typeId: 0)
class ExpanseModel extends HiveObject {
  @HiveField(0)
  int amount;
  @HiveField(1)
  String type;
  @HiveField(2)
  DateTime doneTime;
  @HiveField(3)
  String transactionType;

  ExpanseModel(
      {required this.transactionType,
      required this.amount,
      required this.type,
      required this.doneTime});
}
