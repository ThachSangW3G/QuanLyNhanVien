import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:quanlynhanvien/components/add.bonus.component.dart';
import 'package:quanlynhanvien/components/add.bonus.style.component.dart';
import 'package:quanlynhanvien/constants/app_colors.dart';
import 'package:quanlynhanvien/models/chucvu.model.dart';
import 'package:quanlynhanvien/models/khenthuong.model.dart';
import 'package:quanlynhanvien/models/loaikhenthuong.model.dart';

GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class BonusTab extends StatelessWidget {
  const BonusTab({super.key});

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
                    'Khen thưởng',
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
              const Row(
                children: [
                  Text(
                    'Những ô có đánh dấu',
                    style: TextStyle(fontSize: 10),
                  ),
                  Text(
                    ' * ',
                    style: TextStyle(color: Colors.red),
                  ),
                  Text(
                    'là bắt buộc',
                    style: TextStyle(fontSize: 10),
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
                      'Danh sách khen thưởng',
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
                                  return const AddBonusComponent();
                                });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.bluedarkColor,
                          ),
                          child: const Text('Thêm khen thưởng',
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
                          myData: listKhenThuong, count: listKhenThuong.length),
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
                              "Loại khen thưởng",
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
                            "Ngày khen thưởng",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 14),
                          ),
                        ),
                        const DataColumn(
                          label: Text(
                            "Số tiền khen thưởng",
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
                      'Danh sách loại khen thưởng',
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
                                  return const AddBonusTypeComponent();
                                });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.bluedarkColor,
                          ),
                          child: const Text('Thêm loại khen thưởng',
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
                          myData: listLoaiKT, count: listLoaiKT.length),
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
                              "Mã Loại Khen Thưởng",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 14),
                            ),
                            onSort: (columnIndex, ascending) {}),
                        const DataColumn(
                          label: Text(
                            "Tên Loại Khen Thưởng",
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
  final khenThuong = data as KhenThuong;
  return DataRow(
    cells: [
      DataCell(SizedBox(
          width: 50,
          child: Text((listKhenThuong.indexOf(khenThuong) + 1).toString()))),
      DataCell(SizedBox(width: 100, child: Text(data.maNV.toString()))),
      DataCell(Text(data.tenNV.toString())),
      DataCell(Text(data.maLKT.toString())),
      DataCell(Text(data.moTa.toString())),
      DataCell(Text(DateFormat('MM/dd/yyyy').format(data.ngayKT.toDate()))),
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
  final loaikhenThuong = data as LoaiKhenThuong;
  return DataRow(
    cells: [
      DataCell(Text((listLoaiKT.indexOf(loaikhenThuong) + 1).toString())),
      DataCell(Text(data.maLKT.toString())),
      DataCell(Text(data.tenLKT.toString())),
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
