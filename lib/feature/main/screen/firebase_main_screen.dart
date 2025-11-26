import 'package:auto_route/annotations.dart';
import 'package:bank_sampah_app/feature/dashboard/screen/firebase_dashboard_screen.dart';
import 'package:bank_sampah_app/feature/history/presentation/screen/history_firebase_screen.dart';
import 'package:bank_sampah_app/feature/profile/screen/profile_firebase_screen.dart';
import 'package:bank_sampah_app/feature/withdraw/screen/withdraw_firebase_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

@RoutePage()
class FirebaseMainScreen extends StatefulWidget {
  const FirebaseMainScreen({
    super.key,
    @PathParam('initialIndex') this.initialIndex = 0,
  });
  static const id = '/main';
  final int initialIndex;

  @override
  State<FirebaseMainScreen> createState() => _FirebaseMainScreenState();
}

class _FirebaseMainScreenState extends State<FirebaseMainScreen> {
  late int _selectedIndex = 0;

  final List<Widget> _pages = const [
    FirebaseDashboardScreen(),
    HistoryFirebaseScreen(),
    WithdrawFirebaseScreen(),
    ProfileFirebaseScreen(),
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
