// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class PasswordInput extends StatelessWidget {
  final bool inputSwitch;
  double width;
  final AutovalidateMode autovalidate;
  final Color cursorColor;
  final List<TextInputFormatter> inputFormater;
  final TextStyle textStyle;
  final bool obsucreText;
  final TextCapitalization textCap;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final InputBorder focusedBorder;
  final InputBorder enabledBorder;
  final InputBorder focusedErrorBorder;
  final InputBorder errorBorder;
  final String labelText;
  final String errorText;
  final TextStyle labelStyle;
  final dynamic suffixicon;
  final Pattern regexPattern;
  final TextEditingController controller;
  final void Function(String?)? onSaved;

  PasswordInput({
    Key? key,
    required this.inputSwitch,
    required this.width,
    required this.autovalidate,
    required this.cursorColor,
    required this.inputFormater,
    required this.textStyle,
    required this.obsucreText,
    required this.textCap,
    required this.inputType,
    required this.inputAction,
    required this.focusedBorder,
    required this.enabledBorder,
    required this.focusedErrorBorder,
    required this.errorBorder,
    required this.labelText,
    required this.errorText,
    required this.labelStyle,
    required this.suffixicon,
    required this.regexPattern,
    required this.controller,
    this.onSaved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextFormField(
        enabled: inputSwitch,
        controller: controller,
        autovalidateMode: autovalidate,
        cursorColor: cursorColor,
        inputFormatters: inputFormater,
        style: textStyle,
        textCapitalization: textCap,
        obscureText: obsucreText,
        keyboardType: inputType,
        decoration: InputDecoration(
          focusedBorder: focusedBorder,
          enabledBorder: enabledBorder,
          disabledBorder: enabledBorder,
          focusedErrorBorder: focusedErrorBorder,
          errorBorder: errorBorder,
          labelStyle: labelStyle,
          labelText: labelText,
          suffixIcon: suffixicon,
        ),
        textInputAction: inputAction,
        validator: (value) {
          Pattern pattern = regexPattern;
          RegExp regex = RegExp(pattern.toString());
          if (!regex.hasMatch(value.toString())) {
            return errorText;
          } else {
            return null;
          }
        },
        onSaved: onSaved,
      ),
    );
  }
}
