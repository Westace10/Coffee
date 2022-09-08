// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:coffee_new/screens/wrapper.dart';
import "package:flutter/material.dart";

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    _navigatetowrapper();
    super.initState();
  }

  _navigatetowrapper() async {
    await Future.delayed(
      Duration(
        milliseconds: 5000,
      ),
      (() {}),
    );

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return Wrapper();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.15,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.7,
              child: Center(
                child: Image.asset('assets/Lenns/Lenns.001.png'),
                // child: Icon(
                //   Icons.person,
                //   size: 40,
                // ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.15,
              child: Center(
                child: Text(
                  "LENNS",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'AppleGothic',
                    color: Colors.black45,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      // body: Center(
      //   child: Container(
      //     child: Text(
      //       "Splash screen",
      //       style: TextStyle(
      //         fontSize: 24,
      //         fontWeight: FontWeight.bold,
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
