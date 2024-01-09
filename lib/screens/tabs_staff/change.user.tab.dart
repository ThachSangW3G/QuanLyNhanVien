import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quanlynhanvien/components/failed_snackbar.dart';
import 'package:quanlynhanvien/components/input.select.component.dart';
import 'package:quanlynhanvien/components/input.text.component.dart';
import 'package:quanlynhanvien/components/success_snackbar.dart';
import 'package:quanlynhanvien/constants/app_colors.dart';
import 'package:quanlynhanvien/providers/nguoidung.provider.dart';

class ChangeUser extends StatefulWidget {
  const ChangeUser({super.key});

  @override
  State<ChangeUser> createState() => _TimeKeepingState();
}

class _TimeKeepingState extends State<ChangeUser> {
  String? matKhauHienTai;
  String? matKhauMoi;
  String? matKhauMoi2;

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    final nguoiDungProvider = Provider.of<NguoiDungProvider>(context);
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.sizeOf(context).width / 30),
      child: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height / 30,
          ),
          const Row(
            children: [
              Text(
                'Tài khoản',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'CeraPro'),
              ),
              Icon(Icons.keyboard_arrow_right),
              Text(
                'Đổi tên đăng nhập và password',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'CeraPro'),
              )
            ],
          ),
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
          Expanded(
            child: DefaultTextStyle(
              style: const TextStyle(fontSize: 16, fontFamily: 'CeraPro'),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: AppColors.greyShuttle),
                    borderRadius: BorderRadius.circular(15)),
                padding: const EdgeInsets.all(30),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InputTextField(
                              label: 'Nhập mật khẩu hiện tại',
                              name: '',
                              hinttext: '',
                              isRequired: true,
                              obscureText: true,
                              onChanged: (value) {
                                matKhauHienTai = value;
                              }),
                        ]),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InputTextField(
                            label: 'Nhập mật khẩu mới',
                            name: '',
                            hinttext: '',
                            isRequired: true,
                            onChanged: (value) {
                              matKhauMoi = value;
                            }),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InputTextField(
                            label: 'Nhập lại mật khẩu mới',
                            name: '',
                            hinttext: '',
                            isRequired: true,
                            onChanged: (value) {
                              matKhauMoi2 = value;
                            }),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        try {
                          setState(() {
                            loading = true;
                          });
                          final nguoiDung = nguoiDungProvider.nguoiDung!;
                          if (matKhauHienTai == nguoiDung.matKhau &&
                              matKhauMoi == matKhauMoi2) {
                            nguoiDung.matKhau = matKhauMoi!;
                            await nguoiDungProvider.updTaiKhoan(nguoiDung);

                            ScaffoldMessenger.of(context).showSnackBar(
                                buildSuccessSnackbar(
                                    'Thay đổi mật khẩu thành công!'));
                          } else if (matKhauHienTai != nguoiDung.matKhau) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                buildFailedSnackbar(
                                    'Mật khẩu hiện tại không đúng!'));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                buildFailedSnackbar(
                                    'Mật khẩu mới không khớp!'));
                          }
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              buildFailedSnackbar(
                                  'Thay đổi mật khẩu thất bại!'));
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
                          : const Text('Lưu',
                              style: TextStyle(
                                  fontFamily: 'CeraPro',
                                  color: AppColors.white)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}

List<String> list = ['Nam', 'Nữ'];
