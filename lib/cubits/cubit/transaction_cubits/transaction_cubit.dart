import 'package:bloc/bloc.dart';
import 'package:expanse_app/constants.dart';
import 'package:expanse_app/models/expanse_model.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

part 'transaction_state.dart';

class TransactionCubit extends Cubit<TransactionState> {
  TransactionCubit() : super(TransactionInitial());

  List<ExpanseModel>? transactions;

  fetchCubitTransaction() {
    try {
      var expansebox = Hive.box<ExpanseModel>(kExpanseBox);
      transactions = expansebox.values.toList();
      emit(TransactionSuccess());
      emit(TransactionLoaded(list: expansebox.values.toList()));
    } catch (e) {
      emit(TransactionFailure(e.toString()));
    }
  }
}
