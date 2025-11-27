import 'package:auto_route/auto_route.dart';
import 'package:bank_sampah_app/core/constants/app_color.dart';
import 'package:bank_sampah_app/core/constants/app_style.dart';
import 'package:bank_sampah_app/core/router/app_router.dart';
import 'package:bank_sampah_app/core/utils/icon_mapper.dart';
import 'package:bank_sampah_app/feature/authentication/presentation/bloc/firebase_auth_bloc.dart';
import 'package:bank_sampah_app/feature/deposit/models/deposit_firebase_model.dart';
import 'package:bank_sampah_app/feature/deposit/presentation/bloc/category_firebase_bloc.dart';
import 'package:bank_sampah_app/feature/deposit/presentation/bloc/deposit_firebase_bloc.dart';
import 'package:bank_sampah_app/feature/history/presentation/bloc/history_firebase_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

@RoutePage()
class FirebaseDashboardScreen extends StatefulWidget {
  const FirebaseDashboardScreen({super.key});
  static const String id = '/firebase-dashboard';

  @override
  State<FirebaseDashboardScreen> createState() =>
      _FirebaseDashboardScreenState();
}

class _FirebaseDashboardScreenState extends State<FirebaseDashboardScreen> {
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

    final authState = context.read<FirebaseAuthBloc>().state;
    final user = authState.maybeWhen(
      authenticated: (u) => u,
      orElse: () => null,
    );

    // 🔥 LOAD CATEGORY SEKALI SAJA DI DASHBOARD
    context.read<CategoryFirebaseBloc>().add(
      const CategoryFirebaseEvent.loadCategories(),
    );

