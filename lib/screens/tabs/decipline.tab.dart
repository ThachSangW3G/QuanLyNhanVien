import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:quanlynhanvien/components/add.bonus.style.component.dart';
import 'package:quanlynhanvien/components/add.discipline.component.dart';
import 'package:quanlynhanvien/components/add.discipline.type.component.dart';
import 'package:quanlynhanvien/constants/app_colors.dart';
import 'package:quanlynhanvien/models/kyluat.model.dart';
import 'package:quanlynhanvien/models/loaikyluat.model.dart';

GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class DeciplineTab extends StatelessWidget {
  const DeciplineTab({super.key});

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
                    PaginatedDataTable(
                      source: RowSource(
                          myData: danhSachKyLuat, count: danhSachKyLuat.length),
                      rowsPerPage: 10,
                      columnSpacing: 150,
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
                              "Mã Nhân Viên",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 14),
                            ),
                            onSort: (columnIndex, ascending) {}),
                        const DataColumn(
                          label: Text(
                            "Tên Nhân Viên",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 14),
                          ),
                        ),
                        const DataColumn(
                          label: SizedBox(
                            width: 100,
                            // Kích thước tương đối của cột (30% chiều rộng màn hình)
                            child: Text(
                              "Loại kỷ luật",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 14),
                            ),
                          ),
                        ),
                        const DataColumn(
                          label: Text(
                            "Mô tả",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 14),
                          ),
                        ),
                        const DataColumn(
                          label: Text(
                            "Ngày bị kỷ luạt",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 14),
                          ),
                        ),
                        const DataColumn(
                          label: Text(
                            "Số tiền",
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
                    PaginatedDataTable(
                      source: RowSourceLoaiKT(
                          myData: danhSachLoaiKyLuat,
                          count: danhSachLoaiKyLuat.length),
                      rowsPerPage: 10,
                      columnSpacing: 150,
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
                              "Mã Loại Kỷ Luật",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 14),
                            ),
                            onSort: (columnIndex, ascending) {}),
                        const DataColumn(
                          label: Text(
                            "Tên Loại Kỷ Luật",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 14),
                          ),
                        ),
                        const DataColumn(
                          label: Text(
                            "Mô tả",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 14),
                          ),
                        ),
                        const DataColumn(
                          label: Text(
                            "Ngày tạo",
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
  final khenThuong = data as KyLuat;
  return DataRow(
    cells: [
      DataCell(SizedBox(
          width: 50,
          child: Text((danhSachKyLuat.indexOf(khenThuong) + 1).toString()))),
      DataCell(SizedBox(width: 100, child: Text(data.maNV.toString()))),
      const DataCell(Text('ahihi')),
      DataCell(Text(data.maLKL)),
      DataCell(Text(data.moTa.toString())),
      DataCell(Text(DateFormat('MM/dd/yyyy').format(data.ngayKL.toDate()))),
      const DataCell(Text('100000')),
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
      return recentFileDataRowKhenThuong(myData![index]);
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

DataRow recentFileDataRowKhenThuong(var data) {
  final loaiKyLuat = data as LoaiKyLuat;
  return DataRow(
    cells: [
      DataCell(Text((danhSachLoaiKyLuat.indexOf(loaiKyLuat) + 1).toString())),
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
