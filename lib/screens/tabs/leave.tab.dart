import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:quanlynhanvien/constants/app_colors.dart';
import 'package:quanlynhanvien/models/nhanvien.model.dart';
import 'package:quanlynhanvien/models/yeucaunghiphep.model.dart';
import 'package:quanlynhanvien/providers/nhanvien.provider.dart';
import 'package:quanlynhanvien/providers/yeucaunghiphep.provider.dart';

GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class LeaveTab extends StatelessWidget {
  const LeaveTab({super.key});

  @override
  Widget build(BuildContext context) {
    final yeuCauNghiPhepProvider = Provider.of<YeuCauNghiPhepProvider>(context);
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
                    StreamBuilder<List<YeuCauNghiPhep>>(
                        stream: yeuCauNghiPhepProvider.getAllYeuCauNghiPhep(),
                        builder: (context, snapshot) {
                          final listYCNP = snapshot.data;
                          return PaginatedDataTable(
                            source: RowSource(
                                myData: listYCNP,
                                count: listYCNP?.length ?? 0,
                                context: context),
                            rowsPerPage: 10,
                            columnSpacing: 50,
                            columns: [
                              DataColumn(
                                  label: const Text(
                                    "STT",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14),
                                  ),
                                  onSort: (columnIndex, ascending) {}),
                              DataColumn(
                                  label: const Text(
                                    "Mã nhân viên",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14),
                                  ),
                                  onSort: (columnIndex, ascending) {}),
                              const DataColumn(
                                label: Text(
                                  "Tên nhân viên",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14),
                                ),
                              ),
                              const DataColumn(
                                label: SizedBox(
                                  width: 100,
                                  // Kích thước tương đối của cột (30% chiều rộng màn hình)
                                  child: Text(
                                    "Ngày bắt đầu",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14),
                                  ),
                                ),
                              ),
                              const DataColumn(
                                label: Text(
                                  "Ngày kết thúc",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14),
                                ),
                              ),
                              const DataColumn(
                                label: Text(
                                  "Lý do",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14),
                                ),
                              ),
                              const DataColumn(
                                label: Text(
                                  "Trạng thái",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14),
                                ),
                              ),
                              const DataColumn(
                                label: Text(
                                  "Quyết định",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14),
                                ),
                              ),
                            ],
                          );
                        }),
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
  BuildContext context;
  RowSource({
    required this.context,
    required this.myData,
    required this.count,
  });

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
  final yeuCauNghiPhepProvider = Provider.of<YeuCauNghiPhepProvider>(context);
  final nhanVienProvider = Provider.of<NhanVienProvider>(context);
  final yeuCauNghiPhep = data;
  return DataRow(
    cells: [
      DataCell(Text((index + 1).toString())),
      DataCell(SizedBox(width: 100, child: Text(data.maNV.toString()))),
      DataCell(FutureBuilder<NhanVien>(
          future: nhanVienProvider.getNhanVien(data.maNV),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final nhanVien = snapshot.data;
              return Text(nhanVien!.hoTen);
            }
            return Text('');
          })),
      DataCell(Text(DateFormat('MM/dd/yyyy').format(data.ngayBatDau.toDate()))),
      DataCell(
          Text(DateFormat('MM/dd/yyyy').format(data.ngayKetThuc.toDate()))),
      DataCell(Text(data.lyDo.toString())),
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
              onPressed: () {
                yeuCauNghiPhep.trangThai = 'Đã duyệt';
                yeuCauNghiPhep.ngayDuyet = Timestamp.fromDate(DateTime.now());
                yeuCauNghiPhepProvider.updYeuCauNghiPhep(yeuCauNghiPhep);
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.highlight_off_outlined,
                color: Colors.red,
              ),
              onPressed: () {
                yeuCauNghiPhep.trangThai = 'Không được duyệt';
                yeuCauNghiPhep.ngayDuyet = Timestamp.fromDate(DateTime.now());
                yeuCauNghiPhepProvider.updYeuCauNghiPhep(yeuCauNghiPhep);
              },
            ),
          ],
        ))
    ],
  );
}
