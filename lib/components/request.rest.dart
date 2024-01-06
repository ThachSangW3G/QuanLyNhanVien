import 'package:flutter/material.dart';
import 'package:quanlynhanvien/components/input.text.multiline.component.dart';
import 'package:quanlynhanvien/components/input.time.component.dart';
import 'package:quanlynhanvien/constants/app_colors.dart';

class RequestRestCompnonet extends StatefulWidget {
  const RequestRestCompnonet({super.key});

  @override
  State<RequestRestCompnonet> createState() => _AddPhongBanState();
}

class _AddPhongBanState extends State<RequestRestCompnonet> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Yều Cầu Nghĩ Phép',
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
                  InputTimePicker(
                      label: 'Ngày bắt đầu',
                      name: '',
                      hinttext: 'DD/MM/YYYY',
                      onChanged: (value) {}),
                  const SizedBox(
                    width: 45,
                  ),
                  InputTimePicker(
                      label: 'Ngày kết thúc',
                      name: '',
                      hinttext: 'DD/MM/YYYY',
                      onChanged: (value) {}),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InputTextMultiline(
                      label: 'Lý do',
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
