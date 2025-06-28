import 'package:flutter/material.dart';

class ListViewCard extends StatelessWidget {
  const ListViewCard({
    super.key,
    required this.amountType,
    required this.amount,
    this.aspectRatio, // ✅ optional
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Total $amountType",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.withOpacity(.8),
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
            const Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "+\$2000",
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "30 Oct 2002",
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
    );

    return aspectRatio != null
        ? AspectRatio(
            aspectRatio: aspectRatio!,
            child: cardContent,
          )
        : cardContent;
  }
}
