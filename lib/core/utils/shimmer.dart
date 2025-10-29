import 'package:bank_sampah_app/core/constants/export.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
class ShimmerLoading extends StatelessWidget {
  const ShimmerLoading({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColor.gray300,
      highlightColor: Colors.grey[300]!,
      child: child,
    );
  }
}
