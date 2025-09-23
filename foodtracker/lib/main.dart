import 'package:flutter/material.dart';
import 'package:foodtracker/widgets/bottomNav.dart';

/// Flutter code sample for [BottomNavigationBar].

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "TEST",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const CustomBottomNav(),
      );
  }
}