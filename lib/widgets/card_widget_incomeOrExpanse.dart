import 'package:flutter/material.dart';

class CardWidgetIncomeorexpanse extends StatelessWidget {
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
  Widget build(BuildContext context) {
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
                    backgroundColor: amountType == "Income"
                        ? Colors.green.withOpacity(.2)
                        : Colors.red.withOpacity(0.2),
                    child: amountType == "Income"
                        ? Icon(
                            Icons.arrow_upward,
                            color: Colors.green,
                          )
                        : Icon(
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
                  "Total $amountType",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.withOpacity(.8),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  amountType == "Income" ? "+\$$amount" : "-\$$amount",
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

    return aspectRatio != null
        ? AspectRatio(
            aspectRatio: aspectRatio!,
            child: cardContent,
          )
        : cardContent;
  }
}
