import 'package:flutter/material.dart';
import 'package:expense_tracker_s5/widgets/expenses.dart';
import 'package:flutter/services.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 124, 27, 235),
);

var kDarkModeColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 11, 73, 84),
  brightness: Brightness.dark,
);

void main() {
  /* WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((
    fn,
  ) { */
  runApp(
    MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: kDarkModeColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kDarkModeColorScheme.primaryContainer,
          foregroundColor: kDarkModeColorScheme.onPrimaryContainer,
        ),
        cardTheme: CardTheme().copyWith(
          color: kDarkModeColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kDarkModeColorScheme.secondaryContainer,
          ),
        ),

        textTheme: ThemeData().textTheme.copyWith(
          titleLarge: TextStyle(
            color: kDarkModeColorScheme.secondary,
            fontWeight: FontWeight.bold,
          ),
          bodyMedium: TextStyle(
            color: kDarkModeColorScheme.onSecondaryContainer,
            fontWeight: FontWeight.normal,
          ),
          displayLarge: TextStyle(
            color: kDarkModeColorScheme.onSurface,
            fontSize: 20.00,
          ),
        ),
      ),
      theme: ThemeData().copyWith(
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.primaryContainer,
        ),
        cardTheme: CardTheme().copyWith(
          color: kColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.secondaryContainer,
          ),
        ),

        textTheme: ThemeData().textTheme.copyWith(
          titleLarge: TextStyle(
            color: kColorScheme.secondary,
            fontWeight: FontWeight.bold,
          ),
          bodyMedium: TextStyle(
            color: kColorScheme.onSecondaryContainer,
            fontWeight: FontWeight.normal,
          ),
          displayLarge: TextStyle(
            color: kColorScheme.onSurface,
            fontSize: 20.00,
          ),
        ),
      ),
      themeMode: ThemeMode.system,
      home: const Expenses(),
    ),
  );
}
