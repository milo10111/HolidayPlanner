import 'package:flutter/material.dart';
import 'package:holiday_planner/holiday_list.dart';
import 'package:holiday_planner/holiday_create_view.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('My holiday plans'),
        ),
        body: HolidayList(),
        // REVIEW: should be a const
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const HolidayCreateView()),
            );
          },
          child: const Icon(Icons.add),
        ));
  }
}
