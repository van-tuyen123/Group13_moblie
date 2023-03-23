import 'package:flutter/material.dart';

class CustomTFormField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final Widget? suffixIcon;
  const CustomTFormField({super.key, required this.labelText, required this.controller, this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.lightGreen,
      controller: controller,
      maxLines: null,
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: Colors.red),
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 2.0,
          ),
        ),
        suffixIcon: suffixIcon,
      ),
    );
  }
}
