import 'package:flutter/material.dart';
import 'package:login/constants/constants_item.dart';

class LoginButton extends StatelessWidget {
  void Function()? onTap;
  String text;
    LoginButton({super.key,required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.purple.shade300, borderRadius: BorderRadius.circular(5)),
        height: 50,
        width: 200,
        child:  Center(child:  Text(text,style: Constants.buttonText,)),
      ),
    );
  }
}
