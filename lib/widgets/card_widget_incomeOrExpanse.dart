import 'package:expanse_app/cubits/cubit/add_transaction_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardWidgetIncomeorexpanse extends StatefulWidget {
  const CardWidgetIncomeorexpanse({
    super.key,
    required this.amountType,
    required this.amount,
    this.aspectRatio,
  });

  final String amountType;
  final int amount;
  final double? aspectRatio;

  @override
  State<CardWidgetIncomeorexpanse> createState() =>
      _CardWidgetIncomeorexpanseState();
}

class _CardWidgetIncomeorexpanseState extends State<CardWidgetIncomeorexpanse> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<AddTransactionCubit>();

    final amount = widget.amountType == "Income"
        ? cubit.totalIncomeAmount
        : cubit.totalExpenseAmount;
    final cardContent = Card(
      color: Colors.white,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CircleAvatar(
                    radius: 15,
                    backgroundColor: widget.amountType == "Income"
                        ? Colors.green.withOpacity(.2)
                        : Colors.red.withOpacity(0.2),
                    child: widget.amountType == "Income"
                        ? const Icon(
                            Icons.arrow_upward,
                            color: Colors.green,
                          )
                        : const Icon(
                            Icons.arrow_downward,
                            color: Colors.red,
                          ),
                  )
                ],
              ),
            ),
            Column(
              children: [
                Text(
                  "Total ${widget.amountType}",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.withOpacity(.8),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  widget.amountType == "Income" ? "\$+$amount" : "\$-$amount",
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );

    return widget.aspectRatio != null
        ? AspectRatio(
            aspectRatio: widget.aspectRatio!,
            child: cardContent,
          )
        : cardContent;
  }
}
