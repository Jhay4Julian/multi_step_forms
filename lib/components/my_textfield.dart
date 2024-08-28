import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyTextField extends StatelessWidget {
  final String? labelText;
  final TextEditingController titleController;
  final Widget? suffixWidget;
  final bool obscureText;
  String? Function(String?)? validator;
  TextInputType? keyboardType;
  MyTextField({
    super.key,
    this.labelText,
    required this.titleController,
    this.suffixWidget,
    required this.obscureText,
    this.validator,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: titleController,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
            width: 2,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        isDense: true,
        labelText: labelText,
        suffix: suffixWidget,
        labelStyle:
            const TextStyle(letterSpacing: 1, fontWeight: FontWeight.w400),
        filled: true,
        fillColor: Colors.grey.shade100,
      ),
      obscureText: obscureText,
      keyboardType: keyboardType,
      validator: validator,
    );
  }
}
