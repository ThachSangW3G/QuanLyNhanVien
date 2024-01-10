import 'package:flutter/material.dart';
import 'package:quanlynhanvien/constants/app_colors.dart';

class OverviewTab extends StatelessWidget {
  const OverviewTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: AppColors.bluedarkColor,
            child: const Center(
              child: Text(
                "Chào mừng trở lại",
                style: TextStyle(color: Colors.white),
              ),
            )));
  }
}
