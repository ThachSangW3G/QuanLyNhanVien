import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:quanlynhanvien/components/add.bonus.style.component.dart';
import 'package:quanlynhanvien/components/add.discipline.component.dart';
import 'package:quanlynhanvien/components/add.discipline.type.component.dart';
import 'package:quanlynhanvien/constants/app_colors.dart';
import 'package:quanlynhanvien/models/kyluat.model.dart';
import 'package:quanlynhanvien/models/loaikyluat.model.dart';
import 'package:quanlynhanvien/models/nhanvien.model.dart';
import 'package:quanlynhanvien/providers/kyluat.provider.dart';
import 'package:quanlynhanvien/providers/loaikyluat.provider.dart';
import 'package:quanlynhanvien/providers/nhanvien.provider.dart';

GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class DeciplineTab extends StatelessWidget {
  const DeciplineTab({super.key});

  @override
  Widget build(BuildContext context) {
    final kyLuatProvider = Provider.of<KyLuatProvider>(context);
    final loaiKyLuatProvider = Provider.of<LoaiKyLuatProvider>(context);

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
              const Row(
                children: [
                  Text(
                    'Khen thưởng - Kỷ luật',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'CeraPro'),
                  ),
                  Icon(Icons.keyboard_arrow_right),
                  Text(
                    'Kỷ luật',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'CeraPro'),
                  )
                ],
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
                      'Danh sách kỷ luật',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'CeraPro'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 300,
                          height: 40,
                          child: TextField(
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                            textAlignVertical: TextAlignVertical.bottom,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(20)),
                              prefixIcon: SvgPicture.asset(
                                '/icon_svg/search.svg',
                                fit: BoxFit.scaleDown,
                                colorFilter: const ColorFilter.mode(
                                    Colors.black, BlendMode.srcIn),
                              ),
                              hintText: 'Search',
                              hintStyle: const TextStyle(
                                color: AppColors.greyBombay,
                                fontFamily: 'SF Pro Display',
                              ),
                              filled: true,
                              fillColor: AppColors.greyIron,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return const AddDisciplineComponent();
                                });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.bluedarkColor,
                          ),
                          child: const Text('Thêm kỷ luật',
                              style: TextStyle(
                                  fontFamily: 'CeraPro',
                                  color: AppColors.white)),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    FutureBuilder<List<KyLuat>>(
                        future: kyLuatProvider.getAllKyLuat(),
                        builder: (context, snapshot) {
                          final listKyLuat = snapshot.data;
                          return PaginatedDataTable(
                            source: RowSource(
                                myData: listKyLuat,
                                count: listKyLuat?.length ?? 0,
                                context: context),
                            rowsPerPage: 5,
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
                                    "Mã loại kỷ luật",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14),
                                  ),
                                  onSort: (columnIndex, ascending) {}),
                              DataColumn(
                                  label: const Text(
                                    "Mã Nhân Viên",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14),
                                  ),
                                  onSort: (columnIndex, ascending) {}),
                              const DataColumn(
                                label: Text(
                                  "Tên Nhân Viên",
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
                                    "Loại kỷ luật",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14),
                                  ),
                                ),
                              ),
                              const DataColumn(
                                label: Text(
                                  "Mô tả",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14),
                                ),
                              ),
                              const DataColumn(
                                label: Text(
                                  "Ngày bị kỷ luật",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14),
                                ),
                              ),
                              const DataColumn(
                                label: Text(
                                  "Thao tác",
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
              Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: AppColors.greyShuttle),
                    borderRadius: BorderRadius.circular(15)),
                padding: const EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Danh sách loại kỷ luật',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'CeraPro'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 300,
                          height: 40,
                          child: TextField(
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                            textAlignVertical: TextAlignVertical.bottom,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(20)),
                              prefixIcon: SvgPicture.asset(
                                '/icon_svg/search.svg',
                                fit: BoxFit.scaleDown,
                                colorFilter: const ColorFilter.mode(
                                    Colors.black, BlendMode.srcIn),
                              ),
                              hintText: 'Search',
                              hintStyle: const TextStyle(
                                color: AppColors.greyBombay,
                                fontFamily: 'SF Pro Display',
                              ),
                              filled: true,
                              fillColor: AppColors.greyIron,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return const AddDisciplineTypeComponent();
                                });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.bluedarkColor,
                          ),
                          child: const Text('Thêm loại kỷ luật',
                              style: TextStyle(
                                  fontFamily: 'CeraPro',
                                  color: AppColors.white)),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    FutureBuilder<List<LoaiKyLuat>>(
                        future: loaiKyLuatProvider.getAllLoaiKyLuat(),
                        builder: (context, snapshot) {
                          final listLoaiKyLuat = snapshot.data;
                          return PaginatedDataTable(
                            source: RowSourceLoaiKT(
                                myData: listLoaiKyLuat,
                                count: listLoaiKyLuat?.length ?? 0),
                            rowsPerPage: 5,
                            columnSpacing: 100,
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
                                    "Mã Loại Kỷ Luật",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14),
                                  ),
                                  onSort: (columnIndex, ascending) {}),
                              const DataColumn(
                                label: Text(
                                  "Tên Loại Kỷ Luật",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14),
                                ),
                              ),
                              const DataColumn(
                                label: Text(
                                  "Mô tả",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14),
                                ),
                              ),
                              const DataColumn(
                                label: Text(
                                  "Ngày tạo",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14),
                                ),
                              ),
                              const DataColumn(
                                label: Text(
                                  "Thao tác",
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
  final nhanVienProvider = Provider.of<NhanVienProvider>(context);
  return DataRow(
    cells: [
      DataCell(SizedBox(width: 50, child: Text((index + 1).toString()))),
      DataCell(SizedBox(width: 100, child: Text(data.maKL.toString()))),
      DataCell(Text(data.maNV)),
      DataCell(FutureBuilder<NhanVien>(
          future: nhanVienProvider.getNhanVien(data.maNV),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final nhanVien = snapshot.data;
              return Text(nhanVien!.hoTen);
            }
            return Text('');
          })),
      DataCell(Text(data.maLKL)),
      DataCell(Text(data.moTa.toString())),
      DataCell(Text(DateFormat('MM/dd/yyyy').format(data.ngayKL.toDate()))),
      DataCell(Row(
        children: [
          IconButton(
            icon: const Icon(Icons.mode_edit_outlined),
            onPressed: () {
              showDialog(
                  context: _scaffoldKey.currentContext!,
                  builder: (scaffoldKey) {
                    return const AddBonusTypeComponent();
                  });
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {},
          )
        ],
      )),
    ],
  );
}

class RowSourceLoaiKT extends DataTableSource {
  // ignore: prefer_typing_uninitialized_variables
  final myData;
  // ignore: prefer_typing_uninitialized_variables
  final count;
  RowSourceLoaiKT({
    required this.myData,
    required this.count,
  });

  @override
  DataRow? getRow(int index) {
    if (index < rowCount) {
      return recentFileDataRowKhenThuong(myData![index], index);
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

DataRow recentFileDataRowKhenThuong(var data, int index) {
  final loaiKyLuat = data as LoaiKyLuat;
  return DataRow(
    cells: [
      DataCell(Text((index + 1).toString())),
      DataCell(Text(data.maLKL.toString())),
      DataCell(Text(data.tenLKL.toString())),
      DataCell(Text(data.moTa.toString())),
      DataCell(Text(DateFormat('MM/dd/yyyy').format(data.ngayTao.toDate()))),
      DataCell(Row(
        children: [
          IconButton(
            icon: const Icon(Icons.mode_edit_outlined),
            onPressed: () {
              showDialog(
                  context: _scaffoldKey.currentContext!,
                  builder: (scaffoldKey) {
                    return const AddBonusTypeComponent();
                  });
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {},
          )
        ],
      )),
    ],
  );
}
