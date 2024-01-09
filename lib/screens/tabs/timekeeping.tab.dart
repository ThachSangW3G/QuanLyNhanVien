import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:quanlynhanvien/components/input.select.component.dart';
import 'package:quanlynhanvien/components/input.time.component.dart';
import 'package:quanlynhanvien/constants/app_colors.dart';
import 'package:quanlynhanvien/models/chamcong.model.dart';
import 'package:quanlynhanvien/services/getlastthreechar.dart';

GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class TimeKeeping extends StatefulWidget {
  const TimeKeeping({super.key});

  @override
  State<TimeKeeping> createState() => _TimeKeepingState();
}

class _TimeKeepingState extends State<TimeKeeping> {
  String? time = DateFormat('dd/MM/yyyy').format(DateTime.now());
  String? timeStaff;
  String? maNV;
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
                'Quản lý lịch chấm công',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
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
                    Row(
                      children: [
                        const Text(
                          'Danh sách chấm công theo ngày ',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          time!,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        InputTimePicker(
                            label: 'Ngày',
                            name: time,
                            hinttext: 'DD/MM/YYYY',
                            onChanged: (value) {
                              setState(() {
                                time = DateFormat('dd/MM/yyyy').format(value);
                              });
                            }),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    PaginatedDataTable(
                      source: RowSource(
                          myData: listChamCong, count: listChamCong.length),
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
                        DataColumn(
                            label: const Text(
                              "Tên nhân viên",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 14),
                            ),
                            onSort: (columnIndex, ascending) {}),
                        const DataColumn(
                          label: Text(
                            "Ngày chấm công",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 14),
                          ),
                        ),
                        const DataColumn(
                          label: SizedBox(
                            width: 100,
                            // Kích thước tương đối của cột (30% chiều rộng màn hình)
                            child: Text(
                              "Thời gian vào",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 14),
                            ),
                          ),
                        ),
                        const DataColumn(
                          label: Text(
                            "Thời gian vào thực tế",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 14),
                          ),
                        ),
                        const DataColumn(
                          label: Text(
                            "Thời gian ra",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 14),
                          ),
                        ),
                        const DataColumn(
                          label: Text(
                            "Thời gian ra thực tế",
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
                    Row(
                      children: [
                        const Text(
                          'Danh sách chấm công theo tháng của nhân viên ',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          maNV ?? '',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        InputSelect(
                            list: list,
                            selectedOption: '',
                            onChanged: (value) {
                              setState(() {
                                maNV = value;
                              });
                            },
                            label: 'Mã nhân viên',
                            hinttext: ''),
                        const SizedBox(
                          width: 20,
                        ),
                        InputTimePicker(
                            label: 'Tháng',
                            name: timeStaff,
                            hinttext: 'DD/MM/YYYY',
                            onChanged: (value) {
                              setState(() {
                                timeStaff = DateFormat('MM/yyyy').format(value);
                              });
                            }),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    PaginatedDataTable(
                      source: RowSourceMonth(
                          myData: listChamCong, count: listChamCong.length),
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
                        const DataColumn(
                          label: Text(
                            "Ngày chấm công",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 14),
                          ),
                        ),
                        const DataColumn(
                          label: SizedBox(
                            width: 100,
                            // Kích thước tương đối của cột (30% chiều rộng màn hình)
                            child: Text(
                              "Thời gian vào",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 14),
                            ),
                          ),
                        ),
                        const DataColumn(
                          label: Text(
                            "Thời gian vào thực tế",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 14),
                          ),
                        ),
                        const DataColumn(
                          label: Text(
                            "Thời gian ra",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 14),
                          ),
                        ),
                        const DataColumn(
                          label: Text(
                            "Thời gian ra thực tế",
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
  final chamCong = data as ChamCong;
  return DataRow(
    cells: [
      DataCell(Text((listChamCong.indexOf(data) + 1).toString())),
      DataCell(Text(DateFormat('MM/dd/yyyy').format(data.ngayCC.toDate()))),
      DataCell(Text(data.maNV.toString())),
      const DataCell(Text('Nguyen Trung Tinh')),
      DataCell(Text(changeTimestampToTime(chamCong.timeVao))),
      DataCell(Text(changeTimestampToTime(chamCong.timeVaoTT))),
      DataCell(Text(changeTimestampToTime(chamCong.timeRa))),
      DataCell(Text(changeTimestampToTime(chamCong.timeRaTT))),
      DataCell(Text(data.status))
    ],
  );
}

List<String> list = ['NV001', 'NV002'];

class RowSourceMonth extends DataTableSource {
  // ignore: prefer_typing_uninitialized_variables
  final myData;
  // ignore: prefer_typing_uninitialized_variables
  final count;
  RowSourceMonth({
    required this.myData,
    required this.count,
  });

  @override
  DataRow? getRow(int index) {
    if (index < rowCount) {
      return recentFileDataRowMonth(myData![index]);
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

DataRow recentFileDataRowMonth(var data) {
  final chamCong = data as ChamCong;
  return DataRow(
    cells: [
      DataCell(Text((listChamCong.indexOf(data) + 1).toString())),
      DataCell(Text(DateFormat('MM/dd/yyyy').format(data.ngayCC.toDate()))),
      DataCell(Text(changeTimestampToTime(chamCong.timeVao))),
      DataCell(Text(changeTimestampToTime(chamCong.timeVaoTT))),
      DataCell(Text(changeTimestampToTime(chamCong.timeRa))),
      DataCell(Text(changeTimestampToTime(chamCong.timeRaTT))),
      DataCell(Text(data.status))
    ],
  );
}
