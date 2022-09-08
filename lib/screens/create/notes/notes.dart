// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateNotes extends StatelessWidget {
  const CreateNotes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final brew = Provider.of<QuerySnapshot?>(context);
    print(brew);
    return Scaffold(
      body: SafeArea(
        child: Text("Create notes"),
      ),
    );
  }
}
