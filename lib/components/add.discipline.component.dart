import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quanlynhanvien/components/failed_snackbar.dart';
import 'package:quanlynhanvien/components/input.select.component.dart';
import 'package:quanlynhanvien/components/success_snackbar.dart';
import 'package:quanlynhanvien/constants/app_colors.dart';
import 'package:quanlynhanvien/models/kyluat.model.dart';
import 'package:quanlynhanvien/models/loaikyluat.model.dart';
import 'package:quanlynhanvien/models/nhanvien.model.dart';
import 'package:quanlynhanvien/providers/kyluat.provider.dart';
import 'package:quanlynhanvien/providers/loaikyluat.provider.dart';
import 'package:quanlynhanvien/providers/nhanvien.provider.dart';
import 'package:quanlynhanvien/services/getlastthreechar.dart';

import 'input.text.multiline.component.dart';
import 'input.time.component.dart';

class AddDisciplineComponent extends StatefulWidget {
  const AddDisciplineComponent({super.key});

  @override
  State<AddDisciplineComponent> createState() => _AddBonusComponentState();
}

class _AddBonusComponentState extends State<AddDisciplineComponent> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    String? maNV;
    String? maLKL;
    String? moTa;
    DateTime? ngayKL;

    final kyLuatProvider = Provider.of<KyLuatProvider>(context);
    final nhanVienProvider = Provider.of<NhanVienProvider>(context);
    final loaiKyLuatProvider = Provider.of<LoaiKyLuatProvider>(context);

    return AlertDialog(
      title: const Text(
        'Thêm kỷ luật',
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
                  FutureBuilder<List<LoaiKyLuat>>(
                      future: loaiKyLuatProvider.getAllLoaiKyLuat(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          final listLoaiKyLuat = snapshot.data;
                          final List<String> listString = [];
                          for (LoaiKyLuat loaiKyLuat in listLoaiKyLuat!) {
                            listString.add(
                                loaiKyLuat.maLKL + ' - ' + loaiKyLuat.tenLKL);
                          }
                          return InputSelect(
                              list: listString,
                              label: 'Loại kỷ luật',
                              selectedOption: '',
                              onChanged: (value) {
                                final index = listString.indexOf(value);
                                maLKL = listLoaiKyLuat[index].maLKL;
                              },
                              hinttext: '--Chọn loại kỷ luật--');
                        } else {
                          return InputSelect(
                              list: const [],
                              label: 'Loại kỷ luật',
                              selectedOption: '',
                              onChanged: (value) {},
                              hinttext: '--Chọn loại  kỷ luật--');
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
                      label: 'Ngày kỷ luật',
                      name: '',
                      hinttext: 'DD/MM/YYYY',
                      onChanged: (value) {
                        ngayKL = value;
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
              KyLuat? lastiKyLuat = await kyLuatProvider.getLastKyLuat();

              int soThuTu = lastiKyLuat != null
                  ? getLastThreeCharsAsInteger(lastiKyLuat.maKL) + 1
                  : 0;

              String maKL = 'KT' + soThuTu.toString().padLeft(3, '0');

              final kyLuat = KyLuat(
                  maKL: maKL,
                  maNV: maNV!,
                  maLKL: maLKL!,
                  moTa: moTa!,
                  ngayKL: Timestamp.fromDate(ngayKL!));

              await kyLuatProvider.addKyLuat(kyLuat);

              ScaffoldMessenger.of(context).showSnackBar(
                  buildSuccessSnackbar('Thêm ky luật thành công!'));
            } catch (e) {
              print(e);
              ScaffoldMessenger.of(context)
                  .showSnackBar(buildFailedSnackbar('Thêm kỷ luật thất bại!'));
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

List<String> list = ['NV001  Nguyen Trung Tinh', 'NV002 - Thach A Sang'];
