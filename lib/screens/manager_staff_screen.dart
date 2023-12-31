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
  bool checkStaff = false;
  bool checkKhenPhat = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTextStyle(
        style: const TextStyle(
          fontFamily: 'CeraPro',
        ),
        child: Column(
          children: [
            const HeaderComponent(
                name: 'Nguyễn Trung Tính',
                email: 'trungtinh1620@gmail.com',
                avatar: 'assets/images/avatar.jpg'),
            Row(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height - 70,
                  width: 280,
                  color: AppColors.blueColor,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
                    child: Column(
                      children: [
                        ButtonComponent(
                            check: tabs == 1,
                            iconDataStart: Icons.menu,
                            iconDataEnd: tabs == 1
                                ? Icons.keyboard_arrow_right
                                : Icons.keyboard_arrow_left,
                            title: 'Tổng quan',
                            onPressed: () {
                              setState(() {
                                tabs = 1;
                                checkStaff = false;
                                checkKhenPhat = false;
                              });
                            }),
                        ButtonComponent(
                          check: checkStaff,
                          iconDataStart: Icons.people,
                          iconDataEnd: checkStaff
                              ? Icons.keyboard_arrow_down
                              : Icons.keyboard_arrow_left,
                          title: 'Nhân viên',
                          onPressed: () {
                            setState(() {
                              tabs = 2;
                              checkStaff = true;
                              checkKhenPhat = false;
                            });
                          },
                        ),
                        if (checkStaff)
                          Padding(
                            padding: const EdgeInsets.only(left: 5, right: 5),
                            child: Column(
                              children: [
                                ButtonComponent(
                                    onPressed: () {
                                      setState(() {
                                        tabs = 2;
                                      });
                                    },
                                    iconDataStart: Icons.visibility,
                                    check: tabs == 2,
                                    title: 'Danh sách nhân viên'),
                                ButtonComponent(
                                    onPressed: () {
                                      setState(() {
                                        tabs = 3;
                                      });
                                    },
                                    iconDataStart: Icons.assessment,
                                    check: tabs == 3,
                                    title: 'Phòng ban'),
                                ButtonComponent(
                                    onPressed: () {
                                      setState(() {
                                        tabs = 4;
                                      });
                                    },
                                    iconDataStart: Icons.badge,
                                    check: tabs == 4,
                                    title: 'Chức vụ'),
                              ],
                            ),
                          ),
                        ButtonComponent(
                          check: tabs == 5,
                          iconDataStart: Icons.save_as,
                          iconDataEnd: tabs == 5
                              ? Icons.keyboard_arrow_down
                              : Icons.keyboard_arrow_left,
                          title: 'Hợp đồng lao động',
                          onPressed: () {
                            setState(() {
                              tabs = 5;
                              checkStaff = false;
                              checkKhenPhat = false;
                            });
                          },
                        ),
                        ButtonComponent(
                          check: checkKhenPhat,
                          iconDataStart: Icons.star,
                          iconDataEnd: checkKhenPhat
                              ? Icons.keyboard_arrow_down
                              : Icons.keyboard_arrow_left,
                          title: 'Khen thưởng - kỹ luật',
                          onPressed: () {
                            setState(() {
                              tabs = 6;
                              checkStaff = false;
                              checkKhenPhat = true;
                            });
                          },
                        ),
                        if (checkKhenPhat)
                          Padding(
                            padding: const EdgeInsets.only(left: 5, right: 5),
                            child: Column(
                              children: [
                                ButtonComponent(
                                    onPressed: () {
                                      setState(() {
                                        tabs = 6;
                                      });
                                    },
                                    iconDataStart: Icons.cookie,
                                    check: tabs == 6,
                                    title: 'Khen thưởng'),
                                ButtonComponent(
                                    onPressed: () {
                                      setState(() {
                                        tabs = 7;
                                      });
                                    },
                                    iconDataStart: Icons.electric_meter,
                                    check: tabs == 7,
                                    title: 'Kỷ luật'),
                              ],
                            ),
                          ),
                        ButtonComponent(
                          check: tabs == 8,
                          iconDataStart: Icons.credit_score,
                          iconDataEnd: tabs == 8
                              ? Icons.keyboard_arrow_right
                              : Icons.keyboard_arrow_left,
                          title: 'Nghĩ phép',
                          onPressed: () {
                            setState(() {
                              tabs = 8;
                              checkStaff = false;
                              checkKhenPhat = false;
                            });
                          },
                        ),
                        ButtonComponent(
                          check: tabs == 9,
                          iconDataStart: Icons.person_add,
                          iconDataEnd: tabs == 9
                              ? Icons.keyboard_arrow_right
                              : Icons.keyboard_arrow_left,
                          title: 'Tạo tài khoản',
                          onPressed: () {
                            setState(() {
                              tabs = 9;
                              checkStaff = false;
                              checkKhenPhat = false;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
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
