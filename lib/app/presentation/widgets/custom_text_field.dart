import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key key,
    @required this.icon,
    @required this.hintText,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.obscureText = false,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.controller,
    this.validator,
    this.onEditingComplete,
  }) : super(key: key);

  final AutovalidateMode autovalidateMode;
  final TextEditingController controller;
  final IconData icon;
  final String hintText;
  final TextInputType keyboardType;
  final bool obscureText;
  final void Function() onEditingComplete;
  final TextInputAction textInputAction;
  final String Function(String) validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: autovalidateMode,
      controller: controller,
      decoration: InputDecoration(
        border: const UnderlineInputBorder(),
        enabledBorder: const UnderlineInputBorder(),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(width: 2, color: Colors.red),
        ),
        prefixIcon: Icon(
          icon,
          color: Colors.black,
        ),
        focusColor: Colors.black,
        hintText: hintText,
      ),
      obscureText: obscureText,
      onEditingComplete: onEditingComplete,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      validator: validator,
    );
  }
}
