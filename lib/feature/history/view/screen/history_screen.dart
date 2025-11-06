import 'package:auto_route/auto_route.dart';
import 'package:bank_sampah_app/feature/history/view/bloc/history_bloc.dart';
import 'package:bank_sampah_app/feature/history/widgets/transaction_card.dart';
// import 'package:bank_sampah_app/core/constants/app_style.dart';
// import 'package:bank_sampah_app/core/constants/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});
  static const String id = '/history';

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  String selectedCategory = 'All';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<HistoryBloc>().add(HistoryEvent.loadTransactions());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFB),
      body: BlocBuilder<HistoryBloc, HistoryState>(
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
              _buildHeader(context, state),
              const SizedBox(height: 10),
              _buildCategoryTabs(context, state.selectedCategory),
              const SizedBox(height: 12),
              Expanded(
                child: transactions.isEmpty
                    ? const Center(child: Text('No transactions yet.'))
                    : ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        itemCount: transactions.length,
                        itemBuilder: (context, index) {
                          return TransactionCard(data: transactions[index]);
                        },
                      ),
              ),
            ],
          );
        },
      ),
    );
  }

  // HEADER
  Widget _buildHeader(BuildContext context, HistoryState state) {
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
          Row(
            children: [
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back, color: Colors.white),
              ),
              const SizedBox(width: 4),
              const Text(
                'Transaction History',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
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

  // CATEGORY FILTER
  Widget _buildCategoryTabs(BuildContext context, String selectedCategory) {
    final tabs = ['All', 'Completed', 'Pending', 'Rejected'];
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(4),
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
          return GestureDetector(
            onTap: () {
              context.read<HistoryBloc>().add(HistoryEvent.filterChanged(tab));
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              decoration: BoxDecoration(
                color: isActive ? const Color(0xFF10B981) : Colors.transparent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                tab,
                style: TextStyle(
                  color: isActive ? Colors.white : Colors.grey[700],
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
