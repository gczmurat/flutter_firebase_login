import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login/constants/constants_item.dart';
import 'package:login/widgets/login_button.dart';
import 'package:login/widgets/text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  void signUserUp(BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    try {
      if (passwordController.text == confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);
      } else {
        wrongEmail();
      }
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      if (e.code == "user-not-found") {
        wrongEmail();
      }
    }
  }

  void wrongEmail() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Center(
              child: Text(
            "Wrong Password!",
            style: Constants.messageText,
          )),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    String _url = "images/logo2.png";
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 80,
          ),
          Image.asset(
            _url,
            height: 110,
          ),
          LoginText(
              controller: emailController,
              hintText: "e-mail",
              obscureText: false),
          SizedBox(
            height: 10,
          ),
          LoginText(
              controller: passwordController,
              hintText: "Password",
              obscureText: true),
          SizedBox(
            height: 10,
          ),
          LoginText(
              controller: confirmPasswordController,
              hintText: "Confirim Password",
              obscureText: true),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                LoginButton(
                  onTap: () => signUserUp(context),
                  text: 'Register',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
