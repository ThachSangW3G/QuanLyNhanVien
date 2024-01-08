import 'package:flutter/material.dart';
import 'package:quanlynhanvien/components/input.text.component.dart';
import 'package:quanlynhanvien/components/input.text.multiline.component.dart';
import 'package:quanlynhanvien/components/input.time.component.dart';
import 'package:quanlynhanvien/constants/app_colors.dart';
import 'package:quanlynhanvien/models/phongban.model.dart';

class UpdateDepartmentComponent extends StatefulWidget {
  final PhongBan phongBan;
  const UpdateDepartmentComponent({super.key, required this.phongBan});

  @override
  State<UpdateDepartmentComponent> createState() => _AddPhongBanState();
}

class _AddPhongBanState extends State<UpdateDepartmentComponent> {
  @override
  Widget build(BuildContext context) {
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
                      name: '',
                      isRequired: true,
                      hinttext: 'Nhập mã phòng ban',
                      onChanged: (valua) {}),
                  const SizedBox(
                    width: 45,
                  ),
                  InputTextField(
                      label: 'Tên phòng ban',
                      name: '',
                      isRequired: true,
                      hinttext: 'Nhập tên phòng ban',
                      onChanged: (valua) {}),
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
                      name: '',
                      hinttext: 'DD/MM/YYYY',
                      onChanged: (value) {}),
                  const SizedBox(
                    width: 45,
                  ),
                  InputTextMultiline(
                      label: 'Mô tả',
                      name: '',
                      hinttext: '',
                      onChanged: (value) {})
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
          onPressed: () {},
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
