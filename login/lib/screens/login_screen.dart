import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login/constants/constants_item.dart';
import 'package:login/pages/home_page.dart';
import 'package:login/widgets/login_button.dart';
import 'package:login/widgets/text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  void signUser(BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    await FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: emailController.text, password: passwordController.text)
        .then((value) {
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    }).catchError((error) {
      Navigator.pop(context);
      print("Error: $error");
    });

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text);
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found"){
        wrongEmail();
      }

      else if (e.code == "wrong-password") {
        wrongPassword();
      }
    }
  }
  void wrongEmail(){
  showDialog(
    context: context,
    builder: (context){
      return AlertDialog(
        title: Center(child: Text("Wrong e-mail",style: Constants.messageText,)),
      );
    },
  );
}

  void wrongPassword(){
  showDialog(
    context: context,
    builder: (context){
      return AlertDialog(
        title: Center(child: Text("Wrong Password",style: Constants.messageText,)),
      );
    },
  );
}
  @override
  Widget build(BuildContext context) {
    String _url = "images/logo.png";
    String googleLogo = "images/google.png";
    String facebookLogo = "images/facebook.png";
    String appleLogo = "images/apple.png";
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                LoginButton(onTap: () => signUser(context), text: 'Login',),
                Text(
                  "Forgot?",
                  style: Constants.forgotText,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
            Row(children: [
            Expanded(
                child: Divider(
              thickness: 0.5,
              color: Colors.black,
            )),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "Or Sign In With These",style: Constants.orSign,
              ),
            ),
            Expanded(
                child: Divider(
              thickness: 0.5,
              color: Colors.black,
            ))
          ]),
          const SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(
                googleLogo,
                height: 60,
              ),
              Image.asset(facebookLogo,height: 60,),
              Image.asset(appleLogo,height: 60,),
            ],
          )
        ],
      ),
    );
  }
}
