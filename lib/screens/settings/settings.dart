// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Setting extends StatelessWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final brew = Provider.of<QuerySnapshot?>(context);
    print(brew);
    return Container(
      child: Text("Settings"),
    );
  }
}
