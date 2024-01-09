import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quanlynhanvien/components/failed_snackbar.dart';
import 'package:quanlynhanvien/components/input.select.component.dart';
import 'package:quanlynhanvien/components/input.select.data.dart';
import 'package:quanlynhanvien/components/input.text.component.dart';
import 'package:quanlynhanvien/components/success_snackbar.dart';
import 'package:quanlynhanvien/constants/app_colors.dart';
import 'package:quanlynhanvien/models/khenthuong.model.dart';
import 'package:quanlynhanvien/models/loaikhenthuong.model.dart';
import 'package:quanlynhanvien/models/nguoidung.model.dart';
import 'package:quanlynhanvien/models/nhanvien.model.dart';
import 'package:quanlynhanvien/providers/khenthuong.provider.dart';
import 'package:quanlynhanvien/providers/loaikhenthuong.provider.dart';
import 'package:quanlynhanvien/providers/nguoidung.provider.dart';
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
    String? tenDangNhap;
    String? matKhau;
    String? loaiND;

    final nhanVienProvider = Provider.of<NhanVienProvider>(context);
    final nguoiDungProvider = Provider.of<NguoiDungProvider>(context);

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
                    FutureBuilder<List<NhanVien>>(
                        future: nhanVienProvider.getAllNhanVien(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            final listNhanVien = snapshot.data;
                            final List<String> listString = [];
                            for (NhanVien nhanVien in listNhanVien!) {
                              listString
                                  .add(nhanVien.maNV + ' - ' + nhanVien.hoTen);
                            }
                            return InputSelect(
                                list: listString,
                                label: 'Nhân Viên',
                                selectedOption: '',
                                onChanged: (value) {
                                  final index = listString.indexOf(value);
                                  maNV = listNhanVien[index].maNV;
                                },
                                hinttext: '--Chọn mã nhân viên--');
                          } else {
                            return InputSelect(
                                list: const [],
                                label: 'Nhân Viên',
                                selectedOption: '',
                                onChanged: (value) {},
                                hinttext: '--Chọn nhân viên--');
                          }
                        }),
                    const SizedBox(
                      width: 45,
                    ),
                    InputSelect(
                        list: listLoaiNguoiDung,
                        label: 'Loại người dùng',
                        selectedOption: '',
                        onChanged: (value) {
                          if (value == 'Quản lý nhân sự') {
                            loaiND = 'manager';
                          } else if (value == 'Quản lý tài chính') {
                            loaiND = 'financial';
                          } else {
                            loaiND = 'staff';
                          }
                        },
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
                          tenDangNhap = value;
                        }),
                    const SizedBox(
                      width: 45,
                    ),
                    InputTextField(
                        label: 'Mật khẩu',
                        name: '',
                        hinttext: '123456789',
                        isRequired: true,
                        onChanged: (value) {
                          matKhau = value;
                        })
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
              NguoiDung? lastiKhenThuong =
                  await nguoiDungProvider.getLastNguoiDung();

              int soThuTu = lastiKhenThuong != null
                  ? getLastThreeCharsAsInteger(lastiKhenThuong.maND) + 1
                  : 0;

              String maND = 'ND' + soThuTu.toString().padLeft(3, '0');

              final nguoiDung = NguoiDung(
                  maND: maND,
                  maNV: maNV!,
                  tenDangNhap: tenDangNhap!,
                  matKhau: matKhau!,
                  loaiND: loaiND!);

              await nguoiDungProvider.addTaiKhoan(nguoiDung);

              ScaffoldMessenger.of(context).showSnackBar(
                  buildSuccessSnackbar('Thêm tài khoản thành công!'));
            } catch (e) {
              print(e);
              ScaffoldMessenger.of(context).showSnackBar(
                  buildFailedSnackbar('Thêm tài khoản thất bại!'));
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

List<String> listLoaiNguoiDung = [
  'Quản lý nhân sự',
  'Quản lý tài chính',
  'Nhân viên'
];
