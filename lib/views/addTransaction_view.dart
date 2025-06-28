import 'package:expanse_app/widgets/addTransaction_body.dart';
import 'package:flutter/material.dart';

class AddtransactionView extends StatelessWidget {
  const AddtransactionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Add Transaction"),
        backgroundColor: Colors.white,
      ),
      body: AddtransactionBody(),
    );
  }
}
