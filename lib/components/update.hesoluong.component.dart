import 'package:flutter/material.dart';
import 'package:quanlynhanvien/components/input.text.component.dart';
import 'package:quanlynhanvien/constants/app_colors.dart';

class UpdateLuongComponent extends StatefulWidget {
  const UpdateLuongComponent({super.key});

  @override
  State<UpdateLuongComponent> createState() => _AddBonusComponentState();
}

class _AddBonusComponentState extends State<UpdateLuongComponent> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Chỉnh sửa thông tin lương',
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
                      label: 'Mã nhân viên',
                      name: '',
                      readOnly: true,
                      isRequired: true,
                      hinttext: '',
                      onChanged: (valua) {}),
                  const SizedBox(
                    width: 45,
                  ),
                  InputTextField(
                      label: 'Tên nhân viên',
                      name: '',
                      isRequired: true,
                      readOnly: true,
                      hinttext: '',
                      onChanged: (valua) {}),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InputTextField(
                      label: 'Lương cơ bản',
                      name: '',
                      isRequired: true,
                      readOnly: true,
                      hinttext: '',
                      onChanged: (valua) {}),
                  const SizedBox(
                    width: 45,
                  ),
                  InputTextField(
                      label: 'Hệ số lương',
                      name: '',
                      isRequired: true,
                      readOnly: true,
                      hinttext: '',
                      onChanged: (valua) {}),
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

List<String> list = ['NV001  Nguyen Trung Tinh', 'NV002 - Thach A Sang'];
