import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:quanlynhanvien/components/add.department.component.dart';
import 'package:quanlynhanvien/components/tablestaff.component.dart';
import 'package:quanlynhanvien/constants/app_colors.dart';
import 'package:quanlynhanvien/models/phongban.model.dart';

class DepartmentTab extends StatelessWidget {
  const DepartmentTab({super.key});

  @override
  Widget build(BuildContext context) {
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
                      colorFilter:
                          const ColorFilter.mode(Colors.black, BlendMode.srcIn),
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
                  showDialog(
                      context: context,
                      builder: (context) {
                        return const AddDepartmentComponent();
                      });
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
            child: PaginatedDataTable(
              source: RowSource(myData: listPB, count: listPB.length),
              rowsPerPage: 10,
              columnSpacing: 120,
              columns: [
                DataColumn(
                    label: const Text(
                      "STT",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                    ),
                    onSort: (columnIndex, ascending) {}),
                DataColumn(
                    label: const Text(
                      "Mã Phòng ban",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                    ),
                    onSort: (columnIndex, ascending) {}),
                const DataColumn(
                  label: Text(
                    "Tên phòng ban",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                  ),
                ),
                const DataColumn(
                  label: Text(
                    "Ngày thành lập",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                  ),
                ),
                const DataColumn(
                  label: Text(
                    "Sửa",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                  ),
                ),
                const DataColumn(
                  label: Text(
                    "Xóa",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                  ),
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
  var myData;
  final count;
  RowSource({
    required this.myData,
    required this.count,
  });

  @override
  DataRow? getRow(int index) {
    if (index < rowCount) {
      return recentFileDataRow(myData![index]);
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

DataRow recentFileDataRow(var data) {
  DateTime dateTime = (data.ngayThanhLap as Timestamp).toDate();
  final phongBan = data as PhongBan;
  return DataRow(
    cells: [
      DataCell(Text((listPB.indexOf(phongBan) + 1).toString())),
      DataCell(Text(data.maPB.toString())),
      DataCell(Text(data.tenPB.toString())),
      DataCell(Text(DateFormat('MM/dd/yyyy').format(dateTime))),
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
