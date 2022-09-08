// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, avoid_print

import 'package:coffee_new/models/user.dart';
import 'package:coffee_new/screens/authenticate/authenticate.dart';
import 'package:coffee_new/screens/displays.dart';
// import 'package:coffee_new/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<CustomUser?>(context);
    print(user);
    // return either Home or Authenticate widget
    if (user == null) {
      return Authenticate();
    } else {
      return Displays();
    }
  }
}
