import 'package:auto_route/auto_route.dart';
import 'package:bank_sampah_app/feature/authentication/presentation/bloc/firebase_auth_bloc.dart';
import 'package:bank_sampah_app/feature/withdraw/bloc/withdraw_firebase_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class WithdrawFirebaseScreen extends StatefulWidget {
  const WithdrawFirebaseScreen({super.key});
  static const String id = '/withdraw-firebase';

  @override
  State<WithdrawFirebaseScreen> createState() => _WithdrawFirebaseScreenState();
}

class _WithdrawFirebaseScreenState extends State<WithdrawFirebaseScreen> {
  int? selectedAmount;

  final withdrawPackages = [
    {"amount": 10000, "points": 100},
    {"amount": 20000, "points": 200},
    {"amount": 50000, "points": 500},
    {"amount": 100000, "points": 1000},
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFB),

      body: BlocConsumer<WithdrawFirebaseBloc, WithdrawFirebaseState>(
        listener: (context, state) {
          if (state.successMessage != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.successMessage!),
                backgroundColor: Colors.green,
              ),
            );
            context.router.pop();
          }

          if (state.errorMessage != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage!),
                backgroundColor: Colors.red,
              ),
            );
          }
        },

        builder: (context, state) {
          final authState = context.watch<FirebaseAuthBloc>().state;

          final user = authState.maybeWhen(
            authenticated: (u) => u,
            orElse: () => null,
          );

          if (user == null) return const Center(child: Text("Not logged in"));

          return Stack(
            clipBehavior: Clip.none,
            children: [
              // HEADER
              Container(
                height: size.height * 0.25,
                width: double.infinity,
                padding: const EdgeInsets.only(top: 55, left: 20, right: 20),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () => context.router.pop(),
                      child: const Icon(Icons.arrow_back, color: Colors.white),
                    ),
                    const SizedBox(height: 16),

                    const Text(
                      "Withdraw Cash",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 10),

                    const Text(
                      "Your available points",
                      style: TextStyle(color: Colors.white70, fontSize: 13),
                    ),
                    Text(
                      "${user.totalPoints} pts",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              // FLOATING CONTENT
              Positioned(
                top: size.height * 0.28,
                left: 0,
                right: 0,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Material(
                        elevation: 8,
                        borderRadius: BorderRadius.circular(22),
                        shadowColor: Colors.teal.withOpacity(0.2),
                        child: _buildPackageSelection(user.totalPoints),
                      ),

                      const SizedBox(height: 30),
                      _buildSubmitButton(user),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  // ================= PACKAGE SELECTION =================
  Widget _buildPackageSelection(int userPoints) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Choose Withdraw Amount",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 17,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 20),

          Column(
            children: withdrawPackages.map((pkg) {
              final amount = pkg["amount"] as int;
              final points = pkg["points"] as int;

              final canWithdraw = userPoints >= points;
              final isSelected = selectedAmount == amount;

              return GestureDetector(
                onTap: () {
                  if (canWithdraw) {
                    setState(() => selectedAmount = amount);
                  }
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 14),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? Colors.teal.withOpacity(0.12)
                        : Colors.grey.shade50,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: isSelected
                          ? Colors.teal
                          : canWithdraw
                          ? Colors.grey.shade300
                          : Colors.red.shade200,
                      width: isSelected ? 2 : 1,
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.attach_money,
                        size: 26,
                        color: isSelected
                            ? Colors.teal
                            : canWithdraw
                            ? Colors.teal
                            : Colors.red,
                      ),
                      const SizedBox(width: 12),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Rp ${amount.toString()}",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: canWithdraw
                                    ? Colors.black87
                                    : Colors.red.shade600,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "$points pts required",
                              style: TextStyle(
                                color: canWithdraw
                                    ? Colors.grey.shade700
                                    : Colors.red.shade600,
                              ),
                            ),
                          ],
                        ),
                      ),

                      if (isSelected)
                        const Icon(Icons.check_circle, color: Colors.teal),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  // ================= SUBMIT BUTTON =================
  Widget _buildSubmitButton(user) {
    final pkg = withdrawPackages.firstWhere(
      (p) => p["amount"] == selectedAmount,
      orElse: () => {},
    );

    final amount = pkg["amount"] ?? 0;
    final points = pkg["points"] ?? 0;

    final canSubmit = selectedAmount != null && user.totalPoints >= points;

    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: canSubmit ? Colors.teal : Colors.grey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
          elevation: 5,
        ),
        onPressed: canSubmit
            ? () {
                context.read<WithdrawFirebaseBloc>().add(
                  WithdrawFirebaseEvent.createRequest(
                    userId: user.uid,
                    pointsRequested: points,
                    amount: amount.toDouble(),
                    paymentMethod: "cash",
                  ),
                );
              }
            : null,
        child: const Text(
          "Request Withdraw",
          style: TextStyle(
            color: Colors.white,
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
