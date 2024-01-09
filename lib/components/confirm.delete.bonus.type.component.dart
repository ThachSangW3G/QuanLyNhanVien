import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quanlynhanvien/components/failed_snackbar.dart';
import 'package:quanlynhanvien/components/success_snackbar.dart';
import 'package:quanlynhanvien/constants/app_colors.dart';
import 'package:quanlynhanvien/providers/loaikhenthuong.provider.dart';

class ConfirmDeleteBonusTypeComponent extends StatefulWidget {
  final String maLKT;
  const ConfirmDeleteBonusTypeComponent({super.key, required this.maLKT});

  @override
  State<ConfirmDeleteBonusTypeComponent> createState() =>
      _AddBonusComponentState();
}

class _AddBonusComponentState extends State<ConfirmDeleteBonusTypeComponent> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    final loaiKhenThuongProvider = Provider.of<LoaiKhenThuongProvider>(context);
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
              await loaiKhenThuongProvider.delLoaiKhenThuong(widget.maLKT);

              ScaffoldMessenger.of(context).showSnackBar(
                  buildSuccessSnackbar('Xóa loại khen thưởng thành công!'));
            } catch (e) {
              ScaffoldMessenger.of(context).showSnackBar(
                  buildFailedSnackbar('Xóa loại khen thưởng thất bại!'));
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
              : const Text('OK',
                  style:
                      TextStyle(fontFamily: 'CeraPro', color: AppColors.white)),
        ),
      ],
    );
  }
}
