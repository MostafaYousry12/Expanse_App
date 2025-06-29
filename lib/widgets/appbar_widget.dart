import 'package:expanse_app/constants.dart';
import 'package:expanse_app/cubits/cubit/add_transaction_cubit.dart';
import 'package:expanse_app/cubits/cubit/transaction_cubits/transaction_cubit.dart';
import 'package:expanse_app/models/expanse_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      actions: [
        IconButton(
          icon: const Icon(
            Icons.delete,
            color: Colors.black,
          ),
          onPressed: () async {
            await Hive.box<ExpanseModel>(kExpanseBox).clear();
            context.read<AddTransactionCubit>().fetchTransaction();
            context.read<TransactionCubit>().fetchCubitTransaction();
          },
        ),
      ],
      title: const Text(
        "Dashboard",
        style: TextStyle(
          fontSize: 24,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
