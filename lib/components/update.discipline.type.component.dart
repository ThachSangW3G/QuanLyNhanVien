import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:quanlynhanvien/components/failed_snackbar.dart';
import 'package:quanlynhanvien/components/input.text.component.dart';
import 'package:quanlynhanvien/components/success_snackbar.dart';
import 'package:quanlynhanvien/constants/app_colors.dart';
import 'package:quanlynhanvien/models/loaikyluat.model.dart';
import 'package:quanlynhanvien/providers/loaikyluat.provider.dart';

import 'input.text.multiline.component.dart';
import 'input.time.component.dart';

class UpdateDisciplineTypeComponent extends StatefulWidget {
  final LoaiKyLuat loaiKyLuat;
  const UpdateDisciplineTypeComponent({super.key, required this.loaiKyLuat});

  @override
  State<UpdateDisciplineTypeComponent> createState() =>
      _AddBonusComponentState();
}

class _AddBonusComponentState extends State<UpdateDisciplineTypeComponent> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    String maLKL = widget.loaiKyLuat.maLKL;
    String tenLKT = widget.loaiKyLuat.tenLKL;
    int? soTienPhat = widget.loaiKyLuat.soTienPhat;
    String moTa = widget.loaiKyLuat.moTa;
    DateTime ngayTao = widget.loaiKyLuat.ngayTao.toDate();

    final loaiKyLuatProvider = Provider.of<LoaiKyLuatProvider>(context);

    return AlertDialog(
      title: const Text(
        'Cập nhật loại kỷ luật',
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
                      label: 'Tên loại kỷ luật',
                      name: tenLKT,
                      isRequired: true,
                      hinttext: '',
                      onChanged: (valua) {
                        tenLKT = valua;
                      }),
                  const SizedBox(
                    width: 45,
                  ),
                  InputTextField(
                      label: 'Số tiền phạt',
                      name: soTienPhat.toString(),
                      isRequired: true,
                      hinttext: '',
                      onChanged: (valua) {
                        soTienPhat = int.tryParse(valua);
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
                      label: 'Ngày tạo',
                      name: DateFormat('dd/MM/yyyy').format(ngayTao),
                      hinttext: 'DD/MM/YYYY',
                      onChanged: (value) {}),
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
              final loaiKyLuat = LoaiKyLuat(
                  maLKL: maLKL,
                  moTa: moTa,
                  tenLKL: tenLKT,
                  soTienPhat: soTienPhat!,
                  ngayTao: Timestamp.fromDate(ngayTao));
              await loaiKyLuatProvider.updLoaiKyLuat(loaiKyLuat);
              ScaffoldMessenger.of(context).showSnackBar(
                  buildSuccessSnackbar('Cập nhật loại kỷ luật thành công!'));
            } catch (e) {
              ScaffoldMessenger.of(context).showSnackBar(
                  buildFailedSnackbar('Cập nhật loại kỷ luật thất bại!'));
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
