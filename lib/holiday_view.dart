import 'package:flutter/material.dart';
import 'package:holiday_planner/event_list.dart';
import 'package:holiday_planner/model/event_model.dart';
import 'package:holiday_planner/model/holiday_model.dart';

class HolidayView extends StatefulWidget {
  final HolidayModel holiday;
  const HolidayView({super.key, required this.holiday});

  @override
  _HolidayViewState createState() => _HolidayViewState();
}

class _HolidayViewState extends State<HolidayView> {
  HolidayModel get holiday => widget.holiday;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          title: Text(holiday.name),
          subtitle: Text(
              "${holiday.startDate.day}/${holiday.startDate.month}/${holiday.startDate.year} - ${holiday.endDate.day}/${holiday.endDate.month}/${holiday.endDate.year}"),
        ),
      ),
      body: EventList(events: EventModel.exampleList()),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
