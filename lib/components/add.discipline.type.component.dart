import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quanlynhanvien/components/failed_snackbar.dart';
import 'package:quanlynhanvien/components/input.number.component.dart';
import 'package:quanlynhanvien/components/input.text.component.dart';
import 'package:quanlynhanvien/components/success_snackbar.dart';
import 'package:quanlynhanvien/constants/app_colors.dart';
import 'package:quanlynhanvien/models/loaikyluat.model.dart';
import 'package:quanlynhanvien/providers/loaikyluat.provider.dart';
import 'package:quanlynhanvien/services/getlastthreechar.dart';

import 'input.text.multiline.component.dart';
import 'input.time.component.dart';

class AddDisciplineTypeComponent extends StatefulWidget {
  const AddDisciplineTypeComponent({super.key});

  @override
  State<AddDisciplineTypeComponent> createState() => _AddBonusComponentState();
}

class _AddBonusComponentState extends State<AddDisciplineTypeComponent> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    String? tenLKL;
    String? moTa;
    DateTime? ngayTao;
    int? soTienPhat;
    final loaiKyLuatProvider = Provider.of<LoaiKyLuatProvider>(context);
    return AlertDialog(
      title: const Text(
        'Thêm loại kỷ luật',
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
                      label: 'Tên Loại Kỷ Luật',
                      name: '',
                      isRequired: true,
                      hinttext: '',
                      onChanged: (valua) {
                        tenLKL = valua;
                      }),
                  const SizedBox(
                    width: 45,
                  ),
                  InputNumberField(
                      label: 'Số tiền phạt',
                      name: '',
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
                      name: '',
                      hinttext: '',
                      onChanged: (value) {
                        moTa = value;
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
              LoaiKyLuat? lastLoaiKyLuat =
                  await loaiKyLuatProvider.getLastLoaiKyLuat();

              int soThuTu = lastLoaiKyLuat != null
                  ? getLastThreeCharsAsInteger(lastLoaiKyLuat.maLKL) + 1
                  : 0;

              String maLKL = 'LKL' + soThuTu.toString().padLeft(3, '0');

              final loaiKyLuat = LoaiKyLuat(
                  maLKL: maLKL,
                  moTa: moTa!,
                  tenLKL: tenLKL!,
                  soTienPhat: soTienPhat!,
                  ngayTao: Timestamp.fromDate(ngayTao!));

              await loaiKyLuatProvider.addLoaiKyLuat(loaiKyLuat);

              ScaffoldMessenger.of(context).showSnackBar(
                  buildSuccessSnackbar('Thêm loại kỷ luật thành công!'));
            } catch (e) {
              print(e);
              ScaffoldMessenger.of(context).showSnackBar(
                  buildFailedSnackbar('Thêm loại kỷ luật thất bại!'));
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
