import 'package:auto_route/auto_route.dart';
import 'package:bank_sampah_app/feature/admin/dashboard/widgets/admin_drawer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

@RoutePage()
class AdminDashboardScreen extends StatefulWidget {
  const AdminDashboardScreen({super.key});
  static const String id = '/admin-dashboard';

  @override
  State<AdminDashboardScreen> createState() => _AdminDashboardScreenState();
}

class _AdminDashboardScreenState extends State<AdminDashboardScreen> {
  String activeMenu = 'dashboard';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      drawer: AdminDrawer(
        activeMenu: activeMenu,
        onMenuSelected: (menu) {
          setState(() {
            activeMenu = menu;
          });
          Navigator.pop(context);
        },
      ),
      appBar: AppBar(
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: Icon(Icons.menu, color: Colors.white),
            );
          },
        ),
        backgroundColor: const Color(0xFF0E1F4B),
        elevation: 0,
        toolbarHeight: 90,
        title: const Text(
          "Welcome back,\nAdmin",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: CircleAvatar(
              backgroundColor: Colors.white24,
              child: Text("AD", style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // === Top Stats Cards ===
          _buildTopStats(),

          const SizedBox(height: 25),
          _buildQuickActions(),

          const SizedBox(height: 25),
          _buildPendingApprovals(),

          const SizedBox(height: 25),
          _buildTopContributors(),
        ],
      ),
    );
  }

  // SECTION: Top Stats
  Widget _buildTopStats() {
    final List<Map<String, dynamic>> stats = [
      {
        'icon': FontAwesomeIcons.userGroup,
        'title': 'Total Users',
        'value': '1,234',
        'percent': '+12%',
        'color': const Color(0xFF3B82F6),
        'isIncrease': true,
      },
      {
        'icon': FontAwesomeIcons.arrowsRotate,
        'title': 'Active Transactions',
        'value': '456',
        'percent': '-8%',
        'color': const Color(0xFF6366F1),
        'isIncrease': false,
      },
      {
        'icon': FontAwesomeIcons.clipboardList,
        'title': 'Pending Requests',
        'value': '23',
        'percent': '-5%',
        'color': const Color(0xFFF59E0B),
        'isIncrease': false,
      },
      {
        'icon': FontAwesomeIcons.coins,
        'title': 'Total Revenue',
        'value': 'Rp 45.2M',
        'percent': '+15%',
        'color': const Color(0xFF10B981),
        'isIncrease': true,
      },
    ];
    return GridView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: stats.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1.2,
      ),
      itemBuilder: (context, index) {
        final item = stats[index];
        return _statCard(
          icon: item['icon'],
          title: item['title'],
          value: item['value'],
          // percent: item['percent'],
          color: item['color'],
          isIncrease: item['isIncrease'],
        );
      },
    );
  }

  Widget _statCard({
    required IconData icon,
    required String title,
    required String value,
    // required String percent,
    required Color color,
    required bool isIncrease,
  }) {
    return Container(
      width: 165,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: color.withOpacity(0.15),
                child: Icon(icon, color: color, size: 18),
              ),
              // const Spacer(),
              // Text(
              //   percent,
              //   style: TextStyle(
              //     color: isIncrease ? Colors.green : Colors.red,
              //     fontWeight: FontWeight.w600,
              //     fontSize: 12,
              //   ),
              // ),
            ],
          ),
          // const SizedBox(height: 10),
          Text(
            value,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          // const SizedBox(height: 5),
          Text(title, style: const TextStyle(color: Colors.grey, fontSize: 13)),
        ],
      ),
    );
  }

  // ============================
  Widget _buildQuickActions() {
    final List<Map<String, dynamic>> actionData = [
      {
        'icon': FontAwesomeIcons.sackDollar,
        'title': 'Manage Deposits',
        'color': const Color(0xFFF59E0B),
      },
      {
        'icon': FontAwesomeIcons.userGear,
        'title': 'Manage Users',
        'color': Colors.purple,
      },
      // {
      //   'icon': FontAwesomeIcons.truck,
      //   'title': 'Manage Pickups',
      //   'color': Colors.indigo,
      // },
      // {
      //   'icon': FontAwesomeIcons.chartLine,
      //   'title': 'View Reports',
      //   'color': Colors.orange,
      // },
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Quick Actions",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 12),
        GridView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: actionData.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            crossAxisCount: 2,
            childAspectRatio: 1.5,
          ),
          itemBuilder: (context, index) {
            final items = actionData[index];
            return _actionCard(
              icon: items['icon'],
              title: items['title'],
              color: items['color'],
            );
          },
        ),
      ],
    );
  }

  Widget _actionCard({
    required IconData icon,
    required String title,
    required Color color,
  }) {
    return Container(
      // width: 165,
      // height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(height: 10),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
          ),
        ],
      ),
    );
  }

  // ==============================
  Widget _buildPendingApprovals() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionHeader("Pending Approvals"),
        const SizedBox(height: 12),
        _approvalCard(
          "John Doe",
          "Plastic Bottles • 2.5 kg",
          "5 min ago",
          "pending",
        ),
        _approvalCard(
          "Jane Smith",
          "Cardboard • 5 kg",
          "15 min ago",
          "pending",
        ),
        _approvalCard(
          "Mike Johnson",
          "Metal Cans • 1.2 kg",
          "1 hour ago",
          "approved",
        ),
      ],
    );
  }

  Widget _approvalCard(String name, String detail, String time, String status) {
    Color statusColor;
    switch (status) {
      case "approved":
        statusColor = Colors.green;
        break;
      case "pending":
        statusColor = Colors.orange;
        break;
      default:
        statusColor = Colors.grey;
    }

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          const SizedBox(height: 5),
          Text(
            detail,
            style: const TextStyle(color: Colors.grey, fontSize: 13),
          ),
          const SizedBox(height: 5),
          Text(
            time,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 11,
              fontStyle: FontStyle.italic,
            ),
          ),
          const SizedBox(height: 10),
          if (status == "pending") ...[
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 8,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "Approve",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 8,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "Reject",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ] else
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              decoration: BoxDecoration(
                color: statusColor.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                status,
                style: TextStyle(
                  color: statusColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
        ],
      ),
    );
  }

  // ============================
  Widget _buildTopContributors() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionHeader("Top Contributors"),
        const SizedBox(height: 12),
        _contributorCard("#1", "Sarah Wilson", "58 deposits", "4500"),
        _contributorCard("#2", "David Lee", "72 deposits", "3800"),
        _contributorCard("#3", "Emma Brown", "64 deposits", "3200"),
      ],
    );
  }

  Widget _contributorCard(
    String rank,
    String name,
    String deposits,
    String points,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.amber[100],
            radius: 20,
            child: Text(
              rank,
              style: const TextStyle(
                color: Colors.orange,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
                Text(
                  deposits,
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          ),
          Text(
            "$points pts",
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
          ),
        ],
      ),
    );
  }

  // ============================
  Widget _sectionHeader(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Text(
          "View All",
          style: TextStyle(
            color: Colors.green[700],
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
