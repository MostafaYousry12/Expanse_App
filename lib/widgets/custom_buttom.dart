import 'package:flutter/material.dart';

class CustomButtom extends StatelessWidget {
  const CustomButtom(
      {super.key,
      this.onPressed,
      this.isLoading = false,
      required this.buttomName});
  final void Function()? onPressed;
  final bool isLoading;
  final String buttomName;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 55,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(8),
      ),
      child: isLoading
          ? const Center(
              child: SizedBox(
                width: 22,
                height: 22,
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              ),
            )
          : TextButton(
              onPressed: onPressed,
              child: Text(buttomName),
            ),
    );
  }
}
