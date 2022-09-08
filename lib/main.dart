// ignore_for_file: prefer_const_constructors

import 'package:coffee_new/models/user.dart';
import 'package:coffee_new/screens/create/goal/goal.dart';
import 'package:coffee_new/screens/create/notes/notes.dart';
import 'package:coffee_new/screens/create/task/task.dart';
import 'package:coffee_new/screens/intro/splash.dart';
import 'package:coffee_new/services/auth.dart';
import 'package:coffee_new/services/theme/theme_constant.dart';
import 'package:coffee_new/services/theme/theme_manager.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/create/habit/habit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

ThemeManager _themeManager = ThemeManager();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyAppAssist();
  }
}

class MyAppAssist extends StatefulWidget {
  const MyAppAssist({Key? key}) : super(key: key);

  @override
  State<MyAppAssist> createState() => _MyAppAssistState();
}

class _MyAppAssistState extends State<MyAppAssist> {
  @override
  void dispose() {
    _themeManager.removeListener(themeListener);
    super.dispose();
  }

  @override
  void initState() {
    _themeManager.addListener(themeListener);
    super.initState();
  }

  themeListener() {
    if (mounted) {
      setState(() {});
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<CustomUser?>.value(
      value: AuthService().user,
      initialData: CustomUser(uid: ""),
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => Splash(),
          '/createGoal': (context) => CreateGoal(),
          '/createHabit': (context) => CreateHabit(),
          '/createTask': (context) => CreateTask(),
          '/createNotes': (context) => CreateNotes(),
        },
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: _themeManager.themeMode,
        // home: Splash(),
      ),
    );
  }
}
