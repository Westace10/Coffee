// ignore_for_file: must_be_immutable, sized_box_for_whitespace, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class AppButtons extends StatelessWidget {
  double width;
  double height;
  final ButtonStyle buttonstyle;
  final void Function()? onPressed;
  final Widget child;
  AppButtons({
    Key? key,
    required this.width,
    required this.height,
    required this.buttonstyle,
    required this.onPressed,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextButton(
        style: buttonstyle,
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}

class ChipButtons extends StatelessWidget {
  double? width;
  double? height;
  final void Function()? onPressed;
  IconData? icon;
  final String buttonName;
  final String buttonType;
  TextStyle? buttonStyle;
  Color? buttonColor;
  Color? buttonTextColor;
  Color? buttonIconColor;
  Color? buttonBorderColor;
  double? buttonBorderRadius;
  double? buttonIconSize;
  ChipButtons({
    Key? key,
    this.width,
    this.height,
    this.onPressed,
    this.icon,
    this.buttonStyle,
    required this.buttonName,
    required this.buttonType,
    this.buttonColor,
    this.buttonTextColor,
    this.buttonIconColor,
    this.buttonBorderColor,
    this.buttonBorderRadius,
    this.buttonIconSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed ?? () {},
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
              color: buttonBorderColor ?? buttonColor ?? Colors.white),
          borderRadius: BorderRadius.circular(buttonBorderRadius ?? 24),
          color: buttonColor ?? Colors.blue,
        ),
        width: width ?? 90,
        height: height ?? 40,
        child: buttonType == "normal"
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    buttonName,
                    style: buttonStyle ??
                        TextStyle(
                          color: Colors.white,
                        ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Icon(
                      icon ?? Icons.arrow_forward,
                      color: buttonIconColor ?? Colors.white,
                      size: buttonIconSize ?? 20,
                    ),
                  ),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Icon(
                      icon ?? Icons.arrow_back,
                      color: buttonIconColor ?? Colors.white,
                      size: buttonIconSize ?? 20,
                    ),
                  ),
                  Text(
                    buttonName,
                    style: buttonStyle ??
                        TextStyle(
                          color: Colors.white,
                        ),
                  ),
                ],
              ),
      ),
    );
  }
}

class QuestionWithTextButtons extends StatelessWidget {
  final void Function()? onPressed;
  final String questionText;
  final String buttonText;
  TextStyle? questionTextStyle;
  TextStyle? buttonTextStyle;
  MainAxisAlignment? rowAlignment;
  EdgeInsetsGeometry? paddingValue;
  QuestionWithTextButtons({
    Key? key,
    this.onPressed,
    required this.questionText,
    required this.buttonText,
    this.questionTextStyle,
    this.buttonTextStyle,
    this.rowAlignment,
    this.paddingValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: rowAlignment ?? MainAxisAlignment.start,
      children: [
        Text(
          questionText,
          style: questionTextStyle ??
              TextStyle(
                fontFamily: 'AppleGothic',
                fontSize: 12.5,
              ),
        ),
        Padding(
          padding: paddingValue ??
              EdgeInsets.symmetric(
                horizontal: 5.0,
              ),
          child: InkWell(
            child: Text(
              buttonText,
              style: buttonTextStyle ??
                  TextStyle(
                    fontFamily: 'AppleGothic',
                    color: Colors.blue,
                    fontSize: 12.5,
                  ),
            ),
            onTap: onPressed ?? () {},
          ),
        )
      ],
    );
  }
}
