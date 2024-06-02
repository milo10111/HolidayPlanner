import 'package:flutter/material.dart';
import 'package:holiday_planner/holiday_view.dart';
import 'package:holiday_planner/model/holiday_model.dart';
import 'package:holiday_planner/navigation.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
