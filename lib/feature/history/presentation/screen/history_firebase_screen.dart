import 'package:auto_route/auto_route.dart';
import 'package:bank_sampah_app/feature/authentication/presentation/bloc/firebase_auth_bloc.dart';
import 'package:bank_sampah_app/feature/history/presentation/bloc/history_firebase_bloc.dart';
import 'package:bank_sampah_app/feature/history/presentation/widgets/firebase_transaction_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class HistoryFirebaseScreen extends StatefulWidget {
  const HistoryFirebaseScreen({super.key});
  static const String id = '/history-firebase';

  @override
  State<HistoryFirebaseScreen> createState() => _HistoryFirebaseScreenState();
}

class _HistoryFirebaseScreenState extends State<HistoryFirebaseScreen> {
  @override
  void initState() {
    super.initState();

    /// Ambil User dari AuthBloc
    final user = context.read<FirebaseAuthBloc>().state.maybeWhen(
      authenticated: (u) => u,
      orElse: () => null,
    );

    /// Jika user ada → load transaksi berdasarkan uid
    if (user != null) {
      context.read<HistoryFirebaseBloc>().add(
        HistoryFirebaseEvent.loadTransactions(user.uid!),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFB),
      body: BlocBuilder<HistoryFirebaseBloc, HistoryFirebaseState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.errorMessage != null) {
            return Center(child: Text('Error: ${state.errorMessage}'));
          }

          final transactions = state.filteredTransactions;

          return Column(
            children: [
              _buildHeader(state),
              const SizedBox(height: 10),
              _buildCategoryTabs(state.selectedCategory),
              const SizedBox(height: 12),
              Expanded(
                child: transactions.isEmpty
                    ? const Center(child: Text('No transactions yet.'))
                    : ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        itemCount: transactions.length,
                        itemBuilder: (context, index) {
                          return FirebaseTransactionCard(
                            data: transactions[index],
                          );
                        },
                      ),
              ),
            ],
          );
        },
      ),
    );
  }

  // ===========================================================================
  // HEADER
  // ===========================================================================
  Widget _buildHeader(HistoryFirebaseState state) {
    return Container(
      padding: const EdgeInsets.only(top: 50, left: 16, right: 16, bottom: 16),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF10B981), Color(0xFF14B8A6)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Transaction History',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 8),
          const Padding(
            padding: EdgeInsets.only(left: 12),
            child: Text(
              'View all your activities',
              style: TextStyle(color: Colors.white70, fontSize: 14),
            ),
          ),

          const SizedBox(height: 20),

          /// SUMMARY BOX
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildSummaryItem(state.completedCount.toString(), 'Completed'),
                _buildSummaryItem(state.pendingCount.toString(), 'Pending'),
                _buildSummaryItem(state.rejectedCount.toString(), 'Rejected'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(color: Colors.white70, fontSize: 13),
        ),
      ],
    );
  }

  // ===========================================================================
  // CATEGORY FILTER TABS
  // ===========================================================================
  Widget _buildCategoryTabs(String selectedCategory) {
    final tabs = ['All', 'Completed', 'Pending', 'Rejected'];

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.green.withValues(alpha: 0.15),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: tabs.map((tab) {
          final isActive = tab == selectedCategory;

          return Expanded(
            child: GestureDetector(
              onTap: () {
                context.read<HistoryFirebaseBloc>().add(
                  HistoryFirebaseEvent.filterChanged(tab),
                );
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: isActive
                      ? const Color(0xFF10B981)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    tab,
                    style: TextStyle(
                      color: isActive ? Colors.white : Colors.grey[700],
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
