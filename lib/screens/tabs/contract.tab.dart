import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:quanlynhanvien/components/add.contract.component.dart';
import 'package:quanlynhanvien/components/update.contract.component.dart';
import 'package:quanlynhanvien/constants/app_colors.dart';
import 'package:quanlynhanvien/models/hopdonglaodong.model.dart';
import 'package:quanlynhanvien/models/nhanvien.model.dart';
import 'package:quanlynhanvien/providers/hopdonglaodong.provider.dart';
import 'package:quanlynhanvien/providers/nhanvien.provider.dart';

GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class ConstactTab extends StatelessWidget {
  const ConstactTab({super.key});

  @override
  Widget build(BuildContext context) {
    final hopDongLaoDongProvider = Provider.of<HopDongLaoDongProvider>(context);
    return Scaffold(
        key: _scaffoldKey,
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
                  InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (builder) {
                            return const AddConTractComponent();
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
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: FutureBuilder<List<HopDongLaoDong>>(
                    future: hopDongLaoDongProvider.getAllHopDongLaoDong(),
                    builder: (context, snapshot) {
                      final listHDLD = snapshot.data;
                      return PaginatedDataTable(
                        source: RowSource(
                            myData: listHDLD,
                            count: listHDLD?.length ?? 0,
                            context: context),
                        rowsPerPage: 10,
                        columnSpacing: 90,
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
                                "Mã HĐLĐ",
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
                          DataColumn(
                              label: const Text(
                                "Tên Nhân viên",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 14),
                              ),
                              onSort: (columnIndex, ascending) {}),
                          const DataColumn(
                            label: Text(
                              "Ngày bắt đầu",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 14),
                            ),
                          ),
                          const DataColumn(
                            label: Text(
                              "Ngày kết thúc",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 14),
                            ),
                          ),
                          const DataColumn(
                            label: Text(
                              "Lương cơ bản",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 14),
                            ),
                          ),
                          const DataColumn(
                            label: Text(
                              "Hệ số lương",
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
                      );
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
  final BuildContext context;
  RowSource({required this.myData, required this.count, required this.context});

  @override
  DataRow? getRow(int index) {
    if (index < rowCount) {
      return recentFileDataRow(myData![index], index, context);
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

DataRow recentFileDataRow(var data, int index, BuildContext context) {
  DateTime dtBatDau = (data.ngayBatDau as Timestamp).toDate();
  DateTime dtKetThuc = (data.ngayKetThuc as Timestamp).toDate();
  final nhanVienProvider = Provider.of<NhanVienProvider>(context);
  final hdld = data as HopDongLaoDong;
  return DataRow(
    cells: [
      DataCell(Text((index + 1).toString())),
      DataCell(Text(data.maHD.toString())),
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
      DataCell(Text(DateFormat('MM/dd/yyyy').format(dtBatDau))),
      DataCell(Text(DateFormat('MM/dd/yyyy').format(dtKetThuc))),
      DataCell(Text(data.luongCoBan.toString())),
      DataCell(Text(data.heSoLuong.toString())),
      DataCell(ElevatedButton(
        onPressed: () {
          showDialog(
              context: _scaffoldKey.currentContext!,
              builder: (builder) {
                return UpdateConTractComponent(
                  maNV: data.maNV,
                );
              });
        },
        style:
            ElevatedButton.styleFrom(backgroundColor: AppColors.bluedarkColor),
        child: const Text(
          'Gia hạn',
          style: TextStyle(color: Colors.white),
        ),
      ))
    ],
  );
}
