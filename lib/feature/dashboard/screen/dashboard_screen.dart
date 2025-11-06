import 'package:auto_route/auto_route.dart';
import 'package:bank_sampah_app/core/constants/app_color.dart';
import 'package:bank_sampah_app/core/constants/app_style.dart';
import 'package:bank_sampah_app/core/router/app_router.dart';
import 'package:bank_sampah_app/core/utils/icon_mapper.dart';
import 'package:bank_sampah_app/feature/authentication/bloc/auth_bloc.dart';
import 'package:bank_sampah_app/feature/deposit/view/bloc/deposit_bloc.dart';
import 'package:bank_sampah_app/feature/deposit/models/deposit_model.dart';
import 'package:bank_sampah_app/feature/history/view/bloc/history_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

@RoutePage()
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});
  static const String id = '/dashboard';

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  Color getStatusColor(String status) {
    switch (status) {
      case 'completed':
        return const Color(0xFF10B981);
      case 'pending':
        return const Color(0xFFF59E0B);
      case 'rejected':
        return const Color(0xFFEF4444);
      default:
        return Colors.grey;
    }
  }

  @override
  void initState() {
    super.initState();
    context.read<DepositBloc>().add(DepositEvent.loadDeposits());
    context.read<AuthBloc>().add(AuthEvent.loadUser());
  }

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
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return state.when(
          error: (message) =>
              Text(message, style: TextStyle(color: Colors.red)),
          initial: () => const Center(child: CircularProgressIndicator()),
          loading: () => const Center(child: CircularProgressIndicator()),
          unauthenticated: () => ListTile(
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
            subtitle: Text(
              'Please login first',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
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
            title: Text(
              'Welcome, Guest',
              style: TextStyle(color: Colors.white70),
            ),
          ),
          authenticated: (user) => ListTile(
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
            subtitle: Text(
              user.name,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
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
          ),
        );
      },
    );
  }

  // POINTS CARD
  Widget _buildPointsCard() {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return state.maybeWhen(
          authenticated: (user) => Row(
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
                    user.totalPoints.toString(),
                    style: AppTextStyle.bold(
                      color: AppColor.background,
                      fontSize: 22,
                    ),
                  ),
                ],
              ),
            ],
          ),
          orElse: () {
            return SizedBox();
          },
        );
      },
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
      // {
      //   'icon': FontAwesomeIcons.truck,
      //   'label': 'Pickup Request',
      //   'gradient': [Colors.blueAccent, Colors.lightBlue],
      // },
      // {
      //   'icon': FontAwesomeIcons.bookOpen,
      //   'label': 'Education',
      //   'gradient': [Colors.orange, Colors.deepOrangeAccent],
      // },
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
                if (index == 0) {
                  context.pushRoute(DepositWasteRoute()).then((value) {
                    context.read<DepositBloc>().add(
                      DepositEvent.loadDeposits(),
                    );
                    context.read<HistoryBloc>().add(
                      HistoryEvent.loadTransactions(),
                    );
                  });
                }
                if (index == 1) {
                  context.pushRoute(MainRoute(initialIndex: 2));
                }
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
        BlocBuilder<DepositBloc, DepositState>(
          builder: (context, state) {
            if (state.isLoading) {
              return Center(child: CircularProgressIndicator());
            }
            if (state.deposits.isEmpty) {
              return Center(child: const Text("No Data"));
            }
            final data = state.deposits;
            return ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: data.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final activity = data[index];
                return _buildActivityCard(activity);
              },
            );
          },
        ),
      ],
    );
  }

  Widget _buildActivityCard(DepositModel data) {
    final statusColor = getStatusColor(data.status);
    return Dismissible(
      key: ValueKey(data.id), // pastikan tiap item punya ID unik
      direction: DismissDirection.endToStart, // geser ke kiri untuk hapus
      background: Container(
        alignment: Alignment.centerRight,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      confirmDismiss: (direction) async {
        // konfirmasi sebelum hapus
        return await showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text('Hapus Data'),
            content: const Text('Yakin ingin menghapus data ini?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(ctx).pop(false),
                child: const Text('Batal'),
              ),
              TextButton(
                onPressed: () => Navigator.of(ctx).pop(true),
                child: const Text('Hapus'),
              ),
            ],
          ),
        );
      },
      onDismissed: (direction) {
        // Hapus data dari sumber data (misalnya Bloc, SQLite, dsb)
        context.read<DepositBloc>().add(DepositEvent.deleteDeposit(data.id!));
        context.read<HistoryBloc>().add(HistoryEvent.loadTransactions());

        // Feedback visual
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('${data.nameCategory} dihapus')));
      },
      child: Card(
        elevation: 3,
        margin: const EdgeInsets.only(bottom: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: InkWell(
          onTap: () {
            context.pushRoute(DepositWasteRoute(deposit: data)).then((value) {
              // setelah update selesai, refresh data lagi
              context.read<DepositBloc>().add(DepositEvent.loadDeposits());
              context.read<HistoryBloc>().add(HistoryEvent.loadTransactions());
            });
          },
          child: ListTile(
            leading: Container(
              height: 36,
              width: 36,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: statusColor.withValues(alpha: 0.15),
              ),
              child: Icon(
                mapIconName(data.iconNameCategory ?? ''),
                color: Colors.green,
                size: 16,
              ),
            ),
            title: Text(
              data.nameCategory ?? '',
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            subtitle: Row(
              children: [
                Text('${data.weight.toString()}kg'),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4),
                  child: Text('•'),
                ),
                Text(DateFormat('dd MMM yyyy').format(data.createdAt)),
              ],
            ),
            trailing: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '+${data.totalPoints.toString()}',
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: getStatusColor(data.status).withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    data.status,
                    style: TextStyle(
                      color: getStatusColor(data.status),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
