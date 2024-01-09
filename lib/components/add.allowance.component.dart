import 'package:flutter/material.dart';
import 'package:quanlynhanvien/components/input.number.component.dart';
import 'package:quanlynhanvien/components/input.select.component.dart';
import 'package:quanlynhanvien/components/input.text.multiline.component.dart';
import 'package:quanlynhanvien/components/input.time.component.dart';
import 'package:quanlynhanvien/constants/app_colors.dart';

class AddAllowanceComponent extends StatefulWidget {
  const AddAllowanceComponent({super.key});

  @override
  State<AddAllowanceComponent> createState() => _AddAllowanceComponentState();
}

class _AddAllowanceComponentState extends State<AddAllowanceComponent> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Thêm phụ cấp',
        style: TextStyle(fontFamily: 'CeraPro'),
      ),
      content: Column(children: [
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
              Row(children: [
                InputSelect(
                    list: list,
                    selectedOption: '',
                    onChanged: (value) {},
                    label: 'Nhân viên',
                    hinttext: ''),
                const SizedBox(
                  width: 15,
                ),
                InputNumberField(
                    label: 'Số tiền',
                    name: '',
                    hinttext: '',
                    onChanged: (value) {})
              ]),
              const SizedBox(
                height: 45,
              ),
              Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                InputTimePicker(
                    label: 'Ngày phụ cấp',
                    name: '',
                    hinttext: '',
                    onChanged: (value) {}),
                const SizedBox(
                  width: 15,
                ),
                InputTextMultiline(
                    label: 'Mô tả',
                    name: '',
                    hinttext: '',
                    onChanged: (value) {})
              ]),
            ],
          ),
        )
      ]),
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

List<String> list = ['NV001  Nguyen Trung Tinh', 'NV002 - Thach A Sang'];
