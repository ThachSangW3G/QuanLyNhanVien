import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quanlynhanvien/components/input.text.component.dart';
import 'package:quanlynhanvien/components/input.text.multiline.component.dart';
import 'package:quanlynhanvien/components/input.time.component.dart';
import 'package:quanlynhanvien/constants/app_colors.dart';
import 'package:quanlynhanvien/models/phongban.model.dart';
import 'package:quanlynhanvien/providers/phongban.provider.dart';
import 'package:quanlynhanvien/services/getlastthreechar.dart';

class AddDepartmentComponent extends StatefulWidget {
  const AddDepartmentComponent({super.key});

  @override
  State<AddDepartmentComponent> createState() => _AddPhongBanState();
}

class _AddPhongBanState extends State<AddDepartmentComponent> {
  String? tenPB;
  DateTime? ngayThanhLap;
  String? moTa;

  SnackBar successSnackbar = SnackBar(
    backgroundColor: Colors.green,
    content: Container(
      height: 50,
      child: const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Icon(
          Icons.check,
          color: Colors.white,
        ),
        SizedBox(
          width: 18,
        ),
        Text(
          'Thêm phòng ban thành công!',
        )
      ]),
    ),
    duration: const Duration(milliseconds: 1500),
    width: 280.0, // Width of the SnackBar.

    padding: const EdgeInsets.symmetric(
      horizontal: 8.0, // Inner padding for SnackBar content.
    ),
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
  );

  SnackBar faileSnackbar = SnackBar(
    backgroundColor: Colors.red,
    content: Container(
      height: 50,
      child: const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Icon(
          Icons.close_outlined,
          color: Colors.white,
        ),
        SizedBox(
          width: 18,
        ),
        Text(
          'Thêm phòng ban thất bại!',
        )
      ]),
    ),
    duration: const Duration(milliseconds: 1500),
    width: 280.0, // Width of the SnackBar.

    padding: const EdgeInsets.symmetric(
      horizontal: 8.0, // Inner padding for SnackBar content.
    ),
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
  );

  @override
  Widget build(BuildContext context) {
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
                      label: 'Tên phòng ban',
                      name: '',
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
                      label: 'Ngày thành lập',
                      name: '',
                      hinttext: 'DD/MM/YYYY',
                      onChanged: (value) {
                        ngayThanhLap = value;
                      }),
                  const SizedBox(
                    width: 45,
                  ),
                  InputTextMultiline(
                      label: 'Mô tả',
                      name: '',
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
              PhongBan? lastNhanVien = await phongBanProvider.getLastNhanVien();

              int soThuTu = lastNhanVien != null
                  ? getLastThreeCharsAsInteger(lastNhanVien.maPB) + 1
                  : 0;

              String maNV = 'PB' + soThuTu.toString().padLeft(3, '0');
              final phongBan = PhongBan(
                  maPB: maNV,
                  tenPB: tenPB!,
                  ngayThanhLap: Timestamp.fromDate(ngayThanhLap!),
                  moTa: moTa!);

              await phongBanProvider.addPhongBan(phongBan);

              ScaffoldMessenger.of(context).showSnackBar(successSnackbar);
            } catch (e) {
              ScaffoldMessenger.of(context).showSnackBar(successSnackbar);
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
