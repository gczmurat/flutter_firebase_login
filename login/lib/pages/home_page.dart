import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login/pages/login_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Home"),
        centerTitle: true,
        toolbarHeight: 45,
      ),
      body: Center(
        child: TextButton(onPressed: () {FirebaseAuth.instance.signOut().then((value) {
                      Navigator.push(context,
        MaterialPageRoute(builder: (context) => const LoginPage())).onError((error, stackTrace) {
          print("Error");
        });
                    });}, child: const Text("Log out")),
      ),
    );
  }
}
