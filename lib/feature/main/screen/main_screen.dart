import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
          label: 'Home',
          icon: Icon(FontAwesomeIcons.houseChimney),
        ),
          BottomNavigationBarItem(
          label: 'History',
          icon: Icon(FontAwesomeIcons.clockRotateLeft),
        ),
          BottomNavigationBarItem(
          label: 'Profile',
          icon: Icon(FontAwesomeIcons.person),
        ),
        ]
      ),
    );
  }
}
