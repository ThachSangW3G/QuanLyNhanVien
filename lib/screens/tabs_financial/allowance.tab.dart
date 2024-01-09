import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:quanlynhanvien/components/add.allowance.component.dart';
import 'package:quanlynhanvien/components/update.allowance.component.dart';
import 'package:quanlynhanvien/constants/app_colors.dart';
import 'package:quanlynhanvien/models/phucap.model.dart';
import 'package:quanlynhanvien/providers/nhanvien.provider.dart';
import 'package:quanlynhanvien/providers/phucap.provider.dart';

GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class AllowanceTab extends StatefulWidget {
  const AllowanceTab({super.key});

  @override
  State<AllowanceTab> createState() => _AllowanceTabState();
}

class _AllowanceTabState extends State<AllowanceTab> {
  @override
  Widget build(BuildContext context) {
    final phuCapProvider = Provider.of<PhuCapProvider>(context);

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
                    'Quản lý phụ cấp',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'CeraPro'),
                  ),
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
                      'Danh sách phụ cấp',
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
                                  return const AddAllowanceComponent();
                                });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.bluedarkColor,
                          ),
                          child: const Text('Thêm phụ cấp',
                              style: TextStyle(
                                  fontFamily: 'CeraPro',
                                  color: AppColors.white)),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    FutureBuilder<List<PhuCap>>(
                        future: phuCapProvider.getAllPhuCap(),
                        builder: (context, snapshot) {
                          final listPhuCap = snapshot.data;
                          return PaginatedDataTable(
                            source: RowSource(
                                myData: listPhuCap,
                                count: listPhuCap?.length ?? 0,
                                context: context),
                            rowsPerPage: 5,
                            columnSpacing: 80,
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
                              DataColumn(
                                  label: const Text(
                                    "Số tiền phụ cấp",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14),
                                  ),
                                  onSort: (columnIndex, ascending) {}),
                              const DataColumn(
                                label: SizedBox(
                                  width: 100,
                                  // Kích thước tương đối của cột (30% chiều rộng màn hình)
                                  child: Text(
                                    "Ngày phụ cấp",
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
  return DataRow(
    cells: [
      DataCell(Text((index + 1).toString())),
      DataCell(Text(data.maNV.toString())),
      const DataCell(Text('Nguyễn Trung Tính')),
      DataCell(Text(data.soTien.toString())),
      DataCell(Text(DateFormat('dd/MM/yyyy').format(data.ngayPC.toDate()))),
      const DataCell(Text('Mô tả')),
    ],
  );
}
