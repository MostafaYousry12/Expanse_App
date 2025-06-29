import 'package:expanse_app/cubits/cubit/add_transaction_cubit.dart';
import 'package:expanse_app/cubits/cubit/transaction_cubits/transaction_cubit.dart';
import 'package:expanse_app/models/expanse_model.dart';
import 'package:expanse_app/views/dashboard_view.dart';
import 'package:expanse_app/widgets/custom_buttom.dart';
import 'package:expanse_app/widgets/custom_date_field.dart';
import 'package:expanse_app/widgets/custom_text_form_field.dart';
import 'package:expanse_app/widgets/custom_drop_down_text_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddtransactionBody extends StatefulWidget {
  const AddtransactionBody({super.key});

  @override
  State<AddtransactionBody> createState() => _AddtransactionBodyState();
}

class _AddtransactionBodyState extends State<AddtransactionBody> {
  final GlobalKey<FormState> formKey = GlobalKey();

  String? title, transactionType;
  DateTime? date;
  int? amount;
  final dateFormat = DateFormat('d/M/yyyy');

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.disabled,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 100,
              ),
              CustomTextFormField(
                keyboardType: TextInputType.text,
                labelText: "Title",
                onSaved: (value) {
                  title = value;
                },
              ),
              CustomTextFormField(
                keyboardType: TextInputType.number,
                labelText: "Amount",
                onSaved: (value) {
                  amount = int.tryParse(value ?? "");
                },
              ),
              CustomDropDownTextField(
                onSaved: (value) {
                  transactionType = value;
                },
              ),
              CustomDateField(
                onSaved: (value) {
                  date = dateFormat.parse(value!);
                },
              ),
              const SizedBox(
                height: 55,
              ),
              BlocBuilder<AddTransactionCubit, AddTransactionState>(
                builder: (context, state) {
                  return CustomButtom(
                    isLoading: state is AddTransactionLoading ? true : false,
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        var expanseModel = ExpanseModel(
                          transactionType: transactionType!,
                          amount: amount!,
                          type: title!,
                          doneTime: date!,
                        );
                        BlocProvider.of<AddTransactionCubit>(context)
                            .addTransaction(expanseModel);
                      }
                      BlocProvider.of<TransactionCubit>(context)
                          .fetchCubitTransaction();

                      Navigator.pop(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return DashboardView();
                          },
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          )),
    );
  }
}
