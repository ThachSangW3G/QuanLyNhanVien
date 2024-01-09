import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:quanlynhanvien/components/input.moth.component.dart';
import 'package:quanlynhanvien/components/update.hesoluong.component.dart';
import 'package:quanlynhanvien/components/wage.detail.component.dart';
import 'package:quanlynhanvien/components/wage.phieuluongchinhthuc.component.dart';
import 'package:quanlynhanvien/constants/app_colors.dart';
import 'package:quanlynhanvien/models/nhanvien.model.dart';
import 'package:quanlynhanvien/models/phieuluonchinhthuc.model.dart';
import 'package:quanlynhanvien/models/yeucaunghiphep.model.dart';
import 'package:quanlynhanvien/providers/nhanvien.provider.dart';
import 'package:quanlynhanvien/providers/phieuluongchinhthuc.provider.dart';

GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class ManagerSalaryTableTab extends StatefulWidget {
  const ManagerSalaryTableTab({super.key});

  @override
  State<ManagerSalaryTableTab> createState() => _ManagerWageTabState();
}

class _ManagerWageTabState extends State<ManagerSalaryTableTab> {
  DateTime datetime = DateTime.now();
  @override
  Widget build(BuildContext context) {
    final phieuLuongChinhThucProvider =
        Provider.of<PhieuLuongChinhThucProvider>(context);
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
                      'Bảng lương theo tháng',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'CeraPro'),
                    ),
                    Row(
                      children: [
                        InputMonthPicker(
                            label: 'Tháng - năm',
                            name: DateFormat('MM/yyyy').format(datetime),
                            hinttext: 'MM/YYYY',
                            onChanged: (value) async {
                              setState(() {
                                datetime = value;
                              });
                            })
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    FutureBuilder<List<PhieuLuongChinhThuc>>(
                        future: phieuLuongChinhThucProvider
                            .getPhieuLuongByThangNam(datetime),
                        builder: (context, snapshot) {
                          final listPLCT = snapshot.data;
                          return PaginatedDataTable(
                            source: RowSource(
                                myData: listPLCT,
                                count: listPLCT?.length ?? 0,
                                context: context),
                            rowsPerPage: 10,
                            columnSpacing: 150,
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
                                    "Lương",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14),
                                  ),
                                ),
                              ),
                              const DataColumn(
                                label: SizedBox(
                                  width: 100,
                                  // Kích thước tương đối của cột (30% chiều rộng màn hình)
                                  child: Text(
                                    "Chi tiết",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14),
                                  ),
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
  final PhieuLuongChinhThuc phieuLuongChinhThuc = data;
  final nhanVienProvider = Provider.of<NhanVienProvider>(context);
  return DataRow(
    cells: [
      DataCell(Text((index + 1).toString())),
      DataCell(SizedBox(
          width: 100, child: Text(phieuLuongChinhThuc.maNV.toString()))),
      DataCell(FutureBuilder<NhanVien>(
          future: nhanVienProvider.getNhanVien(data.maNV),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final nhanVien = snapshot.data;
              return Text(nhanVien!.hoTen);
            }
            return Text('');
          })),
      DataCell(Text(phieuLuongChinhThuc.luong.toString())),
      DataCell(IconButton(
        icon: const Icon(Icons.article),
        onPressed: () {
          showDialog(
              context: _scaffoldKey.currentContext!,
              builder: (builder) {
                return WagePhieuLuongChinhThuc(
                  phieuLuongChinhThuc: data,
                );
              });
        },
      ))
    ],
  );
}
