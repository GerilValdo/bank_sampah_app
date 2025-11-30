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
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFB),

      body: IndexedStack(index: _selectedIndex, children: _pages),

      //  BOTTOM NAV 
      bottomNavigationBar: SafeArea(
        child: Container(
          margin: const EdgeInsets.fromLTRB(16, 0, 16, 12),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(26),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.06),
                blurRadius: 10,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: GNav(
            selectedIndex: _selectedIndex,

            gap: 8,
            rippleColor: Colors.grey.shade300,
            hoverColor: Colors.grey.shade100,
            curve: Curves.easeOutExpo,
            duration: const Duration(milliseconds: 400),

            color: Colors.grey.shade600,
            activeColor: Colors.white,
            iconSize: 22,

            tabBackgroundGradient: LinearGradient(
              colors: [const Color(0xFF50C878).withValues(alpha: 0.8), Colors.teal],
            ),

            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),

            onTabChange: (index) {
              setState(() => _selectedIndex = index);
            },

            tabs: const [
              GButton(
                icon: FontAwesomeIcons.houseChimney,
                text: 'Home',
                textStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              GButton(
                icon: FontAwesomeIcons.clockRotateLeft,
                text: 'History',
                textStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              GButton(
                icon: FontAwesomeIcons.gift,
                text: 'Withdraw',
                textStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              GButton(
                icon: FontAwesomeIcons.user,
                text: 'Profile',
                textStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
