import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:holiday_planner/model/holiday_model.dart';
import 'package:localstorage/localstorage.dart';

class HolidayProvider extends ChangeNotifier {
  late List<HolidayModel> _holidays;

  HolidayProvider() {
    _initHolidays();
  }

  void _initHolidays() async {
    WidgetsFlutterBinding.ensureInitialized();
    await initLocalStorage();

    _holidays = localStorage.getItem("holidays") as List<HolidayModel>? ??
        HolidayModel.exampleList();

    notifyListeners();
  }

  List<HolidayModel> get holidays => _holidays;

  HolidayModel getHolidayModelById(String id) {
    return _holidays.firstWhere((holiday) => holiday.hashCode.toString() == id);
  }

  void updateHolidays(HolidayModel newHolidayModel) {
    _holidays.add(newHolidayModel);
    localStorage.setItem("holidays", _holidays.jsify().toString());
  }

  void createHoliday(HolidayModel holidayModel) {
    _holidays.add(holidayModel);
    localStorage.setItem("holidays", _holidays.jsify().toString());
    notifyListeners();
  }

  void deleteHoliday(String id) {
    _holidays.removeWhere((holiday) => holiday.hashCode.toString() == id);
    localStorage.setItem("holidays", _holidays.jsify().toString());
    notifyListeners();
  }
}
