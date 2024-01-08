import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:quanlynhanvien/constants/app_colors.dart';
import 'package:quanlynhanvien/models/yeucaunghiphep.model.dart';

GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class LeaveTab extends StatelessWidget {
  const LeaveTab({super.key});

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
                'Quản lý nghĩ phép',
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
                          myData: listYeuCauNghiPhep,
                          count: listYeuCauNghiPhep.length),
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
                              "Mã nhân viên",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 14),
                            ),
                            onSort: (columnIndex, ascending) {}),
                        const DataColumn(
                          label: Text(
                            "Tên nhân viên",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 14),
                          ),
                        ),
                        const DataColumn(
                          label: SizedBox(
                            width: 100,
                            // Kích thước tương đối của cột (30% chiều rộng màn hình)
                            child: Text(
                              "Ngày bắt đầu",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 14),
                            ),
                          ),
                        ),
                        const DataColumn(
                          label: Text(
                            "Ngày kết thúc",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 14),
                          ),
                        ),
                        const DataColumn(
                          label: Text(
                            "Lý do",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 14),
                          ),
                        ),
                        const DataColumn(
                          label: Text(
                            "Trạng thái",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 14),
                          ),
                        ),
                        const DataColumn(
                          label: Text(
                            "Quyết định",
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
  final khenThuong = data as YeuCauNghiPhep;
  return DataRow(
    cells: [
      DataCell(Text((listYeuCauNghiPhep.indexOf(khenThuong) + 1).toString())),
      DataCell(SizedBox(width: 100, child: Text(data.maNV.toString()))),
      const DataCell(Text('Nguyễn Trung Tính')),
      DataCell(Text(data.lyDo.toString())),
      DataCell(Text(DateFormat('MM/dd/yyyy').format(data.ngayBatDau.toDate()))),
      DataCell(
          Text(DateFormat('MM/dd/yyyy').format(data.ngayKetThuc.toDate()))),
      DataCell(Text(data.trangThai.toString())),
      if (data.trangThai.toString() == 'Đã duyệt')
        DataCell(Container())
      else if (data.trangThai.toString() == 'Không được duyệt')
        DataCell(Container())
      else
        DataCell(Row(
          children: [
            IconButton(
              icon: const Icon(
                Icons.check_circle_outline,
                color: Colors.green,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(
                Icons.highlight_off_outlined,
                color: Colors.red,
              ),
              onPressed: () {},
            ),
          ],
        ))
    ],
  );
}
