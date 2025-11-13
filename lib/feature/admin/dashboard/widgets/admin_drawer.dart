import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AdminDrawer extends StatelessWidget {
  final String activeMenu; // menu yang sedang aktif
  final Function(String) onMenuSelected;

  const AdminDrawer({
    super.key,
    required this.activeMenu,
    required this.onMenuSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 290,
      backgroundColor: const Color(0xFF0D1B3A),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ================= Header =================
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Row(
                children: [
                  const Icon(
                    Icons.shield_outlined,
                    color: Colors.amber,
                    size: 24,
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    "Admin Panel",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white.withValues(alpha: 0.15),
                    ),
                    child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.close, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),

            // ================= Profile Info =================
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF14254F),
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 22,
                      backgroundColor: Colors.white24,
                      child: Text(
                        "AD",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Admin",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "System Administrator",
                          style: TextStyle(color: Colors.white70, fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            Divider(color: Colors.white.withValues(alpha: 0.3)),
            const SizedBox(height: 16),

            // ================= Main Menu =================
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "MAIN MENU",
                style: TextStyle(
                  color: Colors.white.withOpacity(0.6),
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),
            ),
            const SizedBox(height: 10),

            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                children: [
                  _buildMenuItem(
                    icon: FontAwesomeIcons.tableCellsLarge,
                    title: "Dashboard",
                    keyValue: "dashboard",
                  ),
                  _buildMenuItem(
                    icon: FontAwesomeIcons.sackDollar,
                    title: "Manage Deposits",
                    keyValue: "deposits",
                  ),
                  // _buildMenuItem(
                  //   icon: FontAwesomeIcons.truck,
                  //   title: "Manage Pickups",
                  //   keyValue: "pickups",
                  // ),
                  _buildMenuItem(
                    icon: FontAwesomeIcons.usersGear,
                    title: "Manage Users",
                    keyValue: "users",
                  ),
                  // _buildMenuItem(
                  //   icon: FontAwesomeIcons.chartLine,
                  //   title: "Reports & Analytics",
                  //   keyValue: "reports",
                  // ),
                  _buildMenuItem(
                    icon: FontAwesomeIcons.userShield,
                    title: "Admin Profile",
                    keyValue: "profile",
                  ),
                  Divider(color: Colors.white.withValues(alpha: 0.3)),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: const BoxDecoration(
                      color: Color(0xFF0B1630),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(18),
                        topRight: Radius.circular(18),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "QUICK STATS",
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.6),
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        _quickStatItem(
                          "Pending Approvals",
                          "23",
                          color: Colors.amberAccent,
                        ),
                        _quickStatItem(
                          "Active Users",
                          "1,234",
                          color: Colors.greenAccent,
                        ),
                        _quickStatItem(
                          "Today's Pickups",
                          "8",
                          color: Colors.lightBlueAccent,
                        ),
                      ],
                    ),
                  ),
                  Divider(color: Colors.white.withValues(alpha: 0.3)),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () {
                        // TODO: Tambahkan fungsi logout di sini
                        // contoh: context.read<AuthBloc>().add(AuthEvent.logout());
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 14,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          gradient: LinearGradient(
                            colors: [
                              Colors.redAccent.withValues(alpha: 0.9),
                              Colors.red.withValues(alpha: 0.8),
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.redAccent.withValues(alpha: 0.3),
                              blurRadius: 6,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              FontAwesomeIcons.arrowRightFromBracket,
                              color: Colors.white,
                              size: 16,
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              "Logout",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // Container(
                  //   height: 45,
                  //   padding: EdgeInsets.symmetric(horizontal: 16),
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(10),
                  //     color: Colors.red.withValues(alpha: 0.2),
                  //   ),
                  //   child: Row(
                  //     spacing: 16,
                  //     children: [
                  //       Icon(
                  //         FontAwesomeIcons.arrowRightFromBracket,
                  //         color: Colors.red,
                  //       ),
                  //       Text(
                  //         'Logout from Admin',
                  //         style: TextStyle(color: Colors.red),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),

            // ================= Quick Stats =================
          ],
        ),
      ),
    );
  }

  // ================= Widget Menu Item =================
  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required String keyValue,
  }) {
    final bool isActive = keyValue == activeMenu;

    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () => onMenuSelected(keyValue),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: isActive ? Colors.white.withOpacity(0.1) : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: isActive ? Colors.white : Colors.white70,
              size: 18,
            ),
            const SizedBox(width: 14),
            Text(
              title,
              style: TextStyle(
                color: isActive ? Colors.white : Colors.white70,
                fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ================= Widget Quick Stats =================
  Widget _quickStatItem(String title, String value, {Color? color}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.white70, fontSize: 13),
          ),
          Text(
            value,
            style: TextStyle(
              color: color ?? Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}
