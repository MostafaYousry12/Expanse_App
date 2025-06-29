import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class CustomDropDownTextField extends StatefulWidget {
  const CustomDropDownTextField({super.key, this.onSaved});
  final void Function(String?)? onSaved;
  @override
  State<CustomDropDownTextField> createState() => _DropDownTextFieldState();
}

class _DropDownTextFieldState extends State<CustomDropDownTextField> {
  String? selectedCategory;

  List<String> categories = ["Income", "Expanse"];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: DropdownButtonFormField2<String>(
        onSaved: widget.onSaved,
        validator: (value) {
          if (value?.isEmpty ?? true) {
            return "Field is required";
          } else {
            return null;
          }
        },
        value: selectedCategory,
        isExpanded: true,
        decoration: InputDecoration(
          labelText: "TransactionType",
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          filled: true,
          fillColor: Colors.grey.withOpacity(0.15),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(width: 2, color: Colors.black),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.black, width: 2),
          ),
        ),
        items: categories
            .map((item) => DropdownMenuItem(
                  child: Text(item),
                  value: item,
                ))
            .toList(),
        onChanged: (value) {
          setState(() {
            selectedCategory = value;
          });
        },
        dropdownStyleData: DropdownStyleData(
          elevation: 4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
