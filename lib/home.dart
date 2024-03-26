import 'package:flutter/material.dart';
import 'package:holiday_planner/holiday_card.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('My holiday plans'),
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          children: const <Widget>[
            HolidayCard(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Add your onPressed code here!
          },
          child: const Icon(Icons.add),
        ));
  }
}
