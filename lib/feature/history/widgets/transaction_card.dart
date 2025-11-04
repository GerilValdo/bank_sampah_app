import 'package:bank_sampah_app/core/utils/icon_mapper.dart';
import 'package:bank_sampah_app/feature/deposit/models/deposit_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionCard extends StatelessWidget {
  final DepositModel data;
  const TransactionCard({super.key, required this.data});

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
  Widget build(BuildContext context) {
    final statusColor = getStatusColor(data.status);
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.green.withValues(alpha: 0.08),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: statusColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Icon(
                mapIconName(data.iconNameCategory ?? ''),
                color: Colors.green,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.nameCategory ?? '-',
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${data.weight.toString()} kg | ${DateFormat('yyyy/MM/dd').format(data.createdAt)} | ${DateFormat('HH:mm').format(data.createdAt)}',
                  style: const TextStyle(color: Colors.grey, fontSize: 13),
                ),
                const SizedBox(height: 4),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: statusColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    data.status,
                    style: TextStyle(
                      color: statusColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                if (data.reason != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      data.reason!,
                      style: const TextStyle(
                        color: Colors.redAccent,
                        fontSize: 12,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '+${data.totalPoints}',
                style: const TextStyle(
                  color: Color(0xFF10B981),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
