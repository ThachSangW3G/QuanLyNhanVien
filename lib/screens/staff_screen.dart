import 'package:flutter/material.dart';
import 'package:quanlynhanvien/components/button_component.dart';
import 'package:quanlynhanvien/components/header_component.dart';
import 'package:quanlynhanvien/constants/app_colors.dart';
import 'package:quanlynhanvien/screens/tabs_staff/rest.tab.dart';
import 'package:quanlynhanvien/screens/tabs_staff/change.user.tab.dart';
import 'package:quanlynhanvien/screens/tabs_staff/wage.tab.dart';

class StaffScreen extends StatefulWidget {
  final String page;
  const StaffScreen({super.key, required this.page});

  @override
  State<StaffScreen> createState() => _StaffScreenState();
}

class _StaffScreenState extends State<StaffScreen> {
  int? tabs;

  List<String> pages = ['Wage', 'Rest', 'ChangeUser'];

  @override
  Widget build(BuildContext context) {
    tabs = pages.indexOf(widget.page);

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
                            check: tabs == 0,
                            iconDataStart: Icons.paid,
                            iconDataEnd: tabs == 0
                                ? Icons.keyboard_arrow_right
                                : Icons.keyboard_arrow_left,
                            title: 'Thông tin lương',
                            onPressed: () {
                              setState(() {
                                tabs = 0;
                              });
                              Navigator.pushNamed(context, '/staff/Wage');
                            }),
                        ButtonComponent(
                          check: tabs == 1,
                          iconDataStart: Icons.spa,
                          iconDataEnd: tabs == 1
                              ? Icons.keyboard_arrow_right
                              : Icons.keyboard_arrow_left,
                          title: 'Yêu cầu nghĩ phép',
                          onPressed: () {
                            setState(() {
                              tabs = 1;
                            });
                            Navigator.pushNamed(context, '/staff/Rest');
                          },
                        ),
                        ButtonComponent(
                          check: tabs == 2,
                          iconDataStart: Icons.checklist,
                          iconDataEnd: tabs == 2
                              ? Icons.keyboard_arrow_right
                              : Icons.keyboard_arrow_left,
                          title: 'Thông tin tài khoản',
                          onPressed: () {
                            setState(() {
                              tabs = 2;
                            });
                            Navigator.pushNamed(context, '/staff/ChangeUser');
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                      height: MediaQuery.of(context).size.height - 70,
                      child: IndexedStack(
                        index: pages.indexOf(widget.page),
                        children: const [
                          WageTab(),
                          RestTab(),
                          ChangeUser(),
                        ],
                      )),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
