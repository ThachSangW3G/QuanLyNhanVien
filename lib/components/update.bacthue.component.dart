import 'package:flutter/material.dart';
import 'package:quanlynhanvien/components/input.number.component.dart';
import 'package:quanlynhanvien/components/input.text.component.dart';
import 'package:quanlynhanvien/constants/app_colors.dart';

class UpdateBacThueComponent extends StatefulWidget {
  const UpdateBacThueComponent({super.key});

  @override
  State<UpdateBacThueComponent> createState() => _UpdateBacThueComponentState();
}

class _UpdateBacThueComponentState extends State<UpdateBacThueComponent> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Chỉnh sửa bậc thuế',
        style: TextStyle(fontFamily: 'CarePro'),
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
            child: Column(
              children: [
                Row(
                  children: [
                    InputTextField(
                      label: 'Bậc thuế',
                      name: '',
                      hinttext: '',
                      isRequired: true,
                      onChanged: (value) {},
                      readOnly: true,
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    InputNumberField(
                        label: 'Từ',
                        name: '',
                        hinttext: '',
                        onChanged: (value) {})
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    InputNumberField(
                        label: 'Đến',
                        name: '',
                        hinttext: '',
                        onChanged: (value) {}),
                    const SizedBox(
                      width: 40,
                    ),
                    InputNumberField(
                        label: 'Thuế suất',
                        name: '',
                        hinttext: '',
                        onChanged: (value) {})
                  ],
                ),
              ],
            ),
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