    if (user != null) {
      context.read<DepositFirebaseBloc>().add(
        DepositFirebaseEvent.loadDeposits(user.uid!),
      );

      context.read<HistoryFirebaseBloc>().add(
        HistoryFirebaseEvent.loadTransactions(user.uid!),
      );

      // 🔥 RELOAD USER UNTUK UPDATE TOTAL POINTS
      context.read<FirebaseAuthBloc>().add(const FirebaseAuthEvent.loadUser());
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.9),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            // 🌿 Background Header (gradient)
            Container(
              height: height * 0.27,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                gradient: RadialGradient(
                  colors: [
                    const Color(0xFF50C878).withOpacity(0.7),
                    Colors.teal,
                  ],
                  center: Alignment.topLeft,
                  radius: 2,
                ),
              ),
            ),

            // 🌿 Main Content
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
                  const SizedBox(height: 65),
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

  // =====================================================
  // HEADER
  // =====================================================
  Widget _buildHeader() {
    return BlocBuilder<FirebaseAuthBloc, FirebaseAuthState>(
      builder: (context, state) {
        return state.maybeWhen(
          authenticated: (user) {
            final username = user.username ?? "";
            final initials = username.isNotEmpty
                ? username
                      .split(" ")
                      .map((e) => e[0])
                      .take(2)
                      .join()
                      .toUpperCase()
                : "?";

            return ListTile(
              contentPadding: EdgeInsets.zero,
              leading: CircleAvatar(
                radius: 24,
                backgroundColor: Colors.white24,
                child: Text(
                  initials,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              title: const Text(
                'Welcome back,',
                style: TextStyle(color: Colors.white70),
              ),
              subtitle: Text(
                username,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              trailing: Icon(
                Icons.workspace_premium_outlined,
                color: Colors.white.withOpacity(0.7),
              ),
            );
          },
          orElse: () => const SizedBox(),
        );
      },
    );
  }

  // =====================================================
  // POINTS CARD
  // =====================================================
  Widget _buildPointsCard() {
    return BlocBuilder<FirebaseAuthBloc, FirebaseAuthState>(
      builder: (context, state) {
        return state.maybeWhen(
          authenticated: (user) {
            return Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(
                      colors: [
                        const Color(0xFF50C878).withOpacity(0.7),
                        Colors.teal,
                      ],
                    ),
                  ),
                  child: const Icon(
                    FontAwesomeIcons.coins,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 12),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Total Points",
                      style: AppTextStyle.semiBold(color: AppColor.background),
                    ),

                    // 🔥 PAKAI TOTAL POINTS DARI USER MODEL
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
            );
          },
          orElse: () => const SizedBox(),
        );
      },
    );
  }

  // =====================================================
  // QUICK ACTIONS
  // =====================================================
  Widget _buildQuickActions(BuildContext context) {
    final actions = [
      {
        'icon': FontAwesomeIcons.trashCan,
        'label': 'Deposit Waste',
        'gradient': [Colors.teal, const Color(0xFF50C878)],
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
        Text("Quick Actions", style: AppTextStyle.semiBold(fontSize: 16)),
        const SizedBox(height: 10),

        GridView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: actions.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 1.2,
          ),
          itemBuilder: (context, index) {
            final item = actions[index];

            return _buildActionCard(
              icon: item['icon'] as IconData,
              label: item['label'] as String,
              gradient: (item['gradient'] as List).cast<Color>(),
              onTap: () {
                if (index == 0) {
                  context.pushRoute(DepositFirebaseRoute());
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
                  gradient: LinearGradient(colors: gradient),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: Colors.white, size: 20),
              ),
              const Spacer(),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // =====================================================
  // RECENT ACTIVITY
  // =====================================================
  Widget _buildRecentActivity(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Recent Activity',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            TextButton(onPressed: () {}, child: const Text('View All')),
          ],
        ),

        BlocBuilder<DepositFirebaseBloc, DepositFirebaseState>(
          builder: (context, state) {
            if (state.isLoading)
              return const Center(child: CircularProgressIndicator());
            if (state.deposits.isEmpty)
              return const Center(child: Text("No Data"));

            return ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: state.deposits.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final d = state.deposits[index];
                return _buildActivityCard(d);
              },
            );
          },
        ),
      ],
    );
  }

  Widget _buildActivityCard(DepositFirebaseModel data) {
    final statusColor = getStatusColor(data.status);
    final createdText = DateFormat('dd MMM yyyy').format(data.createdAt);

    return Dismissible(
      key: ValueKey(data.id),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(15),
        ),
        child: const Icon(Icons.delete, color: Colors.white),
      ),

      // 🚀 KONFIRMASI DELETE
      confirmDismiss: (direction) async {
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

      // 🚀 AKSI DELETE
      onDismissed: (direction) {
        context.read<DepositFirebaseBloc>().add(
          DepositFirebaseEvent.deleteDeposit(data.id!),
        );
        context.read<HistoryFirebaseBloc>().add(
          HistoryFirebaseEvent.loadTransactions(
            FirebaseAuth.instance.currentUser!.uid,
          ),
        );

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
            // 🚀 UPDATE: Ketika item ditekan, buka DepositFirebaseScreen
            context.pushRoute(DepositFirebaseRoute(deposit: data)).then((
              value,
            ) {
              final uid = FirebaseAuth.instance.currentUser?.uid;
              if (uid != null) {
                context.read<DepositFirebaseBloc>().add(
                  DepositFirebaseEvent.loadDeposits(uid),
                );
                context.read<HistoryFirebaseBloc>().add(
                  HistoryFirebaseEvent.loadTransactions(uid),
                );
              }
            });
          },
          child: ListTile(
            leading: Container(
              height: 36,
              width: 36,
              decoration: BoxDecoration(
                color: statusColor.withOpacity(0.15),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                mapIconName(data.iconNameCategory ?? ""),
                size: 16,
                color: Colors.green,
              ),
            ),
            title: Text(
              data.nameCategory ?? "",
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            subtitle: Row(
              children: [
                Text("${data.weight} kg"),
                const SizedBox(width: 4),
                const Text("•"),
                const SizedBox(width: 4),
                Text(createdText),
              ],
            ),
            trailing: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "+${data.totalPoints}",
                  style: const TextStyle(
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
                    borderRadius: BorderRadius.circular(20),
                    color: statusColor.withOpacity(0.1),
                  ),
                  child: Text(
                    data.status,
                    style: TextStyle(
                      color: statusColor,
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
