import 'package:flutter/material.dart';
import 'package:holiday_planner/navigation.dart';
import 'package:provider/provider.dart';
import 'package:holiday_planner/holiday_provider.dart';
import 'package:localstorage/localstorage.dart';

// REVIEW (OVERALL):
// - functionallity to add personal images would be great!
// - I think there should be no possibility to choose event date that's not included in the holiday period.
// - there's an unhandled exception thrown when using gestures on 'calendar' tab/page.
// - 'settings' and 'logout' functionalities are missing, I see it's not implemented yet

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
      // REVIEW: Should be const
    );
  }
}
