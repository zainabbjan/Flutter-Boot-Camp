import 'package:flutter/material.dart';

class ReusableTextFormField extends StatelessWidget {
  String validateText;
  String? hint;
  Widget? icon;
  TextInputType? keyboardType;
  ReusableTextFormField({
    Key? key,
    required this.icon,
    required this.validateText,
    required this.hint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: TextInputType.text,
        validator: (value) {
          if (value!.trim().isEmpty) {
            return validateText;
          } else {
            return null;
          }
        },
        decoration: InputDecoration(
            prefixIcon: icon, hintText: hint, border: OutlineInputBorder()),
      ),
    );
  }
}
