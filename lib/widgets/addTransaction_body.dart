import 'package:expanse_app/widgets/custom_date_field.dart';
import 'package:expanse_app/widgets/custom_text_form_field.dart';
import 'package:expanse_app/widgets/custom_drop_down_text_field.dart';
import 'package:flutter/material.dart';

class AddtransactionBody extends StatelessWidget {
  AddtransactionBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomTextFormField(
          labelText: "Title",
        ),
        CustomTextFormField(
          labelText: "Amount",
        ),
        CustomDropDownTextField(),
        CustomDateField(),
      ],
    ));
  }
}
