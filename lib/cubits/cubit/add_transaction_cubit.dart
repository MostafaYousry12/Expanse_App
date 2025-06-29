import 'package:bloc/bloc.dart';
import 'package:expanse_app/constants.dart';
import 'package:expanse_app/models/expanse_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

part 'add_transaction_state.dart';

class AddTransactionCubit extends Cubit<AddTransactionState> {
  AddTransactionCubit() : super(AddTransactionInitial());

  final List<ExpanseModel> transactions = [];

  Future<void> addTransaction(ExpanseModel expanse) async {
    emit(AddTransactionLoading());
    try {
      var expansebox = Hive.box<ExpanseModel>(kExpanseBox);
      await expansebox.add(expanse);
      transactions.add(expanse);
      emit(AddTransactionSuccess());
    } catch (e) {
      emit(AddTransactionFailure(e.toString()));
    }
  }

  void fetchTransaction() {
    final box = Hive.box<ExpanseModel>(kExpanseBox);
    transactions.clear();
    transactions.addAll(box.values.toList());
  }
}
