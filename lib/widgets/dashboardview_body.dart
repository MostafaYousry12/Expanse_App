import 'package:expanse_app/cubits/cubit/add_transaction_cubit.dart';
import 'package:expanse_app/cubits/cubit/transaction_cubits/transaction_cubit.dart';
import 'package:expanse_app/widgets/appbar_widget.dart';
import 'package:expanse_app/widgets/card_widget.dart';
import 'package:expanse_app/widgets/card_widget_incomeOrExpanse.dart';
import 'package:expanse_app/widgets/list_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardviewBody extends StatefulWidget {
  const DashboardviewBody({super.key});

  @override
  State<DashboardviewBody> createState() => _DashboardviewBodyState();
}

class _DashboardviewBodyState extends State<DashboardviewBody> {
  @override
  void initState() {
    BlocProvider.of<TransactionCubit>(context).fetchCubitTransaction();
    BlocProvider.of<AddTransactionCubit>(context).fetchTransaction();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<AddTransactionCubit>();
    final amount = cubit.totalBalance;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBarWidget(),
            SizedBox(
              height: 15,
            ),
            CardWidget(
              amount: amount,
              amountType: "Balance",
              aspectRatio: 3,
            ),
            SizedBox(
              height: 5,
            ),
            Row(
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
            SizedBox(height: 20),
            Padding(
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
              padding: EdgeInsets.all(8.0),
              child:
                  SizedBox(height: 300, child: ListViewWidget(aspectRatio: 3)),
            ),
          ],
        ),
      ),
    );
  }
}
