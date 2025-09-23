import 'package:flutter/material.dart';
import 'package:foodtracker/pages/HomePage.dart';

class CustomBottomNav extends StatefulWidget {
  const CustomBottomNav({super.key});

  @override
  State<CustomBottomNav> createState() => _CustomBottomNavState();
}

class _CustomBottomNavState extends State<CustomBottomNav> {
  int _selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    Text('Index 1: Legg til', style: optionStyle),
    Text('Index 2: Profil', style: optionStyle),
    Text('Index 3: Kurv', style: optionStyle),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Hjem'),
          BottomNavigationBarItem(icon: Icon(Icons.add_circle_outline), label: 'Legg til'),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'Profil'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Kurv'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
