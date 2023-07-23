import 'package:flutter/material.dart';

import '../core/utils/app_colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.labelText,
    required this.inputType,
    this.controller,
    this.validator,
  });

  final String labelText;
  final TextInputType inputType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.primaryColor,
      decoration: InputDecoration(
          border: const UnderlineInputBorder(
              borderSide: BorderSide(
            color: Colors.grey,
          )),
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
            color: Colors.grey,
          )),
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
            color: Colors.grey,
          )),
          labelText: labelText,
          labelStyle: const TextStyle(color: Colors.grey, fontSize: 16)),
      keyboardType: inputType,
      controller: controller,
      validator: (value) => validator!(value!),
    );
  }
}
