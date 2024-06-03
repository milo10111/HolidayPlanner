import 'dart:math';

import 'package:holiday_planner/model/event_model.dart';

class HolidayModel {
  String name;
  DateTime startDate;
  DateTime endDate;
  String imageURL =
      "https://picsum.photos/seed/${Random().nextInt(10)}/200/300";
  List<EventModel> events;

  HolidayModel({
    required this.name,
    required this.startDate,
    required this.endDate,
    this.events = const [],
  });

  static HolidayModel example() {
    return HolidayModel(
      name: "Holiday in Paris",
      startDate: DateTime.parse("2022-12-24"),
      endDate: DateTime.parse("2022-12-27"),
    );
  }

  static List<HolidayModel> exampleList() {
    return [
      HolidayModel(
        name: "Holiday in Paris",
        startDate: DateTime.parse("2022-12-24"),
        endDate: DateTime.parse("2022-12-27"),
        events: EventModel.exampleList(),
      ),
      HolidayModel(
        name: "Holiday in London",
        startDate: DateTime.parse("2022-12-24"),
        endDate: DateTime.parse("2022-12-27"),
        events: EventModel.exampleList(),
      ),
      HolidayModel(
        name: "Holiday in New York",
        startDate: DateTime.parse("2022-12-24"),
        endDate: DateTime.parse("2022-12-27"),
      ),
    ];
  }

  static HolidayModel fromJson(Map<String, dynamic> holiday) {
    return HolidayModel(
      name: holiday["name"],
      startDate: DateTime.parse(holiday["startDate"]),
      endDate: DateTime.parse(holiday["endDate"]),
      events: (holiday["events"] as List)
          .map<EventModel>(
              (event) => EventModel.fromJson(event as Map<String, dynamic>))
          .toList(),
    );
  }

  static toJson(HolidayModel holiday) {
    return {
      "name": holiday.name,
      "startDate": holiday.startDate.toString(),
      "endDate": holiday.endDate.toString(),
      "events":
          holiday.events.map((event) => EventModel.toJson(event)).toList(),
    };
  }
}
