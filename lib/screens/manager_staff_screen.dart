import 'package:flutter/material.dart';
import 'package:quanlynhanvien/components/button_component.dart';
import 'package:quanlynhanvien/components/header_component.dart';
import 'package:quanlynhanvien/constants/app_colors.dart';
import 'package:quanlynhanvien/screens/staff_screen.dart';
import 'package:quanlynhanvien/widgets/staff_widget.dart';

class ManagerStaffScreen extends StatefulWidget {
  const ManagerStaffScreen({super.key});

  @override
  State<ManagerStaffScreen> createState() => _ManagerStaffScreenState();
}

class _ManagerStaffScreenState extends State<ManagerStaffScreen> {
  int tabs = 0;
  bool check = false;
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
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          tabs = 1;
                          check = false;
                        });
                      },
                      child: ButtonComponent(
                        check: tabs == 1,
                        iconDataStart: Icons.menu,
                        iconDataEnd: Icons.keyboard_arrow_left,
                        title: 'Tổng quan',
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          tabs = 2;
                          check = true;
                        });
                      },
                      child: ButtonComponent(
                        check: check,
                        iconDataStart: Icons.people,
                        iconDataEnd: check
                            ? Icons.keyboard_arrow_down
                            : Icons.keyboard_arrow_left,
                        title: 'Nhân viên',
                      ),
                    ),
                    if (check)
                      Padding(
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        child: Column(
                          children: [
                            GestureDetector(
                                onTap: () {
                                  setState(() {
                                    tabs = 2;
                                  });
                                },
                                child: ButtonComponent(
                                    check: tabs == 2,
                                    title: 'Danh sách nhân viên')),
                            GestureDetector(
                                onTap: () {
                                  setState(() {
                                    tabs = 3;
                                  });
                                },
                                child: ButtonComponent(
                                    check: tabs == 3, title: 'Phòng ban')),
                            GestureDetector(
                                onTap: () {
                                  setState(() {
                                    tabs = 4;
                                  });
                                },
                                child: ButtonComponent(
                                    check: tabs == 4, title: 'Chức vụ')),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
              const StaffWidget()
            ],
          )
        ],
      ),
    );
  }
}
