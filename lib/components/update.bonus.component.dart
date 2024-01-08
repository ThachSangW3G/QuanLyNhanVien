import 'package:flutter/material.dart';
import 'package:quanlynhanvien/components/input.select.component.dart';
import 'package:quanlynhanvien/constants/app_colors.dart';
import 'package:quanlynhanvien/models/khenthuong.model.dart';

import 'input.text.multiline.component.dart';
import 'input.time.component.dart';

class UpdateBonusComponent extends StatefulWidget {
  final KhenThuong khenThuong;
  const UpdateBonusComponent({super.key, required this.khenThuong});

  @override
  State<UpdateBonusComponent> createState() => _AddBonusComponentState();
}

class _AddBonusComponentState extends State<UpdateBonusComponent> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Thêm khen thưởng',
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
                  InputSelect(
                      list: list,
                      label: 'Nhân Viên',
                      selectedOption: '',
                      onChanged: (value) {},
                      hinttext: '--Chọn nhân viên--'),
                  const SizedBox(
                    width: 45,
                  ),
                  InputSelect(
                      list: list,
                      label: 'Loại Khen Thưởng',
                      selectedOption: '',
                      onChanged: (value) {},
                      hinttext: '--Chọn loại khen thưởng--'),
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
                      name: widget.khenThuong.moTa,
                      hinttext: '',
                      onChanged: (value) {}),
                  const SizedBox(
                    width: 45,
                  ),
                  InputTimePicker(
                      label: 'Ngày khen thưởng',
                      name: '',
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
