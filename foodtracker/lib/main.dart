import 'package:flutter/material.dart';
import 'package:foodtracker/widgets/bottomNav.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "FoodTracker",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.amber, // main brand color
          brightness: Brightness.light,
        ),
        useMaterial3: true, // enables rounded Material 3 widgets

        appBarTheme: AppBarTheme(
          backgroundColor: Colors.amber[700],
          foregroundColor: Colors.white,
          centerTitle: true,
          elevation: 0,
        ),

        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: Colors.amber[700],
          unselectedItemColor: Colors.grey[600],
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          elevation: 8,
        ),

        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.amber[50],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
            borderSide: BorderSide.none,
          ),
          hintStyle: TextStyle(color: Colors.grey[600]),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16,
          ),
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.amber[700],
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          ),
        ),
      ),
      home: const CustomBottomNav(),
    );
  }
}
