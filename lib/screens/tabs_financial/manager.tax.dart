import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quanlynhanvien/components/content.component.dart';
import 'package:quanlynhanvien/components/update.bacthue.component.dart';
import 'package:quanlynhanvien/constants/app_colors.dart';
import 'package:quanlynhanvien/models/bacthue.model.dart';

GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class ManagerTaxTab extends StatefulWidget {
  const ManagerTaxTab({super.key});

  @override
  State<ManagerTaxTab> createState() => _ManagerTaxTabState();
}

class _ManagerTaxTabState extends State<ManagerTaxTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.sizeOf(context).width / 30),
          child: ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            children: [
              SizedBox(
                height: MediaQuery.sizeOf(context).height / 30,
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: AppColors.greyShuttle),
                    borderRadius: BorderRadius.circular(15)),
                padding: const EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Text(
                          'Một số qui định',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height / 30,
                    ),
                    const Row(
                      children: [
                        ContentComponent(
                            title: 'Số ngày làm việc qui định: ',
                            content: '26 ngày'),
                      ],
                    ),
                    const Row(
                      children: [
                        ContentComponent(
                            title: 'Giảm trừ bản thân: ',
                            content: '11.000.000 VND'),
                      ],
                    ),
                    const Row(
                      children: [
                        ContentComponent(
                            title: 'Giảm trừ phụ thuộc: ',
                            content: '4.400.000 VND'),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height / 30,
                    ),
                    const Text(
                      'Các bật thế',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    PaginatedDataTable(
                      source: RowSource(
                          myData: listBacThue,
                          count: listBacThue.length,
                          context: context),
                      rowsPerPage: 7,
                      columnSpacing: 50,
                      columns: [
                        DataColumn(
                            label: const Text(
                              "Bậc thuế",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 14),
                            ),
                            onSort: (columnIndex, ascending) {}),
                        DataColumn(
                            label: const Text(
                              "Phần thu nhập tính thuế/Tháng",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 14),
                            ),
                            onSort: (columnIndex, ascending) {}),
                        const DataColumn(
                          label: Text(
                            "Thuế suất",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 14),
                          ),
                        ),
                        const DataColumn(
                          label: Text(
                            "Thao tác",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

class RowSource extends DataTableSource {
  // ignore: prefer_typing_uninitialized_variables
  final myData;
  // ignore: prefer_typing_uninitialized_variables
  final count;
  final BuildContext context;
  RowSource({required this.myData, required this.count, required this.context});

  @override
  DataRow? getRow(int index) {
    if (index < rowCount) {
      return recentFileDataRow(myData![index], index, context);
    } else {
      return null;
    }
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => count;

  @override
  int get selectedRowCount => 0;
}

DataRow recentFileDataRow(var data, int index, BuildContext context) {
  return DataRow(
    cells: [
      DataCell(Text((data.soBac.toString()))),
      if (data.soBac == 7)
        DataCell(Text('Trên ${data.endValue}'))
      else
        DataCell(Text('Trên ${data.startValue} Đến ${data.endValue}')),
      DataCell(Text(data.thueSuat.toString())),
      DataCell(IconButton(
        icon: const Icon(Icons.edit_outlined),
        onPressed: () {
          showDialog(
              context: context,
              builder: (builder) {
                return const UpdateBacThueComponent();
              });
        },
      ))
    ],
  );
}
