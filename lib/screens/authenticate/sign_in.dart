// ignore_for_file: avoid_print, prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use

import 'package:coffee_new/models/user.dart';
import 'package:coffee_new/services/auth.dart';
import 'package:coffee_new/services/formatter/string_extension.dart';
import 'package:coffee_new/components/app_button.dart';
import 'package:coffee_new/components/app_input.dart';
import 'package:coffee_new/components/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignIn extends StatefulWidget {
  final Function? toggleView;
  final BuildContext? context;

  const SignIn({
    Key? key,
    this.toggleView,
    this.context,
  }) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  bool _obscureText = false;
  bool _inputSwitch = true;
  final GlobalKey<FormState> _formKey = GlobalKey();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String error = "";

  // Functions to be moved later
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.white,
        body: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 0.0,
            vertical: 0.0,
          ),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 80,
                      width: 50,
                      child: Image.asset(
                        'assets/Lenns/Lenns.001.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
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
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      child: Text(
                        "Log in with your email",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'AppleGothic',
                          color: Colors.black45,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                  ),
                  child: PasswordInput(
                    controller: emailController,
                    inputSwitch: _inputSwitch,
                    width: MediaQuery.of(context).size.width * 0.9,
                    errorText: "Invalid email characters",
                    autovalidate: AutovalidateMode.onUserInteraction,
                    cursorColor: Colors.grey,
                    inputFormater: [
                      FilteringTextInputFormatter.allow(
                        RegExp('[a-zA-Z0-9!.@]'),
                      )
                    ],
                    textStyle: TextStyle(
                      fontSize: 12.5,
                    ),
                    textCap: TextCapitalization.none,
                    inputType: TextInputType.emailAddress,
                    inputAction: TextInputAction.next,
                    obsucreText: false,
                    suffixicon: null,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          12.0,
                        ),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(
                        color: Colors.grey.shade300,
                        width: 1.0,
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 1.0,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 1.0,
                      ),
                    ),
                    labelText: "Email Address",
                    labelStyle: TextStyle(
                      fontFamily: 'AppleGothic',
                      color: Colors.black45,
                      fontSize: 12.5,
                    ),
                    regexPattern:
                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,3}))$',
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                  ),
                  child: PasswordInput(
                    controller: passwordController,
                    inputSwitch: _inputSwitch,
                    errorText: "Invalid password characters",
                    width: MediaQuery.of(context).size.width * 0.9,
                    autovalidate: AutovalidateMode.onUserInteraction,
                    cursorColor: Colors.grey,
                    inputFormater: [],
                    textStyle: TextStyle(
                      fontSize: 12.5,
                    ),
                    textCap: TextCapitalization.none,
                    inputType: TextInputType.visiblePassword,
                    inputAction: TextInputAction.next,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          12.0,
                        ),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(
                        color: Colors.grey.shade300,
                        width: 1.0,
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 1.0,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 1.0,
                      ),
                    ),
                    labelText: "Password",
                    labelStyle: TextStyle(
                      fontFamily: 'AppleGothic',
                      color: Colors.black45,
                      fontSize: 12.5,
                    ),
                    suffixicon: IconButton(
                      onPressed: _toggle,
                      icon: Icon(
                        _obscureText ? Icons.visibility : Icons.visibility_off,
                        size: 15,
                        color: _obscureText ? Colors.blue : Colors.grey,
                      ),
                    ),
                    obsucreText: _obscureText,
                    regexPattern: r'[a-zA-Z0-9!@#$%^&*(),.?":{}|<>]{6}$',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 0.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: _inputSwitch
                            ? () {
                                // can perform an action
                                print("can perform an action");
                              }
                            : () {
                                // blocked
                                print("blocked");
                              },
                        child: Text(
                          "Forgot password",
                          style: TextStyle(
                            fontFamily: 'AppleGothic',
                            color: Colors.blue,
                            fontSize: 12.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      error.toString().inCaps,
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                  ),
                  child: AppButtons(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.075,
                    buttonstyle: TextButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                      primary: Colors.white,
                      backgroundColor: (passwordController.text.length > 6 ||
                                  passwordController.text.length == 6) &&
                              emailController.text.contains(".") &&
                              emailController.text.contains("@")
                          ? Colors.blue
                          : Colors.grey.shade300,
                    ),
                    onPressed: _inputSwitch
                        ? () async {
                            if (_formKey.currentState!.validate()) {
                              print(emailController.text);
                              print(passwordController.text);
                              setState(() {
                                _inputSwitch = false;
                              });
                              try {
                                dynamic result = await _auth
                                    .signIn(
                                  email: emailController.text,
                                  password: passwordController.text,
                                )
                                    .timeout(
                                  Duration(milliseconds: 5000),
                                  onTimeout: (() {
                                    setState(
                                      () {
                                        _inputSwitch = true;
                                      },
                                    );
                                  }),
                                );
                                if (result.runtimeType != CustomUser) {
                                  setState(
                                    () {
                                      _inputSwitch = true;
                                    },
                                  );
                                  final snackBar = SnackBar(
                                    behavior: SnackBarBehavior.floating,
                                    content:
                                        Text(result.toString().split("] ")[1]),
                                    // action: SnackBarAction(
                                    //   label: 'Action',
                                    //   onPressed: () {},
                                    // ),
                                  );

                                  // Find the Scaffold in the widget tree and use
                                  // it to show a SnackBar.
                                  _scaffoldKey.currentState!
                                      .showSnackBar(snackBar);
                                  print("Result here: $result");
                                }
                              } catch (e) {
                                print(e);
                              }
                            }
                          }
                        : () {
                            // blocked
                            print("blocked");
                          },
                    child: _inputSwitch
                        ? Text(
                            'Login',
                          )
                        : Loading(),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      child: Text(
                        "or",
                        style: TextStyle(
                          fontSize: 16,
                          // fontWeight: FontWeight.bold,
                          fontFamily: 'AppleGothic',
                          color: Colors.black45,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: _inputSwitch
                          ? () {
                              // can perform an action
                              print("can perform an action");
                            }
                          : () {
                              // blocked
                              print("blocked");
                            },
                      icon: Image.asset(
                        "assets/Lenns/google.png",
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    IconButton(
                      onPressed: _inputSwitch
                          ? () async {
                              dynamic result = await _auth.signInAnon();
                              if (result == null) {
                                print('error signing in');
                              } else {
                                print('signed in');
                                print(result.uid);
                              }
                            }
                          : () {
                              // blocked
                              print("blocked");
                            },
                      icon: Image.asset(
                        "assets/Lenns/hacker.png",
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    IconButton(
                      onPressed: _inputSwitch
                          ? () {
                              // can perform an action
                              print("can perform an action");
                            }
                          : () {
                              // blocked
                              print("blocked");
                            },
                      icon: Image.asset(
                        "assets/Lenns/facebook.png",
                      ),
                    )
                  ],
                ),
                Divider(
                  thickness: 1.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 12.0,
                  ),
                  child: QuestionWithTextButtons(
                    questionText: "Don't have an account?",
                    buttonText: "Join",
                    onPressed: _inputSwitch
                        ? () {
                            // can perform an action
                            widget.toggleView!();

                            print("can perform an action");
                          }
                        : () {
                            // blocked
                            print("blocked");
                          },
                  ),
                ),
              ],
            ),
          ),
          // child: ElevatedButton(
          //   onPressed: () async {
          //     dynamic result = await _auth.signInAnon();
          //     if (result == null) {
          //       print('error signing in');
          //     } else {
          //       print('signed in');
          //       print(result.uid);
          //     }
          //   },
          //   child: const Text("Sign in anonymously"),
          // ),
        ),
      ),
    );
  }
}
