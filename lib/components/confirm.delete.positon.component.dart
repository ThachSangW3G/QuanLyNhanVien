import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quanlynhanvien/components/failed_snackbar.dart';
import 'package:quanlynhanvien/components/success_snackbar.dart';
import 'package:quanlynhanvien/constants/app_colors.dart';

import 'package:quanlynhanvien/providers/chucvu.provider.dart';

class ConfirmDeletePositionComponent extends StatefulWidget {
  final String maCV;
  const ConfirmDeletePositionComponent({super.key, required this.maCV});

  @override
  State<ConfirmDeletePositionComponent> createState() =>
      _AddBonusComponentState();
}

class _AddBonusComponentState extends State<ConfirmDeletePositionComponent> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    final chucVuProvider = Provider.of<ChucVuProvider>(context);
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
              setState(() {
                loading = true;
              });
              await chucVuProvider.delChucVu(widget.maCV);
              Navigator.pop(context);

              ScaffoldMessenger.of(context).showSnackBar(
                  buildSuccessSnackbar('Xóa chức vụ thành công!'));
            } catch (e) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(buildFailedSnackbar('Xóa chức vụ thất bại!'));
            }
            setState(() {
              loading = false;
            });
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
              : const Text('OK',
                  style:
                      TextStyle(fontFamily: 'CeraPro', color: AppColors.white)),
        ),
      ],
    );
  }
}
