import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:holiday_planner/model/holiday_model.dart';
import 'package:localstorage/localstorage.dart';

class HolidayProvider extends ChangeNotifier {
  late List<HolidayModel> _holidays;

  HolidayProvider() {
    _initHolidays();
  }

  void _initHolidays() {
    if (localStorage.getItem("holidays") == null) {
      _holidays = HolidayModel.exampleList();
      setHolidaysToLocalstorage();
    } else {
      getHolidaysFromLocalstorage();
    }
    notifyListeners();
  }

  void getHolidaysFromLocalstorage() =>
      _holidays = jsonDecode(localStorage.getItem("holidays") as String)
          .map<HolidayModel>((holiday) => HolidayModel.fromJson(holiday))
          .toList();

  void setHolidaysToLocalstorage() {
    var json =
        _holidays.map((holiday) => HolidayModel.toJson(holiday)).toList();
    localStorage.setItem("holidays", jsonEncode(json).toString());
  }

  get holidays => _holidays;

  HolidayModel getHolidayModelById(String id) {
    return _holidays.firstWhere((holiday) => holiday.hashCode.toString() == id);
  }

  void updateHolidays(HolidayModel newHolidayModel) {
    _holidays.forEach((holiday) {
      if (holiday.hashCode == newHolidayModel.hashCode) {
        holiday.name = newHolidayModel.name;
        holiday.startDate = newHolidayModel.startDate;
        holiday.endDate = newHolidayModel.endDate;
        holiday.imageURL = newHolidayModel.imageURL;
      }
    });
    setHolidaysToLocalstorage();
    notifyListeners();
  }

  void createHoliday(HolidayModel holidayModel) {
    _holidays.add(holidayModel);
    setHolidaysToLocalstorage();
    notifyListeners();
  }

  void deleteHoliday(String id) {
    _holidays.removeWhere((holiday) => holiday.hashCode.toString() == id);
    setHolidaysToLocalstorage();
    notifyListeners();
  }
}
