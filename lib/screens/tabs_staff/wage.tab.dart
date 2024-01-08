import 'package:flutter/material.dart';
import 'package:quanlynhanvien/constants/app_colors.dart';
import 'package:quanlynhanvien/models/bangluong.model.dart';

GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class WageTab extends StatefulWidget {
  const WageTab({super.key});

  @override
  State<WageTab> createState() => _WageTabState();
}

class _WageTabState extends State<WageTab> {
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
              const Text(
                'Bảng Lương',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'CeraPro'),
              ),
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
                    const Text(
                      'Danh sách yêu cầu nghĩ phép',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'CeraPro'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    PaginatedDataTable(
                      source: RowSource(
                          myData: listBangLuong, count: listBangLuong.length),
                      rowsPerPage: 10,
                      columnSpacing: 50,
                      columns: [
                        DataColumn(
                            label: const Text(
                              "STT",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 14),
                            ),
                            onSort: (columnIndex, ascending) {}),
                        DataColumn(
                            label: const Text(
                              "Họ và tên",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 14),
                            ),
                            onSort: (columnIndex, ascending) {}),
                        const DataColumn(
                          label: Text(
                            "Số tiền",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 14),
                          ),
                        ),
                        const DataColumn(
                          label: Text(
                            "Tháng",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 14),
                          ),
                        ),
                        const DataColumn(
                          label: Text(
                            "Năm",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 14),
                          ),
                        ),
                        const DataColumn(
                          label: Text(
                            "Chi tiết",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height / 30,
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
  RowSource({
    required this.myData,
    required this.count,
  });

  @override
  DataRow? getRow(int index) {
    if (index < rowCount) {
      return recentFileDataRow(myData![index]);
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

DataRow recentFileDataRow(var data) {
  final khenThuong = data as BangLuong;
  return DataRow(
    cells: [
      DataCell(Text((listBangLuong.indexOf(khenThuong) + 1).toString())),
      const DataCell(Text('Nguyễn Trung Tính')),
      DataCell(Text(data.soTien.toString())),
      DataCell(Text(data.thang.toString())),
      DataCell(Text(data.nam.toString())),
      DataCell(IconButton(
        icon: const Icon(
          Icons.article,
          color: Colors.green,
        ),
        onPressed: () {},
      ))
    ],
  );
}
