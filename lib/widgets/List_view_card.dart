import 'package:expanse_app/models/expanse_model.dart';
import 'package:expanse_app/views/edit_transaction_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ListViewCard extends StatelessWidget {
  const ListViewCard({
    super.key,
    required this.amountType,
    required this.amount,
    this.aspectRatio,
    required this.date,
    required this.transactionType,
    @required this.expanse,
  });

  final String amountType;
  final String transactionType;
  final int amount;
  final DateTime date;
  final double? aspectRatio;
  final ExpanseModel? expanse;

  @override
  Widget build(BuildContext context) {
    final cardContent = GestureDetector(
      onTap: () {
        if (expanse != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EditTransactionView(
                expanseModel: expanse!,
              ),
            ),
          );
        }
      },
      child: Material(
        child: Card(
          color: Colors.white,
          elevation: 4,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "$amountType",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      "\$$amount",
                      style: const TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      transactionType == "Income" ? "+\$$amount" : "-\$$amount",
                      style: TextStyle(
                        color: transactionType == "Income"
                            ? Colors.green
                            : Colors.red,
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      DateFormat.yMMMd()
                          .format(DateTime.parse(date.toString())),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );

    return aspectRatio != null
        ? AspectRatio(
            aspectRatio: aspectRatio!,
            child: cardContent,
          )
        : cardContent;
  }
}
