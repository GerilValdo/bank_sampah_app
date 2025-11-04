import 'package:auto_route/annotations.dart';
import 'package:bank_sampah_app/feature/dashboard/screen/dashboard_screen.dart';
import 'package:bank_sampah_app/feature/history/screen/history_screen.dart';
import 'package:bank_sampah_app/feature/profile/screen/profile_screen.dart';
import 'package:bank_sampah_app/feature/rewards/screen/rewards_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

@RoutePage()
class MainScreen extends StatefulWidget {
  const MainScreen({
    super.key,
    @PathParam('initialIndex') this.initialIndex = 0,
  });
  static const id = '/main';
  final int initialIndex;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late int _selectedIndex = 0;

  final List<Widget> _pages = const [
    DashboardScreen(),
    HistoryScreen(),
    RewardsScreen(),
    ProfileScreen(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFB),
      body: IndexedStack(index: _selectedIndex, children: _pages),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: GNav(
          selectedIndex: _selectedIndex,
          rippleColor: Colors.grey,
          tabActiveBorder: Border.all(color: Colors.green, width: 1),
          curve: Curves.linear,
          duration: Duration(milliseconds: 400),
          gap: 8,
          color: Colors.green[800],
          activeColor: Colors.white,
          iconSize: 24,
          tabBackgroundGradient: LinearGradient(
            colors: [Color(0xFF50C878).withValues(alpha: 0.7), Colors.teal],
          ),
          onTabChange: (value) {
            setState(() {
              _selectedIndex = value;
            });
          },
          tabs: [
            GButton(icon: FontAwesomeIcons.houseChimney, text: 'Home'),
            GButton(icon: FontAwesomeIcons.clockRotateLeft, text: 'History'),
            GButton(icon: FontAwesomeIcons.gift, text: 'Rewards'),
            GButton(icon: FontAwesomeIcons.user, text: 'profile'),
          ],
        ),
      ),
    );
  }
}
