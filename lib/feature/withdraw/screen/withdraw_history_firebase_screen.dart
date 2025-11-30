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

              return Material(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                child: InkWell(
                  borderRadius: BorderRadius.circular(16),
                  onTap: () {
                    _showStatusBottomSheet(context, w.id!, w.status);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 18,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.05),
                          blurRadius: 8,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        _statusIcon(w.status),
                        const SizedBox(width: 14),

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

                        _statusBadge(w.status),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  //  BOTTOM SHEET 
  void _showStatusBottomSheet(
    BuildContext context,
    String requestId,
    String currentStatus,
  ) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 45,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              const SizedBox(height: 16),

              const Text(
                "Update Withdraw Status",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),

              const SizedBox(height: 18),

              _statusOption(
                context,
                label: "Pending",
                status: "pending",
                color: Colors.orange,
                icon: Icons.hourglass_bottom,
                requestId: requestId,
              ),

              _statusOption(
                context,
                label: "Approved",
                status: "approved",
                color: Colors.green,
                icon: Icons.check_circle,
                requestId: requestId,
              ),

              _statusOption(
                context,
                label: "Rejected",
                status: "rejected",
                color: Colors.red,
                icon: Icons.cancel,
                requestId: requestId,
              ),

              const SizedBox(height: 12),
              TextButton(
                onPressed: () => Navigator.pop(ctx),
                child: const Text(
                  "Cancel",
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }

  Widget _statusOption(
    BuildContext context, {
    required String label,
    required String status,
    required Color color,
    required IconData icon,
    required String requestId,
  }) {
    return GestureDetector(
      onTap: () {
        context.read<WithdrawFirebaseBloc>().add(
          WithdrawFirebaseEvent.updateStatus(requestId, status),
        );
        Navigator.pop(context);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: color.withValues(alpha: 0.10),
          border: Border.all(color: color.withValues(alpha: 0.25)),
        ),
        child: Row(
          children: [
            Icon(icon, size: 26, color: color),
            const SizedBox(width: 14),
            Text(
              label,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }

  //  ICON 
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

  //  BADGE 
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

  //  DATE FORMATTER 
  String _formatDate(DateTime date) {
    return "${date.day}/${date.month}/${date.year} • ${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}";
  }
}
