import 'package:flutter/material.dart';
import 'package:holiday_planner/holiday_card.dart';
import 'package:holiday_planner/model/holiday_model.dart';

class HolidayList extends StatefulWidget {
  @override
  _HolidayListState createState() => _HolidayListState();
}

class _HolidayListState extends State<HolidayList> {
  List<HolidayModel> holidays = [];

  @override
  void initState() {
    super.initState();
    fetchHolidays();
  }

  void fetchHolidays() {
    holidays = HolidayModel.exampleList();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
      itemCount: holidays.length,
      itemBuilder: (context, index) {
        return HolidayCard(holiday: holidays[index]);
      },
    );
  }
}
