import 'package:expanse_app/cubits/cubit/add_transaction_cubit.dart';
import 'package:expanse_app/views/addTransaction_view.dart';
import 'package:expanse_app/widgets/dashboardview_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: Colors.blue,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BlocProvider(
                create: (context) => AddTransactionCubit(),
                child: const AddtransactionView(),
              ),
            ),
          ).then((value) {
            context.read<AddTransactionCubit>().fetchTransaction();
          });
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: DashboardviewBody(),
    );
  }
}
