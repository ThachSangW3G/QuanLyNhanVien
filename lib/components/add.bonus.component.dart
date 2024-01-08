import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quanlynhanvien/components/failed_snackbar.dart';
import 'package:quanlynhanvien/components/input.select.component.dart';
import 'package:quanlynhanvien/components/success_snackbar.dart';
import 'package:quanlynhanvien/constants/app_colors.dart';
import 'package:quanlynhanvien/models/khenthuong.model.dart';
import 'package:quanlynhanvien/models/loaikhenthuong.model.dart';
import 'package:quanlynhanvien/models/nhanvien.model.dart';
import 'package:quanlynhanvien/providers/khenthuong.provider.dart';
import 'package:quanlynhanvien/providers/loaikhenthuong.provider.dart';
import 'package:quanlynhanvien/providers/nhanvien.provider.dart';
import 'package:quanlynhanvien/services/getlastthreechar.dart';

import 'input.text.multiline.component.dart';
import 'input.time.component.dart';

class AddBonusComponent extends StatefulWidget {
  const AddBonusComponent({super.key});

  @override
  State<AddBonusComponent> createState() => _AddBonusComponentState();
}

class _AddBonusComponentState extends State<AddBonusComponent> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    String? maNV;
    String? maLKT;
    String? moTa;
    DateTime? ngayKT;

    final khenThuongProvider = Provider.of<KhenThuongProvider>(context);
    final nhanVienProvider = Provider.of<NhanVienProvider>(context);
    final loaiKhenThuongProvider = Provider.of<LoaiKhenThuongProvider>(context);

    return AlertDialog(
      title: const Text(
        'Thêm khen thưởng',
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
                  const SizedBox(
                    width: 45,
                  ),
                  FutureBuilder<List<LoaiKhenThuong>>(
                      future: loaiKhenThuongProvider.getAllLoaiKhenThuong(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          final listLoaiKhenThuong = snapshot.data;
                          final List<String> listString = [];
                          for (LoaiKhenThuong loaiKhenThuong
                              in listLoaiKhenThuong!) {
                            listString.add(loaiKhenThuong.maLKT +
                                ' - ' +
                                loaiKhenThuong.tenLKT);
                          }
                          return InputSelect(
                              list: listString,
                              label: 'Loại Khen Thưởng',
                              selectedOption: '',
                              onChanged: (value) {
                                final index = listString.indexOf(value);
                                maLKT = listLoaiKhenThuong[index].maLKT;
                              },
                              hinttext: '--Chọn loại khen thưởng--');
                        } else {
                          return InputSelect(
                              list: const [],
                              label: 'Loại Khen Thưởng',
                              selectedOption: '',
                              onChanged: (value) {},
                              hinttext: '--Chọn loại khen thưởng--');
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
                  InputTextMultiline(
                      label: 'Mô tả',
                      name: '',
                      hinttext: '',
                      onChanged: (value) {
                        moTa = value;
                      }),
                  const SizedBox(
                    width: 45,
                  ),
                  InputTimePicker(
                      label: 'Ngày khen thưởng',
                      name: '',
                      hinttext: 'DD/MM/YYYY',
                      onChanged: (value) {
                        ngayKT = value;
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
              KhenThuong? lastiKhenThuong =
                  await khenThuongProvider.getLastKhenThuong();

              int soThuTu = lastiKhenThuong != null
                  ? getLastThreeCharsAsInteger(lastiKhenThuong.maKT) + 1
                  : 0;

              String maKT = 'KT' + soThuTu.toString().padLeft(3, '0');

              final khenThuong = KhenThuong(
                  maKT: maKT,
                  maNV: maNV!,
                  maLKT: maLKT!,
                  moTa: moTa!,
                  ngayKT: Timestamp.fromDate(ngayKT!));

              await khenThuongProvider.addKhenThuong(khenThuong);

              ScaffoldMessenger.of(context).showSnackBar(
                  buildSuccessSnackbar('Thêm khen thưởng thành công!'));
            } catch (e) {
              print(e);
              ScaffoldMessenger.of(context).showSnackBar(
                  buildFailedSnackbar('Thêm khen thưởng thất bại!'));
            }
            setState(() {
              loading = false;
            });
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.bluedarkColor,
          ),
          child: const Text('Lưu',
              style: TextStyle(fontFamily: 'CeraPro', color: AppColors.white)),
        ),
      ],
    );
  }
}

List<String> list = ['NV001  Nguyen Trung Tinh', 'NV002 - Thach A Sang'];
