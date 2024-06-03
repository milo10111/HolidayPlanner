import 'package:flutter/material.dart';
import 'package:holiday_planner/model/holiday_model.dart';
import 'package:holiday_planner/navigation.dart';
import 'package:localstorage/localstorage.dart';

late final ValueNotifier<HolidayModel> holidayNotifier;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initLocalStorage();

  holidayNotifier = ValueNotifier(
      localStorage.getItem("holiday") as HolidayModel? ??
          HolidayModel.example());
  holidayNotifier.addListener(() {
    localStorage.setItem("holiday", holidayNotifier.value.toString());
  });

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(
        useMaterial3: true,
      ),
      themeMode: ThemeMode.dark,
      home: Navigation(),
    );
  }
}
