import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:quanlynhanvien/components/failed_snackbar.dart';
import 'package:quanlynhanvien/components/input.select.component.dart';
import 'package:quanlynhanvien/components/input.select.data.dart';
import 'package:quanlynhanvien/components/success_snackbar.dart';
import 'package:quanlynhanvien/constants/app_colors.dart';
import 'package:quanlynhanvien/models/khenthuong.model.dart';
import 'package:quanlynhanvien/models/loaikhenthuong.model.dart';
import 'package:quanlynhanvien/models/nhanvien.model.dart';
import 'package:quanlynhanvien/providers/khenthuong.provider.dart';
import 'package:quanlynhanvien/providers/loaikhenthuong.provider.dart';
import 'package:quanlynhanvien/providers/nhanvien.provider.dart';

import 'input.text.multiline.component.dart';
import 'input.time.component.dart';

class UpdateBonusComponent extends StatefulWidget {
  final KhenThuong khenThuong;
  const UpdateBonusComponent({super.key, required this.khenThuong});

  @override
  State<UpdateBonusComponent> createState() => _AddBonusComponentState();
}

class _AddBonusComponentState extends State<UpdateBonusComponent> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    String maKT = widget.khenThuong.maKT;
    String maLKT = widget.khenThuong.maLKT;
    String maNV = widget.khenThuong.maNV;
    String moTa = widget.khenThuong.moTa;
    int soTienThuong = widget.khenThuong.soTienThuong;
    DateTime ngayKT = widget.khenThuong.ngayKT.toDate();

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
                          final List<String> listMaNV = [];
                          for (NhanVien nhanVien in listNhanVien!) {
                            listString
                                .add(nhanVien.maNV + ' - ' + nhanVien.hoTen);
                            listMaNV.add(nhanVien.maNV);
                          }

                          final indexCurrent = listMaNV.indexOf(maNV);
                          print(listString[indexCurrent]);
                          return InputSelectData(
                              list: listString,
                              label: 'Nhân Viên',
                              selectedOption: listString[indexCurrent],
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

                          for (LoaiKhenThuong loaikhenthuong
                              in listLoaiKhenThuong!) {
                            listString.add(loaikhenthuong.maLKT);
                          }
                          return InputSelectData(
                              list: listString,
                              label: 'Loại Khen Thưởng',
                              selectedOption: maLKT,
                              onChanged: (value) {
                                maLKT = value;
                                soTienThuong = listLoaiKhenThuong[
                                        listString.indexOf(maLKT)]
                                    .soTienThuong;
                              },
                              hinttext: '--Chọn loại khen thưởng--');
                        } else {
                          return InputSelect(
                              list: const [],
                              label: 'Loại khen thưởng',
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
                      name: moTa,
                      hinttext: '',
                      onChanged: (value) {
                        moTa = value;
                      }),
                  const SizedBox(
                    width: 45,
                  ),
                  InputTimePicker(
                      label: 'Ngày khen thưởng',
                      name: DateFormat('MM/dd/yyyy').format(ngayKT),
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
              final khenThuong = KhenThuong(
                  maKT: maKT,
                  maNV: maNV,
                  maLKT: maLKT,
                  moTa: moTa,
                  soTienThuong: soTienThuong,
                  ngayKT: Timestamp.fromDate(ngayKT));
              await khenThuongProvider.updKhenThuong(khenThuong);
              ScaffoldMessenger.of(context).showSnackBar(
                  buildSuccessSnackbar('Cập nhật khen thưởng thành công!'));
            } catch (e) {
              ScaffoldMessenger.of(context).showSnackBar(
                  buildFailedSnackbar('Cập nhật khen thưởng thất bại!'));
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

List<String> list = ['NV001-Nguyen Trung Tinh', 'NV002-Thach A Sang'];
