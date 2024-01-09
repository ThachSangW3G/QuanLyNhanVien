import 'package:flutter/material.dart';
import 'package:quanlynhanvien/components/input.select.component.dart';
import 'package:quanlynhanvien/components/input.text.component.dart';
import 'package:quanlynhanvien/components/input.time.component.dart';
import 'package:quanlynhanvien/constants/app_colors.dart';

class AddConTractComponent extends StatefulWidget {
  const AddConTractComponent({super.key});

  @override
  State<AddConTractComponent> createState() => _AddConTractComponentState();
}

class _AddConTractComponentState extends State<AddConTractComponent> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Thêm hợp đồng lao động',
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
                      label: 'Mã hợp đồng lao động',
                      name: '',
                      isRequired: true,
                      hinttext: '',
                      onChanged: (valua) {}),
                  const SizedBox(
                    width: 45,
                  ),
                  InputTimePicker(
                      label: 'Ngày ký',
                      name: '',
                      hinttext: 'DD/MM/YYYY',
                      onChanged: (value) {})
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InputSelect(
                      list: list,
                      selectedOption: '',
                      onChanged: (value) {},
                      label: 'Chọn nhân viên',
                      hinttext: ''),
                  const SizedBox(
                    width: 45,
                  ),
                  InputTimePicker(
                      label: 'Ngày bắt đầu',
                      name: '',
                      hinttext: 'DD/MM/YYYY',
                      onChanged: (value) {}),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  InputTextField(
                      label: 'Lương cơ bản',
                      name: '',
                      isRequired: true,
                      hinttext: '',
                      onChanged: (valua) {}),
                  const SizedBox(
                    width: 45,
                  ),
                  InputTextField(
                      label: 'Hệ số lương',
                      name: '',
                      isRequired: true,
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
          onPressed: () {
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

List<String> list = ['NV001', 'NV0002'];
