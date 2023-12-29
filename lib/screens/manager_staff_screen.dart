import 'package:flutter/material.dart';
import 'package:flutter_toolbar/flutter_toolbar.dart';
import 'package:quanlynhanvien/components/button_component.dart';
import 'package:quanlynhanvien/components/header_component.dart';
import 'package:quanlynhanvien/constants/app_colors.dart';

class ManagerStaffScreen extends StatefulWidget {
  const ManagerStaffScreen({super.key});

  @override
  State<ManagerStaffScreen> createState() => _ManagerStaffScreenState();
}

class _ManagerStaffScreenState extends State<ManagerStaffScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const HeaderComponent(
              name: 'Nguyễn Trung Tính',
              email: 'trungtinh1620@gmail.com',
              avatar: 'assets/images/avatar.jpg'),
          Row(
            children: [
              Container(
                height: MediaQuery.of(context).size.height - 70,
                width: 250,
                color: AppColors.blueColor,
                child: Column(
                  children: [
                    ButtonComponent(
                      iconDataStart: Icons.menu,
                      iconDataEnd: Icons.arrow_back_ios,
                      title: 'Tổng quan',
                      onPressed: () {},
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
