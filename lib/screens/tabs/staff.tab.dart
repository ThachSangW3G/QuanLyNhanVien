import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:quanlynhanvien/constants/app_colors.dart';
import 'package:quanlynhanvien/models/nhanvien.model.dart';
import 'package:quanlynhanvien/providers/nhanvien.provider.dart';

class StaffTab extends StatelessWidget {
  const StaffTab({super.key});

  @override
  Widget build(BuildContext context) {
    final nhanVienProvider = Provider.of<NhanVienProvider>(context);
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: 10.0,
              ),
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
                      color: Colors.black,
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
              InkWell(
                onTap: () {
                  // showDialog(
                  //     context: context,
                  //     builder: (context) {
                  //       return const AddDepartmentComponent();
                  //     });
                },
                child: Container(
                  width: 100,
                  height: 40,
                  decoration: BoxDecoration(
                      color: AppColors.bluePrussian,
                      borderRadius: BorderRadius.circular(15)),
                  alignment: Alignment.center,
                  child: const Text(
                    'Thêm',
                    style: TextStyle(
                        fontFamily: 'CeraPro',
                        fontSize: 16,
                        color: Colors.white),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: FutureBuilder<List<NhanVien>>(
                future: nhanVienProvider.getAllNhanVien(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final listNhanVien = snapshot.data;

                    return PaginatedDataTable(
                      source: RowSource(
                          myData: listNhanVien, count: listNhanVien!.length),
                      rowsPerPage: 10,
                      columnSpacing: 70,
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
                              "Mã Nhân viên",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 14),
                            ),
                            onSort: (columnIndex, ascending) {}),
                        const DataColumn(
                          label: Text(
                            "Tên Nhân viên",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 14),
                          ),
                        ),
                        const DataColumn(
                          label: Text(
                            "Giới tính",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 14),
                          ),
                        ),
                        const DataColumn(
                          label: Text(
                            "Ngày sinh",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 14),
                          ),
                        ),
                        const DataColumn(
                          label: Text(
                            "Nơi sinh",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 14),
                          ),
                        ),
                        const DataColumn(
                          label: Text(
                            "CCCD/CMND",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 14),
                          ),
                        ),
                        const DataColumn(
                          label: Text(
                            "Sửa",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 14),
                          ),
                        ),
                        const DataColumn(
                          label: Text(
                            "Xóa",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 14),
                          ),
                        ),
                      ],
                    );
                  } else {
                    return const CircularProgressIndicator();
                  }
                }),
          ),
        ],
      ),
    ));
  }
}

class RowSource extends DataTableSource {
  var myData;
  final count;
  RowSource({
    required this.myData,
    required this.count,
  });

  @override
  DataRow? getRow(int index) {
    if (index < rowCount) {
      return recentFileDataRow(myData![index], index);
    } else
      return null;
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => count;

  @override
  int get selectedRowCount => 0;
}

DataRow recentFileDataRow(var data, int index) {
  DateTime dateTime = (data.ngaySinh as Timestamp).toDate();
  final nhanVien = data as NhanVien;
  return DataRow(
    cells: [
      DataCell(Text((index + 1).toString())),
      DataCell(Text(nhanVien.maNV.toString())),
      DataCell(Text(nhanVien.hoTen.toString())),
      DataCell(Text(nhanVien.gioiTinh)),
      DataCell(Text(DateFormat('MM/dd/yyyy').format(dateTime))),
      DataCell(Text(nhanVien.noiSinh)),
      DataCell(Text(nhanVien.cCCD)),
      DataCell(IconButton(
        icon: const Icon(Icons.edit),
        onPressed: () {},
      )),
      DataCell(IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () {},
      ))
    ],
  );
}
