// ignore_for_file: avoid_print, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class BrewList extends StatefulWidget {
  const BrewList({Key? key}) : super(key: key);

  @override
  State<BrewList> createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  @override
  Widget build(BuildContext context) {
    final brew = Provider.of<QuerySnapshot?>(context);

    for (var doc in brew!.docs) {
      print(doc.data());
    }
    return Container(
      child: Text(brew.docs[0].id),
    );
  }
}
