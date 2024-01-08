import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quanlynhanvien/components/failed_snackbar.dart';
import 'package:quanlynhanvien/components/input.number.component.dart';
import 'package:quanlynhanvien/components/input.text.component.dart';
import 'package:quanlynhanvien/components/success_snackbar.dart';
import 'package:quanlynhanvien/constants/app_colors.dart';
import 'package:quanlynhanvien/models/loaikhenthuong.model.dart';
import 'package:quanlynhanvien/providers/loaikhenthuong.provider.dart';
import 'package:quanlynhanvien/services/getlastthreechar.dart';

import 'input.text.multiline.component.dart';
import 'input.time.component.dart';

class AddBonusTypeComponent extends StatefulWidget {
  const AddBonusTypeComponent({super.key});

  @override
  State<AddBonusTypeComponent> createState() => _AddBonusComponentState();
}

class _AddBonusComponentState extends State<AddBonusTypeComponent> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    String? tenLKT;
    String? moTa;
    DateTime? ngayTao;
    int? soTienThuong;
    final loaiKhenThuongProvider = Provider.of<LoaiKhenThuongProvider>(context);

    return AlertDialog(
      title: const Text(
        'Thêm loại khen thưởng',
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
                  InputTextField(
                      label: 'Tên loại khen thưởng',
                      name: '',
                      isRequired: true,
                      hinttext: '',
                      onChanged: (valua) {
                        tenLKT = valua;
                      }),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InputNumberField(
                      label: 'Số tiền thưởng',
                      name: '',
                      hinttext: '',
                      onChanged: (value) {
                        soTienThuong = int.tryParse(value);
                      }),
                  const SizedBox(
                    width: 45,
                  ),
                  InputTimePicker(
                      label: 'Ngày tạo',
                      name: '',
                      hinttext: 'DD/MM/YYYY',
                      onChanged: (value) {
                        ngayTao = value;
                      }),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  InputTextMultiline(
                      label: 'Mô tả',
                      name: '',
                      hinttext: '',
                      onChanged: (value) {
                        moTa = value;
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
              LoaiKhenThuong? lastLoaiKhenThuong =
                  await loaiKhenThuongProvider.getLastLoaiKhenThuong();

              int soThuTu = lastLoaiKhenThuong != null
                  ? getLastThreeCharsAsInteger(lastLoaiKhenThuong.maLKT) + 1
                  : 0;

              String maLKT = 'LKT' + soThuTu.toString().padLeft(3, '0');

              final loaiKhenThuong = LoaiKhenThuong(
                  maLKT: maLKT,
                  moTa: moTa!,
                  tenLKT: tenLKT!,
                  soTienThuong: soTienThuong!,
                  ngayTao: Timestamp.fromDate(ngayTao!));

              await loaiKhenThuongProvider.addLoaiKhenThuong(loaiKhenThuong);

              ScaffoldMessenger.of(context).showSnackBar(
                  buildSuccessSnackbar('Thêm loại khen thưởng thành công!'));
            } catch (e) {
              print(e);
              ScaffoldMessenger.of(context).showSnackBar(
                  buildFailedSnackbar('Thêm loại khen thưởng thất bại!'));
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
