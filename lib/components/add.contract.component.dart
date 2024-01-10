import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quanlynhanvien/components/failed_snackbar.dart';
import 'package:quanlynhanvien/components/input.select.component.dart';
import 'package:quanlynhanvien/components/input.text.component.dart';
import 'package:quanlynhanvien/components/input.time.component.dart';
import 'package:quanlynhanvien/components/success_snackbar.dart';
import 'package:quanlynhanvien/constants/app_colors.dart';
import 'package:quanlynhanvien/models/hopdonglaodong.model.dart';
import 'package:quanlynhanvien/models/nhanvien.model.dart';
import 'package:quanlynhanvien/providers/hopdonglaodong.provider.dart';
import 'package:quanlynhanvien/providers/nhanvien.provider.dart';
import 'package:quanlynhanvien/services/getlastthreechar.dart';

class AddConTractComponent extends StatefulWidget {
  const AddConTractComponent({super.key});

  @override
  State<AddConTractComponent> createState() => _AddConTractComponentState();
}

class _AddConTractComponentState extends State<AddConTractComponent> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    String? maNV;
    DateTime? ngayBatDau;
    DateTime? ngayKetThuc;
    int? luongCoBan;
    double? heSoLuong;
    final hopDongLaoDongProvider = Provider.of<HopDongLaoDongProvider>(context);
    final nhanVienProvider = Provider.of<NhanVienProvider>(context);
    return AlertDialog(
      title: const Text(
        'Thêm hợp đồng lao động',
        style: TextStyle(
          fontFamily: 'CeraPro',
        ),
      ),
      content: Column(
        children: [
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
          Container(
            width: 900,
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: AppColors.greyShuttle),
                borderRadius: BorderRadius.circular(15)),
            padding: const EdgeInsets.all(30),
            child: Column(children: [
              Row(
                children: [
                  FutureBuilder<List<NhanVien>>(
                      future: nhanVienProvider.getAllNhanVien(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          final listNhanVien = snapshot.data;
                          final List<String> listString = [];
                          for (NhanVien nhanVien in listNhanVien!) {
                            listString
                                .add(nhanVien.maNV + ' - ' + nhanVien.hoTen);
                          }
                          return InputSelect(
                              list: listString,
                              label: 'Nhân Viên',
                              selectedOption: '',
                              onChanged: (value) {
                                final index = listString.indexOf(value);
                                maNV = listNhanVien[index].maNV;
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
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InputTimePicker(
                      label: 'Ngày bắt đầu',
                      name: '',
                      hinttext: 'DD/MM/YYYY',
                      onChanged: (value) {
                        ngayBatDau = value;
                      }),
                  const SizedBox(
                    width: 45,
                  ),
                  InputTimePicker(
                      label: 'Ngày kết thúc',
                      name: '',
                      hinttext: 'DD/MM/YYYY',
                      onChanged: (value) {
                        ngayKetThuc = value;
                      }),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  InputTextField(
                      label: 'Lương cơ bản',
                      name: '',
                      isRequired: true,
                      hinttext: '',
                      onChanged: (valua) {
                        luongCoBan = int.tryParse(valua);
                      }),
                  const SizedBox(
                    width: 45,
                  ),
                  InputTextField(
                      label: 'Hệ số lương',
                      name: '',
                      isRequired: true,
                      hinttext: '',
                      onChanged: (valua) {
                        heSoLuong = double.tryParse(valua);
                      }),
                ],
              )
            ]),
          ),
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.bluedarkColor,
          ),
          child: const Text('Hủy',
              style: TextStyle(fontFamily: 'CeraPro', color: AppColors.white)),
        ),
        ElevatedButton(
          onPressed: () async {
            try {
              setState(() {
                loading = true;
              });
              HopDongLaoDong? lastHDLD =
                  await hopDongLaoDongProvider.getLastHopDongLaoDong();

              int soThuTu = lastHDLD != null
                  ? getLastThreeCharsAsInteger(lastHDLD.maHD) + 1
                  : 0;

              String maHD = 'HDLD' + soThuTu.toString().padLeft(3, '0');

              final hopDongLaoDong = HopDongLaoDong(
                  maHD: maHD,
                  maNV: maNV!,
                  ngayBatDau: Timestamp.fromDate(ngayBatDau!),
                  ngayKetThuc: Timestamp.fromDate(ngayKetThuc!),
                  luongCoBan: luongCoBan!,
                  heSoLuong: heSoLuong!);

              await hopDongLaoDongProvider.addHopDongLaoDong(hopDongLaoDong);

              // final phieuLuong = await phieuLuongProvider
              //     .getPhieuLuong('PL${ngayPC!.month}-${ngayPC!.year}-${maNV}');

              // phieuLuong.phuCap += soTien!;

              // await phieuLuongProvider.updPhieuLuong(phieuLuong);

              ScaffoldMessenger.of(context).showSnackBar(
                  buildSuccessSnackbar('Thêm hợp đồng thành công!'));
            } catch (e) {
              print(e);
              ScaffoldMessenger.of(context)
                  .showSnackBar(buildFailedSnackbar('Thêm hợp đồng thất bại!'));
            }
            setState(() {
              loading = false;
            });
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.bluedarkColor,
          ),
          child: loading
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
              : const Text('Lưu',
                  style:
                      TextStyle(fontFamily: 'CeraPro', color: AppColors.white)),
        ),
      ],
    );
  }
}

List<String> list = ['NV001', 'NV0002'];
