import 'package:hive_flutter/hive_flutter.dart';

part 'expanse_model.g.dart';

@HiveType(typeId: 0)
class ExpanseModel {
  @HiveField(0)
  final int amount;
  @HiveField(1)
  final String type;
  @HiveField(2)
  final DateTime doneTime;
  @HiveField(3)
  final String transactionType;

  ExpanseModel(
      {required this.transactionType,
      required this.amount,
      required this.type,
      required this.doneTime});
}
