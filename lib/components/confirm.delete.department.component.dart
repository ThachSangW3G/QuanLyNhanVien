import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quanlynhanvien/components/failed_snackbar.dart';
import 'package:quanlynhanvien/components/success_snackbar.dart';
import 'package:quanlynhanvien/constants/app_colors.dart';
import 'package:quanlynhanvien/models/phongban.model.dart';
import 'package:quanlynhanvien/providers/phongban.provider.dart';

class ConfirmDeleteDepartmentComponent extends StatefulWidget {
  final String maPB;
  const ConfirmDeleteDepartmentComponent({super.key, required this.maPB});

  @override
  State<ConfirmDeleteDepartmentComponent> createState() =>
      _AddBonusComponentState();
}

class _AddBonusComponentState extends State<ConfirmDeleteDepartmentComponent> {
  @override
  Widget build(BuildContext context) {
    final phongBanProvier = Provider.of<PhongBanProvider>(context);
    return AlertDialog(
      title: const Text(
        'Bạn có chắc chắn muốn xóa không',
        style: TextStyle(
          fontFamily: 'CeraPro',
        ),
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
              await phongBanProvier.delPhongBan(widget.maPB);
              Navigator.pop(context);

              ScaffoldMessenger.of(context).showSnackBar(
                  buildSuccessSnackbar('Xóa phòng ban thành công!'));
            } catch (e) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(buildFailedSnackbar('Xóa phòng ban thất bại!'));
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.bluedarkColor,
          ),
          child: const Text('OK',
              style: TextStyle(fontFamily: 'CeraPro', color: AppColors.white)),
        ),
      ],
    );
  }
}