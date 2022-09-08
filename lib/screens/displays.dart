// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_new/screens/home/home.dart';
import 'package:coffee_new/screens/notes/notes.dart';
import 'package:coffee_new/screens/planner/planner.dart';
import 'package:coffee_new/screens/settings/settings.dart';
// import 'package:coffee_new/services/auth.dart';
import 'package:coffee_new/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Displays extends StatefulWidget {
  const Displays({Key? key}) : super(key: key);

  @override
  State<Displays> createState() => _DisplaysState();
}

class _DisplaysState extends State<Displays> {
  // final AuthService _auth = AuthService();
  int currentIndex = 0;
  bool createButton = false;
  List<Widget> pages = [
    Home(),
    Planner(),
    Container(),
    Notes(),
    Setting(),
  ];
  void onItemTapped(
    BuildContext context,
    int index,
  ) {
    if (index == 2) {
      print("index 2");
      setState(() {
        createButton = true;
      });
      showDialog(
          context: context,
          builder: ((context) {
            return Align(
              alignment: Alignment(0, 1),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 25.0,
                ),
                child: Container(
                  // height: 200,
                  child: Material(
                    color: Colors.transparent,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 15.0,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 4.0,
                                  horizontal: 8.0,
                                ),
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      createButton = false;
                                    });
                                    Navigator.pop(context);
                                    Navigator.pushNamed(context, '/createGoal');
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.black,
                                    ),
                                    width: 150,
                                    height: 40,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 3.0),
                                          child: Icon(
                                            Icons.my_location,
                                            color: Colors.white,
                                            size: 14,
                                          ),
                                        ),
                                        Text(
                                          "Goal",
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 4.0,
                                  horizontal: 8.0,
                                ),
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      createButton = false;
                                    });
                                    Navigator.pop(context);
                                    Navigator.pushNamed(
                                        context, '/createHabit');
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.black,
                                    ),
                                    width: 150,
                                    height: 40,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 3.0),
                                          child: Icon(
                                            Icons.recycling,
                                            color: Colors.white,
                                            size: 14,
                                          ),
                                        ),
                                        Text(
                                          "Habit",
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 4.0,
                                  horizontal: 8.0,
                                ),
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      createButton = false;
                                    });
                                    Navigator.pop(context);
                                    Navigator.pushNamed(context, '/createTask');
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.black,
                                    ),
                                    width: 150,
                                    height: 40,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 3.0),
                                          child: Icon(
                                            Icons.format_list_bulleted_outlined,
                                            color: Colors.white,
                                            size: 14,
                                          ),
                                        ),
                                        Text(
                                          "Task",
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 4.0,
                                  horizontal: 8.0,
                                ),
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      createButton = false;
                                    });
                                    Navigator.pop(context);
                                    Navigator.pushNamed(
                                        context, '/createNotes');
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.black,
                                    ),
                                    width: 150,
                                    height: 40,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 3.0),
                                          child: Icon(
                                            Icons.edit,
                                            color: Colors.white,
                                            size: 14,
                                          ),
                                        ),
                                        Text(
                                          "Notes",
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              createButton = false;
                            });
                            Navigator.pop(context);
                          },
                          child: Stack(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.black,
                                child: Icon(
                                  Icons.close,
                                  color: Colors.white,
                                ),
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
          }));
      // showAboutDialog(
      //   context: context,
      // );
      // showModalBottomSheet(
      //   context: context,
      //   builder: (context) => Container(),
      // );
    } else {
      setState(() {
        createButton = false;
        currentIndex = index;
      });
    }
  }

  Widget showActionSheet(
    BuildContext context,
  ) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          15.0,
        ),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: customActionsheet(context),
    );
  }

  Widget customActionsheet(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.black,
          child: Center(
            child: Row(
              children: [
                Icon(Icons.menu),
                Text("Goal"),
              ],
            ),
          ),
        ),
        Container(
          color: Colors.black,
          child: Center(
            child: Row(
              children: [
                Icon(Icons.menu),
                Text("Goal"),
              ],
            ),
          ),
        ),
        Container(
          color: Colors.black,
          child: Center(
            child: Row(
              children: [
                Icon(Icons.menu),
                Text("Goal"),
              ],
            ),
          ),
        ),
        Container(
          color: Colors.black,
          child: Center(
            child: Row(
              children: [
                Icon(Icons.menu),
                Text("Goal"),
              ],
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot?>.value(
      value: DatabaseService().brews,
      initialData: null,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          // appBar: AppBar(
          //   title: Text('Coffee Brew'),
          //   backgroundColor: Colors.brown[400],
          //   elevation: 0.0,
          //   actions: [
          //     TextButton(
          //       onPressed: () async {
          //         await _auth.signOut();
          //       },
          //       child: Row(
          //         children: [
          //           Padding(
          //             padding: const EdgeInsets.all(5.0),
          //             child: Icon(
          //               Icons.person,
          //               size: 20,
          //             ),
          //           ),
          //           Text("Logout"),
          //         ],
          //       ),
          //       style: TextButton.styleFrom(
          //         primary: Colors.white,
          //       ),
          //     )
          //   ],
          // ),
          body: pages[currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex,
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.transparent,
            selectedItemColor:
                createButton ? Colors.grey.withOpacity(0.5) : Colors.black,
            unselectedItemColor: Colors.grey.withOpacity(0.5),
            selectedFontSize: 14,
            unselectedFontSize: 14,
            onTap: (value) {
              // Respond to item press.
              onItemTapped(context, value);
            },
            items: [
              BottomNavigationBarItem(
                label: '',
                icon: Icon(Icons.apps),
              ),
              BottomNavigationBarItem(
                label: '',
                icon: Icon(Icons.calendar_month),
              ),
              BottomNavigationBarItem(
                label: '',
                activeIcon: Stack(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.black,
                      child: Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                icon: Stack(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey.withOpacity(0.5),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                // icon: Container(),
              ),
              BottomNavigationBarItem(
                label: '',
                icon: Icon(Icons.format_list_numbered_rtl),
              ),
              BottomNavigationBarItem(
                label: '',
                icon: Icon(Icons.settings),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
