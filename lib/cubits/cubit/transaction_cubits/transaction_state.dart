part of 'transaction_cubit.dart';

@immutable
sealed class TransactionState {}

final class TransactionInitial extends TransactionState {}

final class TransactionSuccess extends TransactionState {}

final class TransactionLoading extends TransactionState {}

final class TransactionFailure extends TransactionState {
  final String errMsg;

  TransactionFailure(this.errMsg);
}

final class TransactionLoaded extends TransactionState {
  final List<ExpanseModel> list;

  TransactionLoaded({required this.list});
}
