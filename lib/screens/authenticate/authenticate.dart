// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:coffee_new/screens/authenticate/sign_in.dart';
import 'package:coffee_new/screens/authenticate/sign_up.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;

  void toggleView() {
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return Container(
        child: SignIn(
          toggleView: toggleView,
        ),
      );
    } else {
      return Container(
        child: SignUp(
          toggleView: toggleView,
        ),
      );
    }
  }
}
