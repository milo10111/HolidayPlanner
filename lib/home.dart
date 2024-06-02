import 'package:flutter/material.dart';
import 'package:holiday_planner/holiday_card.dart';
import 'package:holiday_planner/holiday_create_view.dart';
import 'package:holiday_planner/holiday_list.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('My holiday plans'),
        ),
        body: HolidayList(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) =>  VacationForm()),
    
  );
          },
          child: const Icon(Icons.add),
        ));
  }
}
