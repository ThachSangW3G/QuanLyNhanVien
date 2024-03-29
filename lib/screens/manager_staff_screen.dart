import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quanlynhanvien/components/button_component.dart';
import 'package:quanlynhanvien/components/header_component.dart';
import 'package:quanlynhanvien/constants/app_colors.dart';
import 'package:quanlynhanvien/models/nhanvien.model.dart';
import 'package:quanlynhanvien/providers/nguoidung.provider.dart';
import 'package:quanlynhanvien/providers/nhanvien.provider.dart';
import 'package:quanlynhanvien/screens/staff_screen.dart';
import 'package:quanlynhanvien/screens/tabs/staff.tab.dart';
import 'package:quanlynhanvien/screens/tabs/bonus.tab.dart';
import 'package:quanlynhanvien/screens/tabs/contract.tab.dart';
import 'package:quanlynhanvien/screens/tabs/createaccount.tab.dart';
import 'package:quanlynhanvien/screens/tabs/decipline.tab.dart';
import 'package:quanlynhanvien/screens/tabs/department.tab.dart';
import 'package:quanlynhanvien/screens/tabs/leave.tab.dart';
import 'package:quanlynhanvien/screens/tabs/overview.tab.dart';
import 'package:quanlynhanvien/screens/tabs/position.tab.dart';
import 'package:quanlynhanvien/screens/tabs/addstaff.tab.dart';
import 'package:quanlynhanvien/screens/tabs/timekeeping.tab.dart';
import 'package:quanlynhanvien/screens/tabs_staff/change.user.tab.dart';
import 'package:quanlynhanvien/widgets/staff_widget.dart';

class ManagerStaffScreen extends StatefulWidget {
  final String page;
  const ManagerStaffScreen({super.key, required this.page});

  @override
  State<ManagerStaffScreen> createState() => _ManagerStaffScreenState();
}

class _ManagerStaffScreenState extends State<ManagerStaffScreen> {
  bool checkStaff = false;
  bool checkKhenPhat = false;

  List<String> pages = [
    'Overview',
    'Staff',
    'AddStaff',
    'Department',
    'Position',
    'Contract',
    'Bonus',
    'Decipline',
    'Leave',
    'TimeKeeping',
    'ChangeUser'
  ];

  int? tabs;

  @override
  Widget build(BuildContext context) {
    tabs = pages.indexOf(widget.page);
    final nguoiDungProvider = Provider.of<NguoiDungProvider>(context);
    final nhanVien = Provider.of<NhanVienProvider>(context)
        .getNhanVien(nguoiDungProvider.nguoiDung!.maNV);
    if (widget.page == 'Staff' ||
        widget.page == 'AddStaff' ||
        widget.page == 'Department' ||
        widget.page == 'Position') {
      checkStaff = true;
    }
    if (widget.page == 'Bonus' || widget.page == 'Decipline') {
      checkKhenPhat = true;
    }
    return Scaffold(
      body: DefaultTextStyle(
          style: const TextStyle(
            fontFamily: 'CeraPro',
          ),
          child: Column(
            children: [
              HeaderComponent(
                  name: 'Nguyễn Trung Tính',
                  email: nguoiDungProvider.nguoiDung!.tenDangNhap,
                  avatar: 'assets/images/avatar.jpg'),
              Row(children: [
                Container(
                  height: MediaQuery.of(context).size.height - 70,
                  width: 280,
                  color: AppColors.blueColor,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
                    child: ListView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      children: [
                        ButtonComponent(
                            check: tabs == 0,
                            iconDataStart: Icons.menu,
                            iconDataEnd: tabs == 0
                                ? Icons.keyboard_arrow_right
                                : Icons.keyboard_arrow_left,
                            title: 'Tổng quan',
                            onPressed: () {
                              setState(() {
                                tabs = 0;
                                checkStaff = false;
                                checkKhenPhat = false;
                              });
                              Navigator.pushNamed(
                                  context, '/managerStaff/Overview');
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
                              tabs = 1;
                              checkStaff = true;
                              checkKhenPhat = false;
                            });
                            Navigator.pushNamed(context, '/managerStaff/Staff');
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
                                        tabs = 1;
                                      });
                                      Navigator.pushNamed(
                                          context, '/managerStaff/Staff');
                                    },
                                    iconDataStart: Icons.visibility,
                                    check: tabs == 1,
                                    title: 'Danh sách nhân viên'),
                                ButtonComponent(
                                    onPressed: () {
                                      setState(() {
                                        tabs = 2;
                                      });
                                      Navigator.pushNamed(
                                          context, '/managerStaff/AddStaff');
                                    },
                                    iconDataStart: Icons.add,
                                    check: tabs == 2,
                                    title: 'Thêm mới nhân viên'),
                                ButtonComponent(
                                    onPressed: () {
                                      setState(() {
                                        tabs = 3;
                                      });
                                      Navigator.pushNamed(
                                          context, '/managerStaff/Department');
                                    },
                                    iconDataStart: Icons.assessment,
                                    check: tabs == 3,
                                    title: 'Phòng ban'),
                                ButtonComponent(
                                    onPressed: () {
                                      setState(() {
                                        tabs = 4;
                                      });
                                      Navigator.pushNamed(
                                          context, '/managerStaff/Position');
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
                            Navigator.pushNamed(
                                context, '/managerStaff/Contract');
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
                            Navigator.pushNamed(
                              context,
                              '/managerStaff/Bonus',
                            );
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
                                      Navigator.pushNamed(
                                          context, '/managerStaff/Bonus');
                                    },
                                    iconDataStart: Icons.cookie,
                                    check: tabs == 6,
                                    title: 'Khen thưởng'),
                                ButtonComponent(
                                    onPressed: () {
                                      setState(() {
                                        tabs = 7;
                                      });
                                      Navigator.pushNamed(
                                          context, '/managerStaff/Decipline');
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
                          title: 'Nghỉ phép',
                          onPressed: () {
                            setState(() {
                              tabs = 8;
                              checkStaff = false;
                              checkKhenPhat = false;
                            });
                            Navigator.pushNamed(context, '/managerStaff/Leave');
                          },
                        ),
                        ButtonComponent(
                          check: tabs == 9,
                          iconDataStart: Icons.date_range_outlined,
                          iconDataEnd: tabs == 9
                              ? Icons.keyboard_arrow_right
                              : Icons.keyboard_arrow_left,
                          title: 'Danh sách chấm công',
                          onPressed: () {
                            setState(() {
                              tabs = 9;
                              checkStaff = false;
                              checkKhenPhat = false;
                            });
                            Navigator.pushNamed(
                                context, '/managerStaff/TimeKeeping');
                          },
                        ),
                        ButtonComponent(
                          check: tabs == 10,
                          iconDataStart: Icons.cached,
                          iconDataEnd: tabs == 10
                              ? Icons.keyboard_arrow_right
                              : Icons.keyboard_arrow_left,
                          title: 'Thay đổi mật khẩu',
                          onPressed: () {
                            setState(() {
                              tabs = 10;
                              checkStaff = false;
                              checkKhenPhat = false;
                            });
                            Navigator.pushNamed(
                                context, '/managerStaff/ChangeUser');
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
                          OverviewTab(),
                          StaffTab(),
                          AddStaffTab(),
                          DepartmentTab(),
                          PositionTab(),
                          ConstactTab(),
                          BonusTab(),
                          DeciplineTab(),
                          LeaveTab(),
                          TimeKeeping(),
                          ChangeUser()
                        ],
                      )),
                )
              ]),
            ],
          )),
    );
  }
}
