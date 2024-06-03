import 'package:flutter/material.dart';
import 'package:holiday_planner/event_list.dart';
import 'package:holiday_planner/event_create_view.dart';
import 'package:provider/provider.dart';
import 'package:holiday_planner/holiday_provider.dart';

class HolidayView extends StatelessWidget {
  final String holidayId;
  const HolidayView({Key? key, required this.holidayId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HolidayProvider>(
      builder: (context, holidayProvider, child) {
        var holiday = holidayProvider.getHolidayModelById(holidayId);
        return Scaffold(
          appBar: AppBar(
            title: ListTile(
              title: Text(holiday.name),
              subtitle: Text(
                  "${holiday.startDate.day}/${holiday.startDate.month}/${holiday.startDate.year} - ${holiday.endDate.day}/${holiday.endDate.month}/${holiday.endDate.year}"),
            ),
          ),
          body: EventList(events: holiday.events),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              // Navigate to the EventCreateView
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EventCreateView(holiday: holiday),
                ),
              );
            },
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
