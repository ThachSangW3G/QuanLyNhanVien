import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:quanlynhanvien/components/failed_snackbar.dart';
import 'package:quanlynhanvien/components/input.number.component.dart';
import 'package:quanlynhanvien/components/input.text.component.dart';
import 'package:quanlynhanvien/components/success_snackbar.dart';
import 'package:quanlynhanvien/constants/app_colors.dart';
import 'package:quanlynhanvien/models/loaikhenthuong.model.dart';
import 'package:quanlynhanvien/providers/loaikhenthuong.provider.dart';

import 'input.text.multiline.component.dart';
import 'input.time.component.dart';

class UpdateBonusTypeComponent extends StatefulWidget {
  final LoaiKhenThuong loaiKhenThuong;
  const UpdateBonusTypeComponent({super.key, required this.loaiKhenThuong});

  @override
  State<UpdateBonusTypeComponent> createState() => _AddBonusComponentState();
}

class _AddBonusComponentState extends State<UpdateBonusTypeComponent> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    String maLKT = widget.loaiKhenThuong.maLKT;
    String tenLKT = widget.loaiKhenThuong.tenLKT;
    int? soTienThuong = widget.loaiKhenThuong.soTienThuong;
    String moTa = widget.loaiKhenThuong.moTa;
    DateTime ngayTao = widget.loaiKhenThuong.ngayTao.toDate();

    final loaiKhenThuongProvider = Provider.of<LoaiKhenThuongProvider>(context);

    return AlertDialog(
      title: const Text(
        'Cập loại khen thưởng',
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
                      label: 'Mã loại khen thưởng',
                      name: maLKT,
                      readOnly: true,
                      isRequired: true,
                      hinttext: '',
                      onChanged: (valua) {
                        maLKT = valua;
                      }),
                  const SizedBox(
                    width: 45,
                  ),
                  InputTextField(
                      label: 'Tên loại khen thưởng',
                      name: tenLKT,
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
                      name: soTienThuong.toString(),
                      hinttext: 'hinttext',
                      onChanged: (value) {
                        soTienThuong = int.tryParse(value);
                      }),
                  const SizedBox(
                    width: 45,
                  ),
                  InputTimePicker(
                      label: 'Ngày tạo',
                      name: DateFormat('dd/MM/yyyy').format(ngayTao),
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
                      name: moTa,
                      hinttext: '',
                      onChanged: (value) {
                        moTa = value;
                      }),
                ],
              ),
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
              final loaiKhenThuong = LoaiKhenThuong(
                  maLKT: maLKT,
                  moTa: moTa,
                  tenLKT: tenLKT,
                  soTienThuong: soTienThuong!,
                  ngayTao: Timestamp.fromDate(ngayTao));
              await loaiKhenThuongProvider.updLoaiKhenThuong(loaiKhenThuong);
              ScaffoldMessenger.of(context).showSnackBar(buildSuccessSnackbar(
                  'Cập nhật loại khen thưởng thành công!'));
            } catch (e) {
              ScaffoldMessenger.of(context).showSnackBar(
                  buildFailedSnackbar('Cập nhật loại khen thưởng thất bại!'));
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
