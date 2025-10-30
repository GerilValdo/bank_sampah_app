import 'package:auto_route/auto_route.dart';
import 'package:bank_sampah_app/core/constants/app_color.dart';
import 'package:bank_sampah_app/core/constants/app_style.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

@RoutePage()
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});
  static const String id = '/dashboard';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return Scaffold(
      backgroundColor: Colors.white.withValues(alpha: 0.9),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            // 🌿 Background Gradient Header
            Container(
              height: height * 0.27,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                gradient: RadialGradient(
                  colors: [
                    const Color(0xFF50C878).withValues(alpha: 0.7),
                    Colors.teal,
                  ],
                  center: Alignment.topLeft,
                  radius: 2,
                ),
              ),
            ),

            // 🌿 Content
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.06,
                vertical: height * 0.05,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(),
                  const SizedBox(height: 25),
                  _buildPointsCard(),
                  const SizedBox(height: 40),
                  _buildQuickActions(context),
                  const SizedBox(height: 10),
                  _buildRecentActivity(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // HEADER
  Widget _buildHeader() {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        height: 48,
        width: 48,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 2),
          borderRadius: BorderRadius.circular(50),
          image: const DecorationImage(
            image: AssetImage('assets/images/logo.webp'),
          ),
        ),
      ),
      title: const Text(
        'Welcome back,',
        style: TextStyle(color: Colors.white70),
      ),
      subtitle: const Text(
        'John Doe',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
      ),
      trailing: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.white.withValues(alpha: 0.3),
        ),
        child: const Icon(
          Icons.workspace_premium_outlined,
          color: Colors.white,
        ),
      ),
    );
  }

  // POINTS CARD 
  Widget _buildPointsCard() {
    return Row(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 2),
            gradient: LinearGradient(
              colors: [
                const Color(0xFF50C878).withValues(alpha: 0.7),
                Colors.teal,
              ],
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: const Icon(FontAwesomeIcons.coins, color: Colors.white),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Total Points",
              style: AppTextStyle.semiBold(color: AppColor.background),
            ),
            Text(
              "2,450",
              style: AppTextStyle.bold(
                color: AppColor.background,
                fontSize: 22,
              ),
            ),
          ],
        ),
      ],
    );
  }

  // QUICK ACTIONS 
  Widget _buildQuickActions(BuildContext context) {
    final List<Map<String, dynamic>> actions = [
      {
        'icon': FontAwesomeIcons.trashCan,
        'label': 'Deposit Waste',
        'gradient': [Colors.teal, const Color(0xFF50C878)],
      },
      {
        'icon': FontAwesomeIcons.truck,
        'label': 'Pickup Request',
        'gradient': [Colors.blueAccent, Colors.lightBlue],
      },
      {
        'icon': FontAwesomeIcons.bookOpen,
        'label': 'Education',
        'gradient': [Colors.orange, Colors.deepOrangeAccent],
      },
      {
        'icon': FontAwesomeIcons.gift,
        'label': 'Rewards',
        'gradient': [Colors.purple, Colors.pinkAccent],
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 25),
        Text('Quick Actions', style: AppTextStyle.semiBold(fontSize: 16)),
        const SizedBox(height: 10),
        GridView.builder(
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1.2,
          ),
          itemCount: actions.length,
          itemBuilder: (context, index) {
            final item = actions[index];
            return _buildActionCard(
              icon: item['icon'],
              label: item['label'],
              gradient: item['gradient'],
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${item['label']} tapped')),
                );
              },
            );
          },
        ),
      ],
    );
  }

  Widget _buildActionCard({
    required IconData icon,
    required String label,
    required List<Color> gradient,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: LinearGradient(colors: gradient),
                ),
                child: Icon(icon, color: Colors.white, size: 20),
              ),
              const Spacer(),
              Text(
                label,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // RECENT ACTIVITY 
  Widget _buildRecentActivity(BuildContext context) {
    final activities = [
      {
        'title': 'Plastic Bottles',
        'amount': '+125',
        'status': 'completed',
        'color': Colors.green,
        'icon': FontAwesomeIcons.trashCan,
      },
      {
        'title': 'Cardboard',
        'amount': '+200',
        'status': 'completed',
        'color': Colors.green,
        'icon': FontAwesomeIcons.box,
      },
      {
        'title': 'Metal Cans',
        'amount': '+90',
        'status': 'pending',
        'color': Colors.orange,
        'icon': FontAwesomeIcons.candyCane,
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Recent Activity',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            ),
            TextButton(onPressed: () {}, child: const Text('View All')),
          ],
        ),
        ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: activities.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final activity = activities[index];
            return _buildActivityCard(activity);
          },
        ),
      ],
    );
  }

  Widget _buildActivityCard(Map<String, dynamic> data) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: Container(
          height: 36,
          width: 36,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: data['color'].withOpacity(0.15),
          ),
          child: Icon(data['icon'], color: data['color'], size: 16),
        ),
        title: Text(
          data['title'],
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Row(
          children: const [
            Text('2.5 kg'),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4),
              child: Text('•'),
            ),
            Text('2 hours ago'),
          ],
        ),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              data['amount'],
              style: TextStyle(
                color: data['color'],
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
              decoration: BoxDecoration(
                color: data['color'].withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                data['status'],
                style: TextStyle(
                  color: data['color'],
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
