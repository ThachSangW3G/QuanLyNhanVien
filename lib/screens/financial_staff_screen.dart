import 'package:flutter/material.dart';
import 'package:quanlynhanvien/components/button_component.dart';
import 'package:quanlynhanvien/components/header_component.dart';
import 'package:quanlynhanvien/constants/app_colors.dart';
import 'package:quanlynhanvien/screens/tabs_financial/allowance.tab.dart';
import 'package:quanlynhanvien/screens/tabs_financial/manager.salaryexport.tab.dart';
import 'package:quanlynhanvien/screens/tabs_financial/manager.salarytable.tab.dart';
import 'package:quanlynhanvien/screens/tabs_financial/manager.tax.dart';
import 'package:quanlynhanvien/screens/tabs_financial/manager.wage.tab.dart';
import 'package:quanlynhanvien/screens/tabs_staff/change.user.tab.dart';

class FinancialScreen extends StatefulWidget {
  final String page;
  const FinancialScreen({super.key, required this.page});

  @override
  State<FinancialScreen> createState() => _FinancialScreenState();
}

class _FinancialScreenState extends State<FinancialScreen> {
  int? tabs;

  List<String> pages = [
    'managerWage',
    'allowance',
    'managerTax',
    'salaryExport',
    'salaryTable',
    'ChangeUser'
  ];
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
                            title: 'Hệ số lương',
                            onPressed: () {
                              setState(() {
                                tabs = 0;
                              });
                              Navigator.pushNamed(
                                  context, '/financial/managerWage');
                            }),
                        ButtonComponent(
                          check: tabs == 1,
                          iconDataStart: Icons.spa,
                          iconDataEnd: tabs == 1
                              ? Icons.keyboard_arrow_right
                              : Icons.keyboard_arrow_left,
                          title: 'Phụ cấp',
                          onPressed: () {
                            setState(() {
                              tabs = 1;
                            });
                            Navigator.pushNamed(
                                context, '/financial/allowance');
                          },
                        ),
                        ButtonComponent(
                          check: tabs == 2,
                          iconDataStart: Icons.account_balance_wallet_sharp,
                          iconDataEnd: tabs == 2
                              ? Icons.keyboard_arrow_right
                              : Icons.keyboard_arrow_left,
                          title: 'Thay đổi qui định',
                          onPressed: () {
                            setState(() {
                              tabs = 2;
                            });
                            Navigator.pushNamed(
                                context, '/financial/managerTax');
                          },
                        ),
                        ButtonComponent(
                          check: tabs == 3,
                          iconDataStart: Icons.account_balance_wallet_sharp,
                          iconDataEnd: tabs == 3
                              ? Icons.keyboard_arrow_right
                              : Icons.keyboard_arrow_left,
                          title: 'Xuất lương',
                          onPressed: () {
                            setState(() {
                              tabs = 3;
                            });
                            Navigator.pushNamed(
                                context, '/financial/salaryExport');
                          },
                        ),
                        ButtonComponent(
                          check: tabs == 4,
                          iconDataStart: Icons.account_balance_wallet_sharp,
                          iconDataEnd: tabs == 4
                              ? Icons.keyboard_arrow_right
                              : Icons.keyboard_arrow_left,
                          title: 'Bảng lương',
                          onPressed: () {
                            setState(() {
                              tabs = 4;
                            });
                            Navigator.pushNamed(
                                context, '/financial/salaryTable');
                          },
                        ),
                        ButtonComponent(
                          check: tabs == 5,
                          iconDataStart: Icons.cached,
                          iconDataEnd: tabs == 5
                              ? Icons.keyboard_arrow_right
                              : Icons.keyboard_arrow_left,
                          title: 'Thay đổi mật khẩu',
                          onPressed: () {
                            setState(() {
                              tabs = 5;
                            });
                            Navigator.pushNamed(
                                context, '/financial/ChangeUser');
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
                          ManagerWageTab(),
                          AllowanceTab(),
                          ManagerTaxTab(),
                          ManagerSalaryExportTab(),
                          ManagerSalaryTableTab(),
                          ChangeUser()
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
