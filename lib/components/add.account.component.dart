import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quanlynhanvien/components/failed_snackbar.dart';
import 'package:quanlynhanvien/components/input.select.component.dart';
import 'package:quanlynhanvien/components/input.text.component.dart';
import 'package:quanlynhanvien/components/success_snackbar.dart';
import 'package:quanlynhanvien/constants/app_colors.dart';
import 'package:quanlynhanvien/models/khenthuong.model.dart';
import 'package:quanlynhanvien/models/loaikhenthuong.model.dart';
import 'package:quanlynhanvien/models/nhanvien.model.dart';
import 'package:quanlynhanvien/providers/khenthuong.provider.dart';
import 'package:quanlynhanvien/providers/loaikhenthuong.provider.dart';
import 'package:quanlynhanvien/providers/nhanvien.provider.dart';
import 'package:quanlynhanvien/screens/tabs/createaccount.tab.dart';
import 'package:quanlynhanvien/services/getlastthreechar.dart';

import 'input.text.multiline.component.dart';
import 'input.time.component.dart';

class AddAccountComponent extends StatefulWidget {
  const AddAccountComponent({super.key});

  @override
  State<AddAccountComponent> createState() => _AddBonusComponentState();
}

class _AddBonusComponentState extends State<AddAccountComponent> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    String? maNV;
    String? maLKT;
    String? moTa;
    DateTime? ngayKT;

    final khenThuongProvider = Provider.of<KhenThuongProvider>(context);
    final nhanVienProvider = Provider.of<NhanVienProvider>(context);
    final loaiKhenThuongProvider = Provider.of<LoaiKhenThuongProvider>(context);

    return AlertDialog(
      title: const Text(
        'Thêm tài khoản',
        style: TextStyle(
          fontFamily: 'CeraPro',
        ),
      ),
      content: Container(
        width: 900,
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: AppColors.greyShuttle),
            borderRadius: BorderRadius.circular(15)),
        padding: const EdgeInsets.all(30),
        child: Column(children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height / 30,
          ),
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
          SizedBox(
            height: MediaQuery.sizeOf(context).height / 30,
          ),
          DefaultTextStyle(
            style: const TextStyle(fontSize: 16, fontFamily: 'CeraPro'),
            child: Column(
              children: [
                const SizedBox(
                  height: 25,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InputSelect(
                        list: listNV,
                        label: 'Nhân Viên',
                        selectedOption: '',
                        onChanged: (value) {},
                        hinttext: '--Chọn mã nhân viên--'),
                    const SizedBox(
                      width: 45,
                    ),
                    InputSelect(
                        list: listNV,
                        label: 'Loại người dùng',
                        selectedOption: '',
                        onChanged: (value) {},
                        hinttext: '--Chọn loại người dùng--'),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InputTextField(
                        label: 'Tên Đăng Nhập',
                        name: '',
                        hinttext: 'nguyenvana123',
                        isRequired: true,
                        onChanged: (value) {
                          // setState(() {
                          //   tenDangNhap = value;
                          // });
                        }),
                    const SizedBox(
                      width: 45,
                    ),
                    InputTextField(
                        label: 'Mật khẩu',
                        name: '',
                        hinttext: '123456789',
                        isRequired: true,
                        onChanged: (value) {})
                  ],
                ),
              ],
            ),
          ),
        ]),
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
              KhenThuong? lastiKhenThuong =
                  await khenThuongProvider.getLastKhenThuong();

              int soThuTu = lastiKhenThuong != null
                  ? getLastThreeCharsAsInteger(lastiKhenThuong.maKT) + 1
                  : 0;

              String maKT = 'KT' + soThuTu.toString().padLeft(3, '0');

              final khenThuong = KhenThuong(
                  maKT: maKT,
                  maNV: maNV!,
                  maLKT: maLKT!,
                  moTa: moTa!,
                  ngayKT: Timestamp.fromDate(ngayKT!));

              await khenThuongProvider.addKhenThuong(khenThuong);

              ScaffoldMessenger.of(context).showSnackBar(
                  buildSuccessSnackbar('Thêm khen thưởng thành công!'));
            } catch (e) {
              print(e);
              ScaffoldMessenger.of(context).showSnackBar(
                  buildFailedSnackbar('Thêm khen thưởng thất bại!'));
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

List<String> list = ['NV001  Nguyen Trung Tinh', 'NV002 - Thach A Sang'];
