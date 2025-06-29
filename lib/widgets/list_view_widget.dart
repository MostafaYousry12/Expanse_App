import 'package:expanse_app/cubits/cubit/transaction_cubits/transaction_cubit.dart';
import 'package:expanse_app/models/expanse_model.dart';
import 'package:expanse_app/widgets/List_view_card.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({super.key, required this.aspectRatio});

  final double aspectRatio;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionCubit, TransactionState>(
      builder: (context, state) {
        if (state is TransactionLoaded) {
          List<ExpanseModel> transactions =
              BlocProvider.of<TransactionCubit>(context).transactions!;
          if (transactions.isEmpty) {
            return const Center(
                child: Text(
              "No transactions yet",
              style: TextStyle(
                fontSize: 22,
                color: Colors.black,
              ),
            ));
          }
          return ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: transactions.length,
            itemBuilder: (context, index) {
              final item = transactions[index];
              return ListViewCard(
                amountType: item.type,
                amount: item.amount,
                date: item.doneTime,
                transactionType: item.transactionType,
              );
            },
          );
        } else if (state is TransactionFailure) {
          return Center(child: Text('Error: ${state.errMsg}'));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
