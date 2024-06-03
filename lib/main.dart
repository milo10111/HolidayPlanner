import 'package:flutter/material.dart';
import 'package:holiday_planner/navigation.dart';
import 'package:provider/provider.dart';
import 'package:holiday_planner/holiday_provider.dart';
import 'package:localstorage/localstorage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initLocalStorage();
  runApp(
    ChangeNotifierProvider(
      create: (context) => HolidayProvider(),
      child: const MainApp(),
    ),
  );
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
