import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:quanlynhanvien/components/failed_snackbar.dart';
import 'package:quanlynhanvien/components/input.text.component.dart';
import 'package:quanlynhanvien/components/input.text.multiline.component.dart';
import 'package:quanlynhanvien/components/input.time.component.dart';
import 'package:quanlynhanvien/components/success_snackbar.dart';
import 'package:quanlynhanvien/constants/app_colors.dart';
import 'package:quanlynhanvien/models/phongban.model.dart';
import 'package:quanlynhanvien/providers/phongban.provider.dart';

class UpdateDepartmentComponent extends StatefulWidget {
  final PhongBan phongBan;
  const UpdateDepartmentComponent({super.key, required this.phongBan});

  @override
  State<UpdateDepartmentComponent> createState() => _AddPhongBanState();
}

class _AddPhongBanState extends State<UpdateDepartmentComponent> {
  @override
  Widget build(BuildContext context) {
    String maPB = widget.phongBan.maPB;
    String tenPB = widget.phongBan.tenPB;
    DateTime ngayThanhLap = widget.phongBan.ngayThanhLap.toDate();
    String moTa = widget.phongBan.moTa;

    final phongBanProvider = Provider.of<PhongBanProvider>(context);
    return AlertDialog(
      title: const Text(
        'Thêm Phòng Ban',
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
                      label: 'Mã phòng ban',
                      readOnly: true,
                      name: widget.phongBan.maPB,
                      isRequired: true,
                      hinttext: 'Nhập mã phòng ban',
                      onChanged: (valua) {}),
                  const SizedBox(
                    width: 45,
                  ),
                  InputTextField(
                      label: 'Tên phòng ban',
                      name: widget.phongBan.tenPB,
                      isRequired: true,
                      hinttext: 'Nhập tên phòng ban',
                      onChanged: (valua) {
                        tenPB = valua;
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
                      label: 'Ngày sinh',
                      name: DateFormat('dd/MM/yyyy')
                          .format((widget.phongBan.ngayThanhLap).toDate()),
                      hinttext: 'DD/MM/YYYY',
                      onChanged: (value) {
                        ngayThanhLap = value;
                      }),
                  const SizedBox(
                    width: 45,
                  ),
                  InputTextMultiline(
                      label: 'Mô tả',
                      name: widget.phongBan.moTa,
                      hinttext: '',
                      onChanged: (value) {
                        moTa = widget.phongBan.moTa;
                      })
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
              final phongBan = PhongBan(
                  maPB: maPB,
                  tenPB: tenPB,
                  moTa: moTa,
                  ngayThanhLap: Timestamp.fromDate(ngayThanhLap));

              await phongBanProvider.updPhongBan(phongBan);

              ScaffoldMessenger.of(context).showSnackBar(
                  buildSuccessSnackbar('Cập nhật phòng ban thành công!'));
            } catch (e) {
              ScaffoldMessenger.of(context).showSnackBar(
                  buildFailedSnackbar('Cập nhật phòng ban thất bại!'));
            }
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
