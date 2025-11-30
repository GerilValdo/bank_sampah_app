import 'package:auto_route/auto_route.dart';
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

      context.read<FirebaseAuthBloc>().add(const FirebaseAuthEvent.loadUser());
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;

    return Scaffold(
      backgroundColor: Colors.white.withValues(alpha: 0.9),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.06),
              child: _buildQuickActions(context),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.06),
              child: _buildRecentActivity(context),
            ),
          ],
        ),
      ),
    );
  }

  // HEADER
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

            return Container(
              width: double.infinity,
              padding: const EdgeInsets.only(top: 60, bottom: 30),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF10B981), Color(0xFF14B8A6)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  _buildAvatar(user.profileImage, initials),
                  const SizedBox(height: 14),
                  const Text(
                    "Welcome 👋",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    username,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 22),
                  _buildFloatingPointsCard(user.totalPoints),
                ],
              ),
            );
          },
          orElse: () => const SizedBox(),
        );
      },
    );
  }

  Widget _buildAvatar(String? photoUrl, String initials) {
    return Container(
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 3),
      ),
      child: CircleAvatar(
        radius: 38,
        backgroundColor: Colors.white24,
        backgroundImage: photoUrl != null ? NetworkImage(photoUrl) : null,
        child: photoUrl == null
            ? Text(
                initials,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              )
            : null,
      ),
    );
  }

  Widget _buildFloatingPointsCard(int points) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.monetization_on_outlined,
            color: Colors.white,
            size: 22,
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Total Points",
                style: TextStyle(color: Colors.white70, fontSize: 13),
              ),
              Text(
                points.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // QUICK ACTIONS
  Widget _buildQuickActions(BuildContext context) {
    final actions = [
      {
        'icon': FontAwesomeIcons.trashCan,
        'label': 'Deposit Waste',
        'gradient': [Colors.teal, const Color(0xFF50C878)],
      },
      {
        'icon': FontAwesomeIcons.gift,
        'label': 'Withdraw Points',
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
            return Card(
              elevation: 6,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(15),
                onTap: () {
                  if (index == 0) context.pushRoute(DepositFirebaseRoute());
                  if (index == 1) {
                    context.pushRoute(FirebaseMainRoute(initialIndex: 2));
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: item['gradient'] as List<Color>,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          item['icon'] as IconData,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        item['label'] as String,
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
          },
        ),
      ],
    );
  }

  // RECENT ACTIVITY
  Widget _buildRecentActivity(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Recent Activity',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 10),
        BlocBuilder<DepositFirebaseBloc, DepositFirebaseState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state.deposits.isEmpty) {
              return const Center(child: Text("No Data"));
            }

            return ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: state.deposits.length.clamp(0, 5),
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

  // LIST TILE BUILDER
  Widget _buildListTile(DepositFirebaseModel data) {
    final statusColor = getStatusColor(data.status);
    final createdText = DateFormat('dd MMM yyyy').format(data.createdAt);

    return ListTile(
      leading: Container(
        height: 36,
        width: 36,
        decoration: BoxDecoration(
          color: statusColor.withValues(alpha: 0.15),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(
          mapIconName(data.iconNameCategory ?? ""),
          size: 16,
          color: statusColor,
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
            style: TextStyle(color: statusColor, fontWeight: FontWeight.bold),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: statusColor.withValues(alpha: 0.4),
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
    );
  }

  // MAIN ACTIVITY CARD
  Widget _buildActivityCard(DepositFirebaseModel data) {
    final isPending = data.status == 'pending';

    if (!isPending) {
      return Card(
        elevation: 3,
        margin: const EdgeInsets.only(bottom: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: InkWell(
          onTap: () {
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
          child: _buildListTile(data),
        ),
      );
    }

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
          child: _buildListTile(data),
        ),
      ),
    );
  }
}
