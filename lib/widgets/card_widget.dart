import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
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
          mainAxisAlignment: MainAxisAlignment.center,
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
              "\$$amount",
              style: const TextStyle(
                fontSize: 24,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
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
