class ExpanseModel {
  final int amount;
  final String type;
  final DateTime doneTime;
  final String transactionType;

  ExpanseModel(
      {required this.transactionType,
      required this.amount,
      required this.type,
      required this.doneTime});
}
