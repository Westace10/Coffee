// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:coffee_new/widgets/sample_planner.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class Planner extends StatelessWidget {
  const Planner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final brew = Provider.of<QuerySnapshot?>(context);
    print(brew);
    return SizedBox(
      height: 300,
      child: SfCalendar(
        view: CalendarView.week,
      ),
    );
  }
}

// List<Appointment> getAppointment(){
//   List<Appointment> meetings = <Appointment>[];
//   final DateTime today = DateTime.now();
//   final DateTime startTime = DateTime(today.year)
// }

// class MeetingDataSource extends CalenderDataSource{
//   MeetingDataSource(List<Appointment> source){
//     appointments = source;
//   }
// }
