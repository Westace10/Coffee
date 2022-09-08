// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_new/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  final AuthService _auth = AuthService();
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    // _tabController.animateTo(2);
  }

  @override
  Widget build(BuildContext context) {
    final brew = Provider.of<QuerySnapshot?>(context);
    print(brew);
    return Container(
      child: ListView(
        children: [
          ListTile(
            title: Text("Hi, Akeem"),
            subtitle: Text("You have 5 tasks today"),
            trailing: InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Wrap(
                      children: [
                        ListTile(
                          title: Text("Are you about logging out?"),
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.logout,
                            color: Colors.red,
                          ),
                          title: Text('Logout'),
                          onTap: () async {
                            await _auth.signOut();
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              child: CircleAvatar(
                child: Icon(Icons.person),
              ),
            ),
          ),
          ListTile(
            title: Text("My goals"),
            trailing: Text("See all"),
          ),
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Card(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.55,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0,
                                    vertical: 4.0,
                                  ),
                                  child: Row(
                                    children: [
                                      Text("Get a job"),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0,
                                    vertical: 4.0,
                                  ),
                                  child: Row(
                                    children: [
                                      Text("1 month"),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.23,
                            child: Icon(
                              Icons.person,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          ListTile(
            title: Text("My habits"),
            trailing: Text("1/3"),
          ),
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    children: [
                      SizedBox(
                        width: 80,
                        height: 80,
                        child: Card(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.person,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Text("Home"),
                    ],
                  ),
                );
              },
            ),
          ),
          ListTile(
            title: Text("Tasks"),
            trailing: Text("0/5"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 10,
                child: TabBar(
                  indicatorSize: TabBarIndicatorSize.label,
                  controller: _tabController,
                  unselectedLabelColor: Colors.grey.withOpacity(0.5),
                  labelColor: Colors.black54,
                  labelPadding: EdgeInsets.zero,
                  tabs: [
                    Tab(
                      child: Text(
                        'Today',
                        // style: TextStyle(
                        //   fontSize: 12,
                        // ),
                      ),
                    ),
                    Tab(
                        child: Text(
                      'Tomorrow',
                      // style: TextStyle(
                      //   fontSize: 12,
                      // ),
                    )),
                    Tab(
                        child: Text(
                      'Week',
                      // style: TextStyle(
                      //   fontSize: 12,
                      // ),
                    )),
                    Tab(
                        child: Text(
                      'Team',
                      // style: TextStyle(
                      //   fontSize: 12,
                      // ),
                    )),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12.0,
                        // vertical: 4.0,
                      ),
                      child: Text("See all"),
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 200,
            child: TabBarView(
              controller: _tabController,
              children: [
                SizedBox(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Card(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.78,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0,
                                          vertical: 4.0,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("Create application"),
                                            Text("3 days"),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0,
                                          vertical: 4.0,
                                        ),
                                        child: Row(
                                          children: [
                                            Text("16/30 missions"),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0,
                                          vertical: 4.0,
                                        ),
                                        child: Row(
                                          children: [
                                            Stack(
                                              children: [
                                                Container(
                                                  width: 25,
                                                  margin: EdgeInsets.only(
                                                    left: 0,
                                                  ),
                                                  child: CircleAvatar(
                                                    backgroundColor:
                                                        Colors.grey,
                                                    child: Icon(
                                                      Icons.person,
                                                      size: 18,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  width: 25,
                                                  margin: EdgeInsets.only(
                                                    left: 15,
                                                  ),
                                                  child: CircleAvatar(
                                                    backgroundColor:
                                                        Colors.yellow,
                                                    child: Icon(
                                                      Icons.person,
                                                      size: 18,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  width: 25,
                                                  margin: EdgeInsets.only(
                                                    left: 30,
                                                  ),
                                                  child: CircleAvatar(
                                                    backgroundColor: Colors.red,
                                                    child: Icon(
                                                      Icons.person,
                                                      size: 18,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  width: 25,
                                                  margin: EdgeInsets.only(
                                                    left: 45,
                                                  ),
                                                  child: CircleAvatar(
                                                    backgroundColor:
                                                        Colors.black,
                                                    child: Icon(
                                                      Icons.person,
                                                      size: 18,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 8.0,
                                              ),
                                              child: Text("Team"),
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0,
                                          vertical: 4.0,
                                        ),
                                        child: Row(
                                          children: [
                                            Icon(Icons.timelapse),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 6.0,
                                              ),
                                              child:
                                                  Text("12:00 PM to 12:30 PM"),
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0,
                                          vertical: 4.0,
                                        ),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                    horizontal: 6.0,
                                                  ),
                                                  child: Text("53%"),
                                                )
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                LinearPercentIndicator(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 3),
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.74,
                                                  lineHeight: 14.0,
                                                  percent: 0.55,
                                                  barRadius:
                                                      Radius.circular(30),
                                                  backgroundColor: Colors.grey
                                                      .withOpacity(0.5),
                                                  linearGradient:
                                                      LinearGradient(
                                                    begin: Alignment.topRight,
                                                    end: Alignment.bottomLeft,
                                                    colors: [
                                                      Colors.blue,
                                                      Colors.red,
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Card(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.78,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0,
                                          vertical: 4.0,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("Create application"),
                                            Text("3 days"),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0,
                                          vertical: 4.0,
                                        ),
                                        child: Row(
                                          children: [
                                            Text("16/30 missions"),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0,
                                          vertical: 4.0,
                                        ),
                                        child: Row(
                                          children: [
                                            Stack(
                                              children: [
                                                Container(
                                                  width: 25,
                                                  margin: EdgeInsets.only(
                                                    left: 0,
                                                  ),
                                                  child: CircleAvatar(
                                                    backgroundColor:
                                                        Colors.grey,
                                                    child: Icon(
                                                      Icons.person,
                                                      size: 18,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  width: 25,
                                                  margin: EdgeInsets.only(
                                                    left: 15,
                                                  ),
                                                  child: CircleAvatar(
                                                    backgroundColor:
                                                        Colors.yellow,
                                                    child: Icon(
                                                      Icons.person,
                                                      size: 18,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  width: 25,
                                                  margin: EdgeInsets.only(
                                                    left: 30,
                                                  ),
                                                  child: CircleAvatar(
                                                    backgroundColor: Colors.red,
                                                    child: Icon(
                                                      Icons.person,
                                                      size: 18,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  width: 25,
                                                  margin: EdgeInsets.only(
                                                    left: 45,
                                                  ),
                                                  child: CircleAvatar(
                                                    backgroundColor:
                                                        Colors.black,
                                                    child: Icon(
                                                      Icons.person,
                                                      size: 18,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 8.0,
                                              ),
                                              child: Text("Team"),
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0,
                                          vertical: 4.0,
                                        ),
                                        child: Row(
                                          children: [
                                            Icon(Icons.timelapse),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 6.0,
                                              ),
                                              child:
                                                  Text("12:00 PM to 12:30 PM"),
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0,
                                          vertical: 4.0,
                                        ),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                    horizontal: 6.0,
                                                  ),
                                                  child: Text("53%"),
                                                )
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                LinearPercentIndicator(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 3),
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.74,
                                                  lineHeight: 14.0,
                                                  percent: 0.55,
                                                  barRadius:
                                                      Radius.circular(30),
                                                  backgroundColor: Colors.grey
                                                      .withOpacity(0.5),
                                                  linearGradient:
                                                      LinearGradient(
                                                    begin: Alignment.topRight,
                                                    end: Alignment.bottomLeft,
                                                    colors: [
                                                      Colors.blue,
                                                      Colors.red,
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Card(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.78,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0,
                                          vertical: 4.0,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("Create application"),
                                            Text("3 days"),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0,
                                          vertical: 4.0,
                                        ),
                                        child: Row(
                                          children: [
                                            Text("16/30 missions"),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0,
                                          vertical: 4.0,
                                        ),
                                        child: Row(
                                          children: [
                                            Stack(
                                              children: [
                                                Container(
                                                  width: 25,
                                                  margin: EdgeInsets.only(
                                                    left: 0,
                                                  ),
                                                  child: CircleAvatar(
                                                    backgroundColor:
                                                        Colors.grey,
                                                    child: Icon(
                                                      Icons.person,
                                                      size: 18,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  width: 25,
                                                  margin: EdgeInsets.only(
                                                    left: 15,
                                                  ),
                                                  child: CircleAvatar(
                                                    backgroundColor:
                                                        Colors.yellow,
                                                    child: Icon(
                                                      Icons.person,
                                                      size: 18,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  width: 25,
                                                  margin: EdgeInsets.only(
                                                    left: 30,
                                                  ),
                                                  child: CircleAvatar(
                                                    backgroundColor: Colors.red,
                                                    child: Icon(
                                                      Icons.person,
                                                      size: 18,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  width: 25,
                                                  margin: EdgeInsets.only(
                                                    left: 45,
                                                  ),
                                                  child: CircleAvatar(
                                                    backgroundColor:
                                                        Colors.black,
                                                    child: Icon(
                                                      Icons.person,
                                                      size: 18,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 8.0,
                                              ),
                                              child: Text("Team"),
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0,
                                          vertical: 4.0,
                                        ),
                                        child: Row(
                                          children: [
                                            Icon(Icons.timelapse),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 6.0,
                                              ),
                                              child:
                                                  Text("12:00 PM to 12:30 PM"),
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0,
                                          vertical: 4.0,
                                        ),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                    horizontal: 6.0,
                                                  ),
                                                  child: Text("53%"),
                                                )
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                LinearPercentIndicator(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 3),
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.74,
                                                  lineHeight: 14.0,
                                                  percent: 0.55,
                                                  barRadius:
                                                      Radius.circular(30),
                                                  backgroundColor: Colors.grey
                                                      .withOpacity(0.5),
                                                  linearGradient:
                                                      LinearGradient(
                                                    begin: Alignment.topRight,
                                                    end: Alignment.bottomLeft,
                                                    colors: [
                                                      Colors.blue,
                                                      Colors.red,
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Card(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.78,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0,
                                          vertical: 4.0,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("Create application"),
                                            Text("3 days"),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0,
                                          vertical: 4.0,
                                        ),
                                        child: Row(
                                          children: [
                                            Text("16/30 missions"),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0,
                                          vertical: 4.0,
                                        ),
                                        child: Row(
                                          children: [
                                            Stack(
                                              children: [
                                                Container(
                                                  width: 25,
                                                  margin: EdgeInsets.only(
                                                    left: 0,
                                                  ),
                                                  child: CircleAvatar(
                                                    backgroundColor:
                                                        Colors.grey,
                                                    child: Icon(
                                                      Icons.person,
                                                      size: 18,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  width: 25,
                                                  margin: EdgeInsets.only(
                                                    left: 15,
                                                  ),
                                                  child: CircleAvatar(
                                                    backgroundColor:
                                                        Colors.yellow,
                                                    child: Icon(
                                                      Icons.person,
                                                      size: 18,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  width: 25,
                                                  margin: EdgeInsets.only(
                                                    left: 30,
                                                  ),
                                                  child: CircleAvatar(
                                                    backgroundColor: Colors.red,
                                                    child: Icon(
                                                      Icons.person,
                                                      size: 18,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  width: 25,
                                                  margin: EdgeInsets.only(
                                                    left: 45,
                                                  ),
                                                  child: CircleAvatar(
                                                    backgroundColor:
                                                        Colors.black,
                                                    child: Icon(
                                                      Icons.person,
                                                      size: 18,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 8.0,
                                              ),
                                              child: Text("Team"),
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0,
                                          vertical: 4.0,
                                        ),
                                        child: Row(
                                          children: [
                                            Icon(Icons.timelapse),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 6.0,
                                              ),
                                              child:
                                                  Text("12:00 PM to 12:30 PM"),
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0,
                                          vertical: 4.0,
                                        ),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                    horizontal: 6.0,
                                                  ),
                                                  child: Text("53%"),
                                                )
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                LinearPercentIndicator(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 3),
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.74,
                                                  lineHeight: 14.0,
                                                  percent: 0.55,
                                                  barRadius:
                                                      Radius.circular(30),
                                                  backgroundColor: Colors.grey
                                                      .withOpacity(0.5),
                                                  linearGradient:
                                                      LinearGradient(
                                                    begin: Alignment.topRight,
                                                    end: Alignment.bottomLeft,
                                                    colors: [
                                                      Colors.blue,
                                                      Colors.red,
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
