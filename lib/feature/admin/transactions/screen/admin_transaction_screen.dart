import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AdminTransactionScreen extends StatefulWidget {
  const AdminTransactionScreen({super.key});

  static const String id = '/admin-transaction-screen';
  @override
  State<AdminTransactionScreen> createState() => _AdminTransactionScreenState();
}

class _AdminTransactionScreenState extends State<AdminTransactionScreen> {
  int selectedTabIndex = 0; 
  final String sampleImagePath = '/mnt/data/Screenshot 2025-11-24 081429.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _buildHeader(context),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView(
                padding: const EdgeInsets.only(top: 18, bottom: 24),
                children: [
                  _buildSearchBar(context),
                  const SizedBox(height: 18),
                  _buildStatsRow(context),
                  const SizedBox(height: 18),
                  _buildTabs(context),
                  const SizedBox(height: 18),
                  _buildTransactionCard(context),
                  const SizedBox(height: 16),
                  _buildTransactionCard(context), 
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 0.22;
    return Stack(
      children: [
        Container(
          height: height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF0F1724), Color(0xFF1B2B3B)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
        ),
        Positioned(
          top: 34,
          left: 8,
          right: 16,
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.white12,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    context.pop();
                  },
                ),
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Manage Transactions',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      'Review and approve deposits',
                      style: TextStyle(color: Colors.white70, fontSize: 13),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: height - 24,
          left: 0,
          right: 0,
          child: Container(
            height: 48,
            decoration: const BoxDecoration(
              color: Color(0xFFEFF3F6), 
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(36),
                topRight: Radius.circular(36),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0F000000),
            blurRadius: 12,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          const Icon(Icons.search_outlined, color: Color(0xFF9AA5B1)),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search by user name or trx id',
                border: InputBorder.none,
                isDense: true,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: const Color(0xFFEDF2F6),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.filter_list, size: 20),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsRow(BuildContext context) {
    Widget statCard(String count, String label, Color countColor) {
      return Expanded(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          margin: const EdgeInsets.symmetric(horizontal: 6),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(
                color: Color(0x0A000000),
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                count,
                style: TextStyle(
                  color: countColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                label,
                style: const TextStyle(fontSize: 12, color: Colors.black54),
              ),
            ],
          ),
        ),
      );
    }

    return Row(
      children: [
        statCard('2', 'Pending', const Color(0xFFEF8A32)),
        statCard('2', 'Approved', const Color(0xFF28A745)),
        statCard('1', 'Rejected', const Color(0xFFDC3545)),
      ],
    );
  }

  Widget _buildTabs(BuildContext context) {
    Widget tabItem(String title, int index) {
      final selected = selectedTabIndex == index;
      return GestureDetector(
        onTap: () => setState(() => selectedTabIndex = index),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
          margin: const EdgeInsets.only(right: 8),
          decoration: BoxDecoration(
            color: selected ? const Color(0xFF26313C) : Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: selected
                ? const []
                : [
                    const BoxShadow(
                      color: Color(0x0A000000),
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
          ),
          child: Text(
            title,
            style: TextStyle(
              color: selected ? Colors.white : Colors.black87,
              fontWeight: selected ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
        ),
      );
    }

    return Row(
      children: [
        tabItem('Pending', 0),
        tabItem('Approved', 1),
        tabItem('Rejected', 2),
      ],
    );
  }

  Widget _buildTransactionCard(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [
          BoxShadow(
            color: Color(0x11000000),
            blurRadius: 12,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          // image
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(14)),
            child: SizedBox(
              height: 110,
              width: double.infinity,
              child: _buildThumbnail(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Expanded(
                            child: Text(
                              'John Doe',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          const SizedBox(width: 6),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFF4E6),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Text(
                              'pending',
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xFFEF8A32),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      const Text(
                        'john@example.com',
                        style: TextStyle(fontSize: 13, color: Colors.black54),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Category',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black54,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'Plastic Bottles',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Weight',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black54,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  '2.5 kg',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: const [
                          // Points
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Points',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black54,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  '125',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFF28A745),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Amount
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Amount',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black54,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'Rp 13K',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        '2025-10-29 at 14:30',
                        style: TextStyle(fontSize: 12, color: Colors.black45),
                      ),
                      const SizedBox(height: 10),
                      // Approve / Reject buttons
                      Row(
                        children: [
                          ElevatedButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.check_circle_outline),
                            label: const Text('Approve'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF11A65D),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 14,
                                vertical: 10,
                              ),
                              elevation: 0,
                            ),
                          ),
                          const SizedBox(width: 12),
                          ElevatedButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.cancel_outlined),
                            label: const Text('Reject'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFE94B4B),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 14,
                                vertical: 10,
                              ),
                              elevation: 0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    Text(
                      'TRX-001',
                      style: TextStyle(
                        color: Color(0xFF2D3B45),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildThumbnail() {
    try {
      final f = File(sampleImagePath);
      if (f.existsSync()) {
        return Image.file(f, fit: BoxFit.cover);
      } else {
        return Container(
          color: const Color(0xFFE7EDF3),
          child: const Center(
            child: Icon(Icons.image, size: 36, color: Colors.black26),
          ),
        );
      }
    } catch (e) {
      return Container(
        color: const Color(0xFFE7EDF3),
        child: const Center(
          child: Icon(Icons.broken_image, size: 36, color: Colors.black26),
        ),
      );
    }
  }
}
