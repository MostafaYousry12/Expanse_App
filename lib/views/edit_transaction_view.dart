import 'package:expanse_app/models/expanse_model.dart';
import 'package:expanse_app/widgets/edit_transaction_body.dart';
import 'package:flutter/material.dart';

class EditTransactionView extends StatelessWidget {
  const EditTransactionView({super.key, required this.expanseModel});
  final ExpanseModel expanseModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EditTransactionBody(
        expanseModel: expanseModel,
      ),
    );
  }
}
