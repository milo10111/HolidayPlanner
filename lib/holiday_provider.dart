import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:holiday_planner/model/holiday_model.dart';
import 'package:localstorage/localstorage.dart';

class HolidayProvider extends ChangeNotifier {
  late List<HolidayModel> _holidays;

  HolidayProvider() {
    _holidays = [];
    readHolidaysFromStorage();
  }

  void sortHolidayEvents() {
    for (var holiday in _holidays) {
      holiday.events.sort((a, b) => a.date.compareTo(b.date));
    }
  }

  void readHolidaysFromStorage() {
    var storedHolidays = localStorage.getItem("holidays");
    if (storedHolidays == null) {
      _holidays = HolidayModel.exampleList();
      writeHolidaysToStorage();
    } else {
      _holidays = jsonDecode(storedHolidays)
          .map<HolidayModel>((holiday) => HolidayModel.fromJson(holiday))
          .toList();
    }
    sortHolidayEvents();
    notifyListeners();
  }

  void writeHolidaysToStorage() {
    var json =
        _holidays.map((holiday) => HolidayModel.toJson(holiday)).toList();
    localStorage.setItem("holidays", jsonEncode(json).toString());
  }

  get holidays => _holidays;

  HolidayModel getHolidayModelById(String id) {
    return _holidays.firstWhere((holiday) => holiday.hashCode.toString() == id);
  }

  void updateHolidays(HolidayModel newHolidayModel) {
    for (var holiday in _holidays) {
      if (holiday.hashCode == newHolidayModel.hashCode) {
        holiday.name = newHolidayModel.name;
        holiday.startDate = newHolidayModel.startDate;
        holiday.endDate = newHolidayModel.endDate;
        holiday.imageURL = newHolidayModel.imageURL;
        holiday.events = newHolidayModel.events;
      }
    }
    writeHolidaysToStorage();
    notifyListeners();
  }

  void createHoliday(HolidayModel holidayModel) {
    _holidays.add(holidayModel);
    writeHolidaysToStorage();
    notifyListeners();
  }

  void deleteHoliday(String id) {
    _holidays.removeWhere((holiday) => holiday.hashCode.toString() == id);
    writeHolidaysToStorage();
    notifyListeners();
  }
}
