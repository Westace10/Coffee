// ignore_for_file: avoid_print, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields, deprecated_member_use

import 'package:coffee_new/models/user.dart';
import 'package:coffee_new/services/auth.dart';
import 'package:coffee_new/components/app_button.dart';
import 'package:coffee_new/components/app_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignUp extends StatefulWidget {
  final Function? toggleView;

  const SignUp({
    Key? key,
    this.toggleView,
  }) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final AuthService _auth = AuthService();
  bool _inputSwitch = true;
  final GlobalKey<FormState> _formKey = GlobalKey();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final PageController _pageController = PageController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController professionController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  // Functions to be moved later
  // void _toggle() {
  //   setState(() {
  //     _obscureText = !_obscureText;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        // resizeToAvoidBottomInset: false,
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
                  height: 10,
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
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      child: Text(
                        "Create your account",
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
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.65,
                  child: PageView(
                    controller: _pageController,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12.0,
                                  vertical: 5.0,
                                ),
                                child: PasswordInput(
                                  controller: firstNameController,
                                  inputSwitch: _inputSwitch,
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  errorText: "First name is required",
                                  autovalidate:
                                      AutovalidateMode.onUserInteraction,
                                  cursorColor: Colors.grey,
                                  inputFormater: [
                                    FilteringTextInputFormatter.allow(
                                      RegExp('[a-zA-Z]'),
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
                                  labelText: "First name",
                                  labelStyle: TextStyle(
                                    fontFamily: 'AppleGothic',
                                    color: Colors.black45,
                                    fontSize: 12.5,
                                  ),
                                  regexPattern: r'[a-zA-Z]{1,}$',
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
                                  controller: lastNameController,
                                  inputSwitch: _inputSwitch,
                                  errorText: "Last name is required",
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  autovalidate:
                                      AutovalidateMode.onUserInteraction,
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
                                  labelText: "Last name",
                                  labelStyle: TextStyle(
                                    fontFamily: 'AppleGothic',
                                    color: Colors.black45,
                                    fontSize: 12.5,
                                  ),
                                  suffixicon: null,
                                  obsucreText: false,
                                  regexPattern: r'[a-zA-Z]{1,}$',
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
                                  controller: professionController,
                                  inputSwitch: _inputSwitch,
                                  errorText: "Profession is required",
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  autovalidate:
                                      AutovalidateMode.onUserInteraction,
                                  cursorColor: Colors.grey,
                                  inputFormater: [],
                                  textStyle: TextStyle(
                                    fontSize: 12.5,
                                  ),
                                  textCap: TextCapitalization.none,
                                  inputType: TextInputType.text,
                                  inputAction: TextInputAction.next,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Theme.of(context).focusColor,
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
                                  labelText: "Profession",
                                  labelStyle: TextStyle(
                                    fontFamily: 'AppleGothic',
                                    color: Colors.black45,
                                    fontSize: 12.5,
                                  ),
                                  suffixicon: null,
                                  obsucreText: false,
                                  regexPattern: r'[a-zA-Z0-9 ]{3,}$',
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12.0,
                              vertical: 12.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0,
                                    vertical: 12.0,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      QuestionWithTextButtons(
                                        questionText:
                                            "Already have an account?",
                                        buttonText: "Login",
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
                                    ],
                                  ),
                                ),
                                ChipButtons(
                                  width: 100,
                                  height: 40,
                                  buttonName: "Next",
                                  buttonType: "normal",
                                  onPressed: (() {
                                    if (_formKey.currentState!.validate()) {
                                      print(firstNameController.text);
                                      print(lastNameController.text);
                                      print(professionController.text);
                                      _pageController.nextPage(
                                          duration: Duration(milliseconds: 300),
                                          curve: Curves.easeIn);
                                    }
                                  }),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12.0,
                                  vertical: 5.0,
                                ),
                                child: PasswordInput(
                                  controller: emailController,
                                  inputSwitch: _inputSwitch,
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  errorText: "Invalid email characters",
                                  autovalidate:
                                      AutovalidateMode.onUserInteraction,
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
                                  labelText: "Email address",
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
                                  controller: phoneController,
                                  inputSwitch: _inputSwitch,
                                  errorText: "Invalid password characters",
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  autovalidate:
                                      AutovalidateMode.onUserInteraction,
                                  cursorColor: Colors.grey,
                                  inputFormater: [],
                                  textStyle: TextStyle(
                                    fontSize: 12.5,
                                  ),
                                  textCap: TextCapitalization.none,
                                  inputType: TextInputType.number,
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
                                  labelText: "Phone",
                                  labelStyle: TextStyle(
                                    fontFamily: 'AppleGothic',
                                    color: Colors.black45,
                                    fontSize: 12.5,
                                  ),
                                  suffixicon: null,
                                  obsucreText: false,
                                  regexPattern: r'[0-9]{6}$',
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
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  autovalidate:
                                      AutovalidateMode.onUserInteraction,
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
                                  suffixicon: null,
                                  obsucreText: false,
                                  regexPattern:
                                      r'[a-zA-Z0-9!@#$%^&*(),.?":{}|<>]{6}$',
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
                                  controller: confirmPasswordController,
                                  inputSwitch: _inputSwitch,
                                  errorText: "Field cannot be blank",
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  autovalidate:
                                      AutovalidateMode.onUserInteraction,
                                  cursorColor: Colors.grey,
                                  inputFormater: [],
                                  textStyle: TextStyle(
                                    fontSize: 12.5,
                                  ),
                                  textCap: TextCapitalization.none,
                                  inputType: TextInputType.text,
                                  inputAction: TextInputAction.next,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Theme.of(context).focusColor,
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
                                  labelText: "Confrim password",
                                  labelStyle: TextStyle(
                                    fontFamily: 'AppleGothic',
                                    color: Colors.black45,
                                    fontSize: 12.5,
                                  ),
                                  suffixicon: Icon(Icons.visibility_off),
                                  obsucreText: false,
                                  regexPattern: r'[a-zA-Z0-9 ]{3,}$',
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12.0,
                              vertical: 12.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ChipButtons(
                                  width: 100,
                                  height: 40,
                                  buttonName: "Prev",
                                  buttonType: "reversed",
                                  onPressed: (() {
                                    _pageController.previousPage(
                                      duration: Duration(milliseconds: 300),
                                      curve: Curves.easeIn,
                                    );
                                  }),
                                ),
                                ChipButtons(
                                  width: 100,
                                  height: 40,
                                  buttonName: "Create",
                                  buttonType: "normal",
                                  onPressed: _inputSwitch
                                      ? () async {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            print(emailController.text);
                                            print(passwordController.text);
                                            print(professionController.text);
                                            setState(() {
                                              _inputSwitch = false;
                                            });
                                            try {
                                              dynamic result = await _auth
                                                  .registerWithEmailandPswd(
                                                firstname: firstNameController
                                                    .text
                                                    .toLowerCase(),
                                                lastName: lastNameController
                                                    .text
                                                    .toLowerCase(),
                                                phoneNumber:
                                                    phoneController.text,
                                                email: emailController.text
                                                    .toLowerCase(),
                                                password: passwordController
                                                    .text
                                                    .toLowerCase(),
                                                profession: professionController
                                                    .text
                                                    .toLowerCase(),
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
                                              if (result.runtimeType !=
                                                  CustomUser) {
                                                setState(
                                                  () {
                                                    _inputSwitch = true;
                                                  },
                                                );
                                                final snackBar = SnackBar(
                                                  behavior:
                                                      SnackBarBehavior.floating,
                                                  content: Text(result
                                                      .toString()
                                                      .split("] ")[1]),
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
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
