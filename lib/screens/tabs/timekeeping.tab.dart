import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:quanlynhanvien/components/input.moth.component.dart';
import 'package:quanlynhanvien/components/input.select.component.dart';
import 'package:quanlynhanvien/components/input.time.component.dart';
import 'package:quanlynhanvien/constants/app_colors.dart';
import 'package:quanlynhanvien/models/chamcong.model.dart';
import 'package:quanlynhanvien/models/nhanvien.model.dart';
import 'package:quanlynhanvien/providers/chamcong.provider.dart';
import 'package:quanlynhanvien/providers/nhanvien.provider.dart';
import 'package:quanlynhanvien/services/getlastthreechar.dart';

GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class TimeKeeping extends StatefulWidget {
  const TimeKeeping({super.key});

  @override
  State<TimeKeeping> createState() => _TimeKeepingState();
}

class _TimeKeepingState extends State<TimeKeeping> {
  DateTime? time = DateTime.now();

  DateTime? timeForMonth = DateTime.now();
  String? maNV;
  @override
  Widget build(BuildContext context) {
    final chamCongProvider = Provider.of<ChamCongProvider>(context);
    final nhanVienProvider = Provider.of<NhanVienProvider>(context);
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
                          DateFormat('MM/dd/yyyy').format(time!),
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
                            name: DateFormat('MM/dd/yyyy').format(time!),
                            hinttext: 'DD/MM/YYYY',
                            onChanged: (value) {
                              setState(() {
                                time = value;
                              });
                            }),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    StreamBuilder<List<ChamCong>>(
                        stream: chamCongProvider.getChamCongByDate(time!),
                        builder: (context, snapshot) {
                          final listChamCong = snapshot.data;
                          return PaginatedDataTable(
                            source: RowSource(
                                myData: listChamCong,
                                count: listChamCong?.length ?? 0,
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
                              DataColumn(
                                  label: const Text(
                                    "Tên nhân viên",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14),
                                  ),
                                  onSort: (columnIndex, ascending) {}),
                              const DataColumn(
                                label: Text(
                                  "Ngày chấm công",
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
                                    "Thời gian vào",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14),
                                  ),
                                ),
                              ),
                              const DataColumn(
                                label: Text(
                                  "Thời gian vào thực tế",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14),
                                ),
                              ),
                              const DataColumn(
                                label: Text(
                                  "Thời gian ra",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14),
                                ),
                              ),
                              const DataColumn(
                                label: Text(
                                  "Thời gian ra thực tế",
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
                        FutureBuilder<List<NhanVien>>(
                            future: nhanVienProvider.getAllNhanVien(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                final listNhanVien = snapshot.data;
                                final List<String> listString = [];
                                for (NhanVien nhanVien in listNhanVien!) {
                                  listString.add(
                                      nhanVien.maNV + ' - ' + nhanVien.hoTen);
                                }
                                return InputSelect(
                                    list: listString,
                                    label: 'Nhân Viên',
                                    selectedOption: '',
                                    onChanged: (value) {
                                      final index = listString.indexOf(value);

                                      setState(() {
                                        maNV = listNhanVien[index].maNV;
                                      });
                                    },
                                    hinttext: '--Chọn nhân viên--');
                              } else {
                                return InputSelect(
                                    list: const [],
                                    label: 'Nhân Viên',
                                    selectedOption: '',
                                    onChanged: (value) {},
                                    hinttext: '--Chọn nhân viên--');
                              }
                            }),
                        const SizedBox(
                          width: 20,
                        ),
                        InputMonthPicker(
                            label: 'Tháng',
                            name: DateFormat('MM/yyyy').format(timeForMonth!),
                            hinttext: 'MM/YYYY',
                            onChanged: (value) {
                              setState(() {
                                timeForMonth = value;
                              });
                            }),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    StreamBuilder<List<ChamCong>>(
                        stream: chamCongProvider.getChamCongByMaNVAndMonth(
                            maNV ?? "NV000", timeForMonth!),
                        builder: (context, snapshot) {
                          final listChamCong = snapshot.data;
                          return PaginatedDataTable(
                            source: RowSourceMonth(
                                myData: listChamCong,
                                count: listChamCong?.length ?? 0),
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
                              const DataColumn(
                                label: Text(
                                  "Ngày chấm công",
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
                                    "Thời gian vào",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14),
                                  ),
                                ),
                              ),
                              const DataColumn(
                                label: Text(
                                  "Thời gian vào thực tế",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14),
                                ),
                              ),
                              const DataColumn(
                                label: Text(
                                  "Thời gian ra",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14),
                                ),
                              ),
                              const DataColumn(
                                label: Text(
                                  "Thời gian ra thực tế",
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
                            ],
                          );
                        })
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
  BuildContext context;
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
  final chamCong = data as ChamCong;
  final nhanVienProvider = Provider.of<NhanVienProvider>(context);
  return DataRow(
    cells: [
      DataCell(Text((index + 1).toString())),
      DataCell(Text(data.maNV.toString())),
      DataCell(FutureBuilder<NhanVien>(
          future: nhanVienProvider.getNhanVien(data.maNV),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final nhanVien = snapshot.data;
              return Text(nhanVien!.hoTen);
            }
            return Text('');
          })),
      DataCell(Text(DateFormat('MM/dd/yyyy').format(data.ngayCC.toDate()))),
      DataCell(Text(DateFormat('HH:mm:ss').format(chamCong.timeVao.toDate()))),
      DataCell(
          Text(DateFormat('HH:mm:ss').format(chamCong.timeVaoTT.toDate()))),
      DataCell(Text(DateFormat('HH:mm:ss').format(chamCong.timeRa.toDate()))),
      DataCell(Text(DateFormat('HH:mm:ss').format(chamCong.timeRaTT.toDate()))),
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
      return recentFileDataRowMonth(myData![index], index);
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

DataRow recentFileDataRowMonth(var data, int index) {
  final chamCong = data as ChamCong;
  return DataRow(
    cells: [
      DataCell(Text((index + 1).toString())),
      DataCell(Text(DateFormat('MM/dd/yyyy').format(data.ngayCC.toDate()))),
      DataCell(Text(DateFormat('HH:mm:ss').format(chamCong.timeVao.toDate()))),
      DataCell(Text(changeTimestampToTime(chamCong.timeVaoTT))),
      DataCell(Text(changeTimestampToTime(chamCong.timeRa))),
      DataCell(Text(changeTimestampToTime(chamCong.timeRaTT))),
      DataCell(Text(data.status))
    ],
  );
}
