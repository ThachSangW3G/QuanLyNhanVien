import 'package:flutter/material.dart';
import 'package:quanlynhanvien/models/nhanvien.model.dart';
import 'package:quanlynhanvien/widgets/scrollable.widget.dart';

class TableStaff extends StatefulWidget {
  const TableStaff({super.key});

  @override
  State<TableStaff> createState() => _TableStaffState();
}

class _TableStaffState extends State<TableStaff> {
  int? sortColumnIndex;
  bool isAscending = false;
  @override
  Widget build(BuildContext context) {
    return ScrollableWidget(child: buildDataTable());
  }

  Widget buildDataTable() {
    final columns = [
      'STT',
      'Mã nhân viên',
      'Họ tên',
      'Giới tính',
      'Ngày sinh',
      'Nơi sinh',
      'CCCD/CMND',
      'Ghi chú'
    ];

    return DataTable(
        sortAscending: isAscending,
        sortColumnIndex: sortColumnIndex,
        columns: getColumns(columns),
        rows: getRows(listNhanVien),
        dataRowColor: MaterialStateColor.resolveWith(
            (states) => const Color.fromARGB(255, 247, 243, 243)),
        headingRowColor: MaterialStateColor.resolveWith(
            (states) => const Color.fromARGB(255, 212, 209, 209)));
  }

  List<DataColumn> getColumns(List<String> columns) => columns
      .map((String column) => DataColumn(
            label: Text(
              column,
              style: const TextStyle(fontSize: 18.0),
            ),
            onSort: onSort,
          ))
      .toList();

  List<DataRow> getRows(List<NhanVien> users) => users.map((NhanVien nhanvien) {
        final cells = [
          '${listNhanVien.indexOf(nhanvien) + 1}',
          nhanvien.maNV,
          nhanvien.hoTen,
          nhanvien.gioiTinh,
          nhanvien.ngaySinh,
          nhanvien.noiSinh,
          nhanvien.cCCD,
        ];

        return DataRow(cells: getCells(cells));
      }).toList();

  List<DataCell> getCells(List<dynamic> cells) =>
      cells.map((data) => DataCell(Text('$data'))).toList();

  void onSort(int columnIndex, bool ascending) {
    if (columnIndex == 1) {
      listNhanVien.sort((nhanVien1, nhanVien2) =>
          compareString(ascending, nhanVien1.maNV, nhanVien2.maNV));
    } else if (columnIndex == 2) {
      listNhanVien.sort(
          (user1, user2) => compareString(ascending, user1.hoTen, user2.hoTen));
    }
    setState(() {
      sortColumnIndex = columnIndex;
      isAscending = ascending;
    });
  }

  int compareString(bool ascending, String value1, String value2) =>
      ascending ? value1.compareTo(value2) : value2.compareTo(value1);
}
