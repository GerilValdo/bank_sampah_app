import 'package:auto_route/auto_route.dart';
import 'package:bank_sampah_app/feature/withdraw/bloc/withdraw_firebase_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class WithdrawHistoryFirebaseScreen extends StatelessWidget {
  const WithdrawHistoryFirebaseScreen({super.key});
  static const String id = '/withdraw-history';

  @override
  Widget build(BuildContext context) {
    final userId = FirebaseAuth.instance.currentUser!.uid;

    // load history
    context.read<WithdrawFirebaseBloc>().add(
      WithdrawFirebaseEvent.loadRequests(userId),
    );

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFB),
      appBar: AppBar(
        title: const Text(
          "Withdraw History",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xFF10B981),
        elevation: 0,
      ),

      body: BlocBuilder<WithdrawFirebaseBloc, WithdrawFirebaseState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.teal),
            );
          }

          if (state.withdraws.isEmpty) {
            return const Center(
              child: Text(
                "No withdraw history yet.",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            );
          }

          return ListView.separated(
            padding: const EdgeInsets.all(20),
            itemCount: state.withdraws.length,
            separatorBuilder: (_, __) => const SizedBox(height: 14),
            itemBuilder: (context, index) {
              final w = state.withdraws[index];

              return Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 18,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    // ICON
                    _statusIcon(w.status),

                    const SizedBox(width: 14),

                    // DETAILS
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Rp ${w.amount.toStringAsFixed(0)}",
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "${w.pointsRequested} pts used",
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            _formatDate(w.createdAt),
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // STATUS BADGE
                    _statusBadge(w.status),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  // ================= ICON =================
  Widget _statusIcon(String status) {
    switch (status) {
      case "approved":
        return const Icon(Icons.check_circle, color: Colors.green, size: 36);
      case "rejected":
        return const Icon(Icons.cancel, color: Colors.red, size: 36);
      default:
        return const Icon(
          Icons.hourglass_bottom,
          color: Colors.orange,
          size: 36,
        );
    }
  }

  // ================= BADGE =================
  Widget _statusBadge(String status) {
    Color bg;
    Color tx;

    switch (status) {
      case "approved":
        bg = Colors.green.shade100;
        tx = Colors.green.shade800;
        break;
      case "rejected":
        bg = Colors.red.shade100;
        tx = Colors.red.shade800;
        break;
      default:
        bg = Colors.orange.shade100;
        tx = Colors.orange.shade800;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Text(
        status.toUpperCase(),
        style: TextStyle(color: tx, fontWeight: FontWeight.w600, fontSize: 12),
      ),
    );
  }

  // ================= DATE FORMATTER =================
  String _formatDate(DateTime date) {
    return "${date.day}/${date.month}/${date.year} • ${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}";
  }
}
