import 'package:expanse_app/models/expanse_model.dart';
import 'package:expanse_app/widgets/appbar_widget.dart';
import 'package:expanse_app/widgets/card_widget.dart';
import 'package:expanse_app/widgets/card_widget_incomeOrExpanse.dart';
import 'package:expanse_app/widgets/list_view_widget.dart';
import 'package:flutter/material.dart';

class DashboardviewBody extends StatelessWidget {
  DashboardviewBody({super.key});

  List<ExpanseModel> dummyData = [
    ExpanseModel(
        transactionType: "food",
        amount: 1000,
        type: "income",
        doneTime: DateTime.now()),
    ExpanseModel(
        transactionType: "food",
        amount: 1000,
        type: "income",
        doneTime: DateTime.now()),
    ExpanseModel(
        transactionType: "food",
        amount: 1000,
        type: "income",
        doneTime: DateTime.now()),
    ExpanseModel(
        transactionType: "food",
        amount: 1000,
        type: "income",
        doneTime: DateTime.now()),
    ExpanseModel(
        transactionType: "food",
        amount: 1000,
        type: "income",
        doneTime: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBarWidget(),
            const SizedBox(
              height: 15,
            ),
            CardWidget(
              amount: 2000,
              amountType: "Balance",
              aspectRatio: 3,
            ),
            const SizedBox(
              height: 5,
            ),
            const Row(
              children: [
                Expanded(
                  child: CardWidgetIncomeorexpanse(
                    amountType: "Income",
                    amount: 2000,
                    aspectRatio: 1.1,
                  ),
                ),
                Expanded(
                  child: CardWidgetIncomeorexpanse(
                    amountType: "Expanse",
                    amount: 2000,
                    aspectRatio: 1.1,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Recent Transaction",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                  height: 300,
                  child: ListViewWidget(expanses: dummyData, aspectRatio: 3)),
            )
          ],
        ),
      ),
    );
  }
}
