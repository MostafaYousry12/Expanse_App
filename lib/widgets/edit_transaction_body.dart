import 'package:expanse_app/cubits/cubit/add_transaction_cubit.dart';
import 'package:expanse_app/cubits/cubit/transaction_cubits/transaction_cubit.dart';
import 'package:expanse_app/models/expanse_model.dart';
import 'package:expanse_app/views/dashboard_view.dart';
import 'package:expanse_app/widgets/appbar_widget.dart';
import 'package:expanse_app/widgets/custom_buttom.dart';
import 'package:expanse_app/widgets/custom_date_field.dart';
import 'package:expanse_app/widgets/custom_text_form_field.dart';
import 'package:expanse_app/widgets/custom_drop_down_text_field.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditTransactionBody extends StatefulWidget {
  final ExpanseModel expanseModel;
  const EditTransactionBody({super.key, required this.expanseModel});

  @override
  State<EditTransactionBody> createState() => _EditTransactionBodyState();
}

class _EditTransactionBodyState extends State<EditTransactionBody> {
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
              AppBar(
                actions: [
                  IconButton(
                      onPressed: () {
                        widget.expanseModel.delete();
                        Navigator.pop(context);
                        BlocProvider.of<TransactionCubit>(context)
                            .fetchCubitTransaction();

                        BlocProvider.of<AddTransactionCubit>(context)
                            .fetchTransaction();
                      },
                      icon: const Icon(Icons.delete))
                ],
                title: const Text("Edit Transaction"),
              ),
              const SizedBox(
                height: 100,
              ),
              CustomTextFormField(
                keyboardType: TextInputType.text,
                labelText: widget.expanseModel.type,
                onSaved: (value) {
                  title = value;
                },
              ),
              CustomTextFormField(
                keyboardType: TextInputType.number,
                labelText: widget.expanseModel.amount.toString(),
                onSaved: (value) {
                  amount = int.tryParse(value ?? "");
                },
              ),
              CustomDropDownTextField(
                transactionType: widget.expanseModel.transactionType,
                onSaved: (value) {
                  transactionType = value;
                },
              ),
              CustomDateField(
                date: widget.expanseModel.doneTime,
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
                    buttomName: "Edit Transaction",
                    isLoading: state is AddTransactionLoading ? true : false,
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();

                        widget.expanseModel.amount =
                            amount ?? widget.expanseModel.amount;

                        widget.expanseModel.transactionType = transactionType ??
                            widget.expanseModel.transactionType;

                        widget.expanseModel.doneTime =
                            date ?? widget.expanseModel.doneTime;

                        widget.expanseModel.type =
                            title ?? widget.expanseModel.type;
                      }
                      await widget.expanseModel.save();

                      BlocProvider.of<TransactionCubit>(context)
                          .fetchCubitTransaction();

                      Navigator.pop(context);
                    },
                  );
                },
              ),
            ],
          )),
    );
  }
}
