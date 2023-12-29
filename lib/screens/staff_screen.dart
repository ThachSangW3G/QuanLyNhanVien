import 'package:flutter/material.dart';
import 'package:quanlynhanvien/components/button_component.dart';
import 'package:quanlynhanvien/components/header_component.dart';
import 'package:quanlynhanvien/constants/app_colors.dart';

class StaffScreen extends StatefulWidget {
  const StaffScreen({super.key});

  @override
  State<StaffScreen> createState() => _StaffScreenState();
}

class _StaffScreenState extends State<StaffScreen> {
  int tabs = 0;
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
                            iconDataStart: Icons.paid,
                            iconDataEnd: tabs == 1
                                ? Icons.keyboard_arrow_right
                                : Icons.keyboard_arrow_left,
                            title: 'Thông tin lương',
                            onPressed: () {
                              setState(() {
                                tabs = 1;
                              });
                            }),
                        ButtonComponent(
                          check: tabs == 2,
                          iconDataStart: Icons.spa,
                          iconDataEnd: tabs == 2
                              ? Icons.keyboard_arrow_right
                              : Icons.keyboard_arrow_left,
                          title: 'Yêu cầu nghĩ phép',
                          onPressed: () {
                            setState(() {
                              tabs = 2;
                            });
                          },
                        ),
                        ButtonComponent(
                          check: tabs == 3,
                          iconDataStart: Icons.checklist,
                          iconDataEnd: tabs == 3
                              ? Icons.keyboard_arrow_right
                              : Icons.keyboard_arrow_left,
                          title: 'Chấm công',
                          onPressed: () {
                            setState(() {
                              tabs = 3;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
