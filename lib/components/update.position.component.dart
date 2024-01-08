import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quanlynhanvien/components/failed_snackbar.dart';
import 'package:quanlynhanvien/components/input.text.component.dart';
import 'package:quanlynhanvien/components/input.text.multiline.component.dart';
import 'package:quanlynhanvien/components/input.time.component.dart';
import 'package:quanlynhanvien/components/success_snackbar.dart';
import 'package:quanlynhanvien/constants/app_colors.dart';
import 'package:quanlynhanvien/models/chucvu.model.dart';
import 'package:quanlynhanvien/providers/chucvu.provider.dart';

class UpdatePositionComponent extends StatefulWidget {
  final ChucVu chucVu;
  const UpdatePositionComponent({super.key, required this.chucVu});

  @override
  State<UpdatePositionComponent> createState() => _AddPhongBanState();
}

class _AddPhongBanState extends State<UpdatePositionComponent> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    String maCV = widget.chucVu.maCV;
    String tenCV = widget.chucVu.tenCV;
    String moTa = widget.chucVu.moTa;
    final chucVuProvider = Provider.of<ChucVuProvider>(context);
    return AlertDialog(
      title: const Text(
        'Thêm Chức Vụ',
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
                      label: 'Mã chức vụ',
                      name: maCV,
                      readOnly: true,
                      isRequired: true,
                      hinttext: '',
                      onChanged: (valua) {
                        maCV = valua;
                      }),
                  const SizedBox(
                    width: 45,
                  ),
                  InputTextField(
                      label: 'Tên chức vụ',
                      name: tenCV,
                      isRequired: true,
                      hinttext: '',
                      onChanged: (valua) {
                        tenCV = valua;
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
              final chucVu = ChucVu(maCV: maCV, tenCV: tenCV, moTa: moTa);
              setState(() {
                loading = true;
              });
              await chucVuProvider.updChucVu(chucVu);

              ScaffoldMessenger.of(context).showSnackBar(
                  buildSuccessSnackbar('Cập nhật chức vụ thành công!'));
            } catch (e) {
              ScaffoldMessenger.of(context).showSnackBar(
                  buildFailedSnackbar('Cập nhật chức vụ thất bại!'));
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
