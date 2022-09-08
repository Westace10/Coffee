// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  final bool? inputSwitch;
  double? size;
  final AutovalidateMode? autovalidate;
  final Color? kitColor;
  Loading({
    Key? key,
    this.inputSwitch,
    this.size,
    this.autovalidate,
    this.kitColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: SpinKitSpinningLines(
          color: kitColor ?? Colors.white,
          size: size ?? 30,
        ),
      ),
    );
  }
}
