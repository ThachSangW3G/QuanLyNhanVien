import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:quanlynhanvien/components/content.component.dart';
import 'package:quanlynhanvien/components/failed_snackbar.dart';
import 'package:quanlynhanvien/components/input.moth.component.dart';
import 'package:quanlynhanvien/components/input.select.component.dart';
import 'package:quanlynhanvien/components/success_snackbar.dart';
import 'package:quanlynhanvien/components/update.hesoluong.component.dart';
import 'package:quanlynhanvien/constants/app_colors.dart';
import 'package:quanlynhanvien/models/nhanvien.model.dart';
import 'package:quanlynhanvien/models/phieuluonchinhthuc.model.dart';
import 'package:quanlynhanvien/models/phieuluong.model.dart';
import 'package:quanlynhanvien/models/yeucaunghiphep.model.dart';
import 'package:quanlynhanvien/providers/chucvu.provider.dart';
import 'package:quanlynhanvien/providers/hopdonglaodong.provider.dart';
import 'package:quanlynhanvien/providers/khenthuong.provider.dart';
import 'package:quanlynhanvien/providers/nhanvien.provider.dart';
import 'package:quanlynhanvien/providers/phieuluong.provider.dart';
import 'package:quanlynhanvien/providers/phieuluongchinhthuc.provider.dart';
import 'package:quanlynhanvien/providers/phongban.provider.dart';

GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class ManagerSalaryExportTab extends StatefulWidget {
  const ManagerSalaryExportTab({super.key});

  @override
  State<ManagerSalaryExportTab> createState() => _ManagerWageTabState();
}

class _ManagerWageTabState extends State<ManagerSalaryExportTab> {
  String maNV = 'NV000';
  String? tenNV = '';
  String? tenChucVu = '';
  String? tenPhongBan = '';
  int? luongCoBan = 0;
  double? heSoLuong = 0;
  int? phuCap = 0;
  int? khenThuong = 0;
  int? kyLuat = 0;
  int? thang = 0;
  int? nam = 0;
  int? soNgayCong = 0;
  int? thueThuNhapCN = 0;
  double? luong = 0;
  DateTime dateTime = DateTime.now();

  bool loadingTaoPhieuLuong = false;
  bool loadingTaoXuatLuong = false;

