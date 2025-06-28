import 'package:expanse_app/models/expanse_model.dart';
import 'package:expanse_app/widgets/List_view_card.dart';
import 'package:expanse_app/widgets/card_widget.dart';
import 'package:flutter/material.dart';

class ListViewWidget extends StatelessWidget {
  const ListViewWidget(
      {super.key, required this.expanses, required this.aspectRatio});

  final double aspectRatio;
  final List<ExpanseModel> expanses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: expanses.length,
      itemBuilder: (context, index) {
        final item = expanses[index];
        return ListViewCard(
          amountType: item.type,
          amount: item.amount,
        );
      },
    );
  }
}
