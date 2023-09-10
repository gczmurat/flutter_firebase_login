import 'package:flutter/material.dart';
import 'package:login/constants/constants_item.dart';

class LoginText extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;
  const LoginText(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 35, right: 35),
      child: TextField(
        cursorColor: Colors.purple.shade300,
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(
                  color: Colors.white,
                )),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
              color: Colors.purple,
            )),
            fillColor: Colors.grey.shade300,
            filled: true,
            hintText: hintText,
            hintStyle: Constants.hintTextStyle,
            labelStyle: Constants.hintTextStyle),
      ),
    );
  }
}
