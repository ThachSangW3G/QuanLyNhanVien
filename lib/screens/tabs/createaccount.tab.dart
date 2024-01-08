import 'package:flutter/material.dart';
import 'package:quanlynhanvien/components/input.select.component.dart';
import 'package:quanlynhanvien/components/input.text.component.dart';
import 'package:quanlynhanvien/constants/app_colors.dart';

class CreateAccountTab extends StatelessWidget {
  const CreateAccountTab({super.key});

  @override
  Widget build(BuildContext context) {
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
                'Thêm tài khoản',
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
                            onChanged: (value) {}),
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
                    const SizedBox(
                      height: 25,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.bluedarkColor,
                      ),
                      child: const Text('Tạo Tài Khoản',
                          style: TextStyle(
                              fontFamily: 'CeraPro', color: AppColors.white)),
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

List<String> listNV = ['NV001', 'NV002'];
