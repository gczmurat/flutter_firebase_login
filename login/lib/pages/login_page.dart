import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:login/constants/constants_item.dart';
import 'package:login/screens/login_screen.dart';
import 'package:login/screens/register_screen.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ContainedTabBarView(
          tabBarProperties: TabBarProperties(unselectedLabelColor: Colors.purple.shade300,
            width: 200,
            alignment: TabBarAlignment.center,
            indicator: BoxDecoration(border: Border.all(color: Colors.transparent),
                color: Colors.purple.shade300,
                borderRadius: BorderRadius.circular(12)),
            margin: const EdgeInsets.only(top: 15),
          ),
          tabs: [
            Text(
              "Login",
              style: Constants.tabText,
            ),
            Text(
              "Register",
              style: Constants.tabText,
            )
          ],
          views: [
            LoginScreen(),
            RegisterScreen()
          ],
          onChange: (index) => print(index),
        ),
      ),
    );
  }
}
