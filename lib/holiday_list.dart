import 'package:flutter/material.dart';
import 'package:holiday_planner/holiday_card.dart';
import 'package:holiday_planner/holiday_provider.dart';
import 'package:holiday_planner/model/holiday_model.dart';
import 'package:provider/provider.dart';

class HolidayList extends StatelessWidget {
  const HolidayList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HolidayProvider>(
      builder: (context, holidayProvider, _) {
        List<HolidayModel> holidays = holidayProvider.holidays;
        return ListView.builder(
          padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
          itemCount: holidays.length,
          itemBuilder: (context, index) {
            return HolidayCard(holiday: holidays[index]);
          },
        );
      },
    );
  }
}