  @override
  Widget build(BuildContext context) {
    final nhanVienProvider = Provider.of<NhanVienProvider>(context);
    final chucVuProvider = Provider.of<ChucVuProvider>(context);
    final phongBanProvider = Provider.of<PhongBanProvider>(context);
    final phieuLuongChinhThucProvider =
        Provider.of<PhieuLuongChinhThucProvider>(context);
    final phieuLuongProvider = Provider.of<PhieuLuongProvider>(context);
    final hopDongLaoDongProvider = Provider.of<HopDongLaoDongProvider>(context);
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
              ElevatedButton(
                onPressed: () async {
                  try {
                    List<NhanVien> listNhanVien =
                        await nhanVienProvider.getAllNhanVien();

                    listNhanVien.forEach((nhanVien) async {
                      try {
                        final currentTime = DateTime.now();

                        setState(() {
                          loadingTaoPhieuLuong = true;
                        });
                        final checkExist =
                            await phieuLuongProvider.getExistPhieuLuong(
                                nhanVien.maNV,
                                currentTime.month,
                                currentTime.year);

                        final hopDongLaoDong = await hopDongLaoDongProvider
                            .getHopDongLaoDongByMaNV(nhanVien.maNV);

                        if (!checkExist) {
                          final phieuLuong = PhieuLuong(
                              maPL:
                                  'PL${currentTime.month}-${currentTime.year}-${nhanVien.maNV}',
                              maNV: nhanVien.maNV,
                              luongCoBan: hopDongLaoDong.luongCoBan,
                              heSoLuong: hopDongLaoDong.heSoLuong,
                              phuCap: 0,
                              khenThuong: 0,
                              kyLuat: 0,
                              thang: currentTime.month,
                              nam: currentTime.year,
                              soNgayCong: 0,
                              luong: 0);

                          await phieuLuongProvider.addPhieuLuong(phieuLuong);
                          ScaffoldMessenger.of(context).showSnackBar(
                              buildSuccessSnackbar(
                                  'Tạo phiếu lương cho ${nhanVien.maNV} thành công!'));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              buildFailedSnackbar(
                                  'Tạo phiếu lương cho ${nhanVien.maNV} thất bại!'));
                        }
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            buildFailedSnackbar('Tạo phiếu lương thất bại!'));
                        print(e);
                      }
                      setState(() {
                        loadingTaoPhieuLuong = false;
                      });
                    });
                  } catch (e) {}
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.bluedarkColor,
                ),
                child: loadingTaoPhieuLuong
                    ? const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: SizedBox(
                          height: 10,
                          width: 10,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        ),
                      )
                    : const Text('Tạo phiếu lương cho tất cả nhân viên',
                        style: TextStyle(
                            fontFamily: 'CeraPro', color: AppColors.white)),
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
                                      onChanged: (value) async {
                                        final index = listString.indexOf(value);
                                        maNV = listNhanVien[index].maNV;
                                        try {
                                          final phieuLuong =
                                              await phieuLuongProvider
                                                  .getPhieuLuong(
                                                      'PL${dateTime!.month}-${dateTime!.year}-${maNV}');

                                          final chucVu =
                                              await chucVuProvider.getChucVu(
                                                  listNhanVien[index].maCV);
                                          final phongBan =
                                              await phongBanProvider
                                                  .getPhongBan(
                                                      listNhanVien[index].maPB);

                                          setState(() {
                                            tenNV = listNhanVien[index].hoTen;
                                            tenChucVu = chucVu!.tenCV;
                                            tenPhongBan = phongBan.tenPB;
                                            luongCoBan = phieuLuong.luongCoBan;
                                            phuCap = phieuLuong.phuCap;
                                            khenThuong = phieuLuong.khenThuong;
                                            kyLuat = phieuLuong.kyLuat;
                                            thang = phieuLuong.thang;
                                            nam = phieuLuong.nam;
                                            heSoLuong = phieuLuong.heSoLuong;
                                            soNgayCong = phieuLuong.soNgayCong;
                                            thueThuNhapCN = 0;
                                            luong = ((luongCoBan! * heSoLuong! +
                                                            phuCap!) /
                                                        26) *
                                                    soNgayCong! +
                                                khenThuong! -
                                                kyLuat!;
                                          });
                                        } catch (e) {
                                          print(e);
                                        }
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
                            width: 25,
                          ),
                          InputMonthPicker(
                              label: 'Tháng - năm',
                              name: DateFormat('MM/yyyy').format(dateTime!),
                              hinttext: 'MM/YYYY',
                              onChanged: (value) async {
                                setState(() {
                                  dateTime = value;
                                });

                                try {
                                  final listNhanVien =
                                      await nhanVienProvider.getAllNhanVien();
                                  final List<String> listString = [];
                                  for (NhanVien nhanVien in listNhanVien) {
                                    listString.add(nhanVien.maNV);
                                  }
                                  final phieuLuong =
                                      await phieuLuongProvider.getPhieuLuong(
                                          'PL${dateTime!.month}-${dateTime!.year}-${maNV}');

                                  print(dateTime);

                                  final chucVu = await chucVuProvider.getChucVu(
                                      listNhanVien[listString.indexOf(maNV!)]
                                          .maCV);
                                  final phongBan = await phongBanProvider
                                      .getPhongBan(listNhanVien[
                                              listString.indexOf(maNV!)]
                                          .maPB);
                                } catch (e) {
                                  print(e);
                                  setState(() {
                                    tenNV = '';

                                    tenChucVu = '';
                                    tenPhongBan = '';
                                    luongCoBan = 0;
                                    phuCap = 0;
                                    khenThuong = 0;
                                    kyLuat = 0;
                                    thang = 0;
                                    nam = 0;
                                    soNgayCong = 0;
                                    thueThuNhapCN = 0;
                                    luong = 0;
                                  });
                                }
                              })
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: [
                            Container(
                              width: 900,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: AppColors.greyShuttle),
                                  borderRadius: BorderRadius.circular(15)),
                              padding: const EdgeInsets.all(30),
                              child: Column(children: [
                                Row(
                                  children: [
                                    ContentComponent(
                                        title: 'Mã nhân viên: ',
                                        content: maNV ?? ''),
                                    ContentComponent(
                                        title: 'Tên nhân viên: ',
                                        content: tenNV ?? ''),
                                  ],
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                                Row(
                                  children: [
                                    ContentComponent(
                                        title: 'Chức vụ: ',
                                        content: tenChucVu ?? ''),
                                    ContentComponent(
                                        title: 'Phòng ban: ',
                                        content: tenPhongBan ?? ''),
                                  ],
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                                Row(
                                  children: [
                                    ContentComponent(
                                        title: 'Lương cơ bản: ',
                                        content: '${luongCoBan ?? ''} VND'),
                                    ContentComponent(
                                        title: 'Phụ cấp: ',
                                        content: '${phuCap ?? ''} VND'),
                                  ],
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                                Row(
                                  children: [
                                    ContentComponent(
                                        title: 'Khen thưởng: ',
                                        content: '${khenThuong ?? ''} VND'),
                                    ContentComponent(
                                        title: 'Kỷ luật: ',
                                        content: '- ${kyLuat ?? ''} VND'),
                                  ],
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                                Row(
                                  children: [
                                    ContentComponent(
                                        title: 'Tháng: ',
                                        content: thang.toString()),
                                    ContentComponent(
                                        title: 'Năm: ',
                                        content: nam.toString()),
                                  ],
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                                Row(
                                  children: [
                                    ContentComponent(
                                        title: 'Số ngày công: ',
                                        content: soNgayCong.toString()),
                                  ],
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                                Row(
                                  children: [
                                    ContentComponent(
                                        title: 'Thuế thu nhập cá nhân: ',
                                        content: '${thueThuNhapCN ?? ''} VND'),
                                    ContentComponent(
                                        title: 'Lương: ',
                                        content: '${luong ?? ''} VND')
                                  ],
                                ),
                              ]),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 50),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              onPressed: () async {
                                try {
                                  setState(() {
                                    loadingTaoXuatLuong = true;
                                  });
                                  final phieuLuong = PhieuLuongChinhThuc(
                                      maPL:
                                          'PLCT${dateTime.month}-${dateTime.year}-${maNV}',
                                      maNV: maNV,
                                      luongCoBan: luongCoBan!,
                                      heSoLuong: heSoLuong!,
                                      phuCap: phuCap!,
                                      khenThuong: khenThuong!,
                                      kyLuat: kyLuat!,
                                      thang: dateTime.month,
                                      nam: dateTime.year,
                                      soNgayCong: soNgayCong!,
                                      luong: ((luongCoBan! * heSoLuong! +
                                                      phuCap!) /
                                                  26) *
                                              soNgayCong! +
                                          khenThuong! -
                                          kyLuat!);

                                  await phieuLuongChinhThucProvider
                                      .addPhieuLuong(phieuLuong);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      buildSuccessSnackbar(
                                          'Tạo phiếu lương cho ${maNV} thành công!'));
                                } catch (e) {
                                  print(e);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      buildFailedSnackbar(
                                          'Tạo phiếu lương cho ${maNV} thất bại!'));
                                }
                                loadingTaoXuatLuong = false;
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.bluedarkColor,
                              ),
                              child: loadingTaoXuatLuong
                                  ? const Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 8.0),
                                      child: SizedBox(
                                        height: 10,
                                        width: 10,
                                        child: CircularProgressIndicator(
                                          color: Colors.white,
                                        ),
                                      ),
                                    )
                                  : const Text('Xuất lương',
                                      style: TextStyle(
                                          fontFamily: 'CeraPro',
                                          color: AppColors.white)),
                            ),
                          ],
                        ),
                      ),
                    ]),
              )
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
  return DataRow(
    cells: [
      DataCell(Text((listNhanVien.indexOf(data) + 1).toString())),
      DataCell(SizedBox(width: 100, child: Text(data.maNV.toString()))),
      DataCell(Text(data.hoTen.toString())),
      DataCell(Text(data.maPB.toString())),
      DataCell(Text(data.maCV.toString())),
      const DataCell(Text('1000000')),
      const DataCell(Text('12 tháng')),
      const DataCell(Text('1.1')),
      DataCell(IconButton(
        icon: const Icon(Icons.edit),
        onPressed: () {
          showDialog(
              context: _scaffoldKey.currentContext!,
              builder: (builder) {
                return const UpdateLuongComponent();
              });
        },
      ))
    ],
  );
}
