import 'package:auto_route/auto_route.dart';
import 'package:bank_sampah_app/feature/authentication/presentation/bloc/auth_bloc.dart';
import 'package:bank_sampah_app/feature/rewards/bloc/withdraw_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class WithdrawScreen extends StatefulWidget {
  const WithdrawScreen({super.key});
  static const String id = '/withdraw';

  @override
  State<WithdrawScreen> createState() => _WithdrawScreenState();
}

class _WithdrawScreenState extends State<WithdrawScreen> {
  final TextEditingController _pointsCtrl = TextEditingController();
  final TextEditingController _phoneCtrl = TextEditingController();
  String? paymentMethod;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFB),
      body: BlocConsumer<WithdrawBloc, WithdrawState>(
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
        },
        builder: (context, state) {
          final authState = context.watch<AuthBloc>().state;
          final user = authState.maybeWhen(
            authenticated: (u) => u,
            orElse: () => null,
          );

          if (user == null) {
            return const Center(child: Text("Not logged in"));
          }

          return Stack(
            clipBehavior: Clip.none,
            children: [
              // ================= HEADER =================
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
                      onTap: () => Navigator.pop(context),
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 26,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "Withdraw Points",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Your available points",
                      style: TextStyle(color: Colors.white70, fontSize: 13),
                    ),
                    const SizedBox(height: 4),
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

              // =============== FLOATING CONTENT =================
              Positioned(
                top: size.height * 0.20,
                left: 0,
                right: 0,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Material(
                        elevation: 8,
                        borderRadius: BorderRadius.circular(20),
                        child: _buildInputCard(),
                      ),
                      const SizedBox(height: 22),
                      Material(
                        elevation: 4,
                        borderRadius: BorderRadius.circular(20),
                        child: _buildSummaryCard(),
                      ),
                      const SizedBox(height: 30),
                      _buildSubmitButton(user),
                      const SizedBox(height: 30),
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

  // ================= INPUT CARD =================
  Widget _buildInputCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Withdraw Amount",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
          ),
          const SizedBox(height: 14),

          TextField(
            controller: _pointsCtrl,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "Points to withdraw",
              prefixIcon: const Icon(Icons.toll, color: Colors.teal),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onChanged: (_) => setState(() {}),
          ),

          const SizedBox(height: 20),

          DropdownButtonFormField<String>(
            value: paymentMethod,
            items: const [
              DropdownMenuItem(value: "cash", child: Text("Cash (in person)")),
              DropdownMenuItem(value: "gopay", child: Text("Gopay")),
              DropdownMenuItem(value: "ovo", child: Text("OVO")),
              DropdownMenuItem(value: "dana", child: Text("DANA")),
              DropdownMenuItem(value: "bank", child: Text("Bank Transfer")),
            ],
            onChanged: (val) => setState(() => paymentMethod = val),
            decoration: InputDecoration(
              labelText: "Payment Method",
              prefixIcon: const Icon(
                Icons.account_balance_wallet,
                color: Colors.teal,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),

          const SizedBox(height: 20),

          TextField(
            controller: _phoneCtrl,
            decoration: InputDecoration(
              labelText: paymentMethod == "cash"
                  ? "Phone (optional)"
                  : "Account / Phone Number",
              prefixIcon: const Icon(Icons.phone, color: Colors.teal),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ================= SUMMARY CARD =================
  Widget _buildSummaryCard() {
    final points = int.tryParse(_pointsCtrl.text) ?? 0;
    final amount = points * 100;

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.teal.withOpacity(0.08),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          const Icon(Icons.monetization_on, color: Colors.teal, size: 30),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Estimated Value",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
              ),
              Text(
                "Rp ${amount.toStringAsFixed(0)}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.teal,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ================= SUBMIT BUTTON =================
  Widget _buildSubmitButton(user) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.teal,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
          elevation: 4,
        ),
        onPressed: () {
          final points = int.tryParse(_pointsCtrl.text) ?? 0;

          if (points <= 0) {
            _showError("Enter valid points!");
            return;
          }

          if (paymentMethod == null) {
            _showError("Choose a payment method!");
            return;
          }

          final amount = (points * 100).toDouble();

          context.read<WithdrawBloc>().add(
            WithdrawEvent.createRequest(
              userId: user.id!,
              pointsRequested: points,
              amount: amount,
              paymentMethod: paymentMethod!,
              phone: _phoneCtrl.text.isEmpty ? null : _phoneCtrl.text,
            ),
          );
        },
        child: const Text(
          "Submit Withdraw Request",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  void _showError(String msg) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(msg), backgroundColor: Colors.red));
  }
}
