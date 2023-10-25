import 'package:auth_ui/customs/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  String hintText;
  Widget suffix;
  bool? obscureText;
  bool isValid;
  TextEditingController controller;
  void Function(String)? onChange;

  CustomTextField(
      {required this.hintText,
      required this.suffix,
      this.obscureText,
      required this.isValid,
      required this.controller,
      required this.onChange,
      super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChange,
      obscureText: obscureText ?? false,
      style: const TextStyle(color: kGreyColor),
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: kGreyColor),
          fillColor: kTextFieldBgColor,
          filled: true,
          suffixIcon: suffix,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 23.0, vertical: 18),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color:isValid ? kPrimaryColor : kTextFieldBorderColor)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color:isValid ? kPrimaryColor : Colors.grey, width: 2))),
    );
  }
}
