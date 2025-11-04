import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

@RoutePage()
class RewardsScreen extends StatefulWidget {
  const RewardsScreen({super.key});
  static const String id = '/rewards';

  @override
  State<RewardsScreen> createState() => _RewardsScreenState();
}

class _RewardsScreenState extends State<RewardsScreen> {
  int totalPoints = 2450;
  final int nextReward = 3000;

  List<Map<String, dynamic>> rewards = [
    {
      'icon': FontAwesomeIcons.wallet,
      'title': 'E-Wallet Top Up',
      'type': 'E-Wallet',
      'description': 'Convert points to wallet balance',
      'points': 1000,
      'reward': 'Rp 100,000',
      'gradient': [Colors.blue, Colors.cyan],
    },
    {
      'icon': FontAwesomeIcons.bagShopping,
      'title': 'Shopping Voucher',
      'type': 'Voucher',
      'description': 'Get discount at partner stores',
      'points': 1500,
      'reward': 'Rp 150,000',
      'gradient': [Colors.pink, Colors.deepPurpleAccent],
    },
    {
      'icon': FontAwesomeIcons.tree,
      'title': 'Plant a Tree',
      'type': 'Donation',
      'description': 'Donate to plant a tree',
      'points': 500,
      'reward': '1 Tree',
      'gradient': [Colors.green, Colors.teal],
    },
    {
      'icon': FontAwesomeIcons.phone,
      'title': 'Phone Credit',
      'type': 'Credit',
      'description': 'Top up your phone number',
      'points': 800,
      'reward': 'Rp 80,000',
      'gradient': [Colors.orange, Colors.deepOrange],
    },
    {
      'icon': FontAwesomeIcons.mugSaucer,
      'title': 'Coffee Voucher',
      'type': 'Voucher',
      'description': 'Free coffee at partner cafes',
      'points': 300,
      'reward': '2 Cups',
      'gradient': [Colors.brown, Colors.orangeAccent],
    },
    {
      'icon': FontAwesomeIcons.cartShopping,
      'title': 'Grocery Voucher',
      'type': 'Voucher',
      'description': 'Discount for groceries',
      'points': 2000,
      'reward': 'Rp 200,000',
      'gradient': [Colors.teal, Colors.green],
    },
  ];

  void redeemReward(String title, int cost) {
    if (totalPoints >= cost) {
      setState(() {
        totalPoints -= cost;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.green,
          content: Text('Successfully redeemed $title! 🎉'),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: const Text('Not enough points to redeem this reward.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    // final width = size.width;
    double progress = totalPoints / nextReward;

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFB),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(context, progress),
            SizedBox(height: height * 0.065),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  ...rewards.map((reward) => _buildRewardCard(reward)).toList(),
                  const SizedBox(height: 16),
                  _buildEarnMorePointsSection(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // HEADER
  Widget _buildHeader(BuildContext context, double progress) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 180,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF8A2BE2), Color(0xFFFF69B4)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(35)),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Rewards',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: -50,
          left: 20,
          right: 20,
          child: _buildPointsCard(progress),
        ),
      ],
    );
  }

  Widget _buildPointsCard(double progress) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Your Points', style: TextStyle(color: Colors.grey)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '$totalPoints',
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.pinkAccent.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    FontAwesomeIcons.gift,
                    color: Colors.pinkAccent,
                    size: 20,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Text(
              'Next reward at $nextReward pts',
              style: const TextStyle(fontSize: 13, color: Colors.grey),
            ),
            const SizedBox(height: 4),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: LinearProgressIndicator(
                value: progress.clamp(0, 1),
                backgroundColor: Colors.grey[200],
                color: Colors.green,
                minHeight: 8,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // REWARD CARD
  Widget _buildRewardCard(Map<String, dynamic> reward) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 14),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            // Icon box
            Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: LinearGradient(
                  colors: List<Color>.from(reward['gradient']),
                ),
              ),
              child: Icon(reward['icon'], color: Colors.white, size: 20),
            ),
            const SizedBox(width: 16),
            // Info section
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    reward['title'],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    reward['description'],
                    style: const TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Text(
                        '${reward['points']} pts',
                        style: const TextStyle(
                          color: Colors.teal,
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        reward['reward'],
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            // Redeem button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pinkAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 8,
                ),
              ),
              onPressed: () => redeemReward(reward['title'], reward['points']),
              child: const Text(
                'Redeem',
                style: TextStyle(fontSize: 13, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // HOW TO EARN MORE POINTS
  Widget _buildEarnMorePointsSection() {
    return Card(
      color: Colors.yellow[50],
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: const [
                Icon(Icons.lightbulb_outline, color: Colors.orange),
                SizedBox(width: 8),
                Text(
                  'How to Earn More Points',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            _buildBullet('Deposit waste regularly'),
            _buildBullet('Schedule pickups for bulk waste'),
            _buildBullet('Invite friends to join Bank Sampah'),
            _buildBullet('Complete daily challenges'),
          ],
        ),
      ),
    );
  }

  Widget _buildBullet(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6.0, left: 4),
      child: Row(
        children: [
          const Icon(Icons.circle, size: 6, color: Colors.orange),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 13, color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }
}
