import 'package:flutter/material.dart';
import 'package:quanlynhanvien/components/content.component.dart';
import 'package:quanlynhanvien/constants/app_colors.dart';
import 'package:quanlynhanvien/models/bangluong.model.dart';

class WageDetails extends StatefulWidget {
  final BangLuong bangLuong;
  const WageDetails({super.key, required this.bangLuong});

  @override
  State<WageDetails> createState() => _WageDetailsState();
}

class _WageDetailsState extends State<WageDetails> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Chi tiết phiếu lương',
        style: TextStyle(
          fontFamily: 'CeraPro',
        ),
      ),
      content: Column(
        children: [
          Container(
            width: 900,
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: AppColors.greyShuttle),
                borderRadius: BorderRadius.circular(15)),
            padding: const EdgeInsets.all(30),
            child: const Column(children: [
              Row(
                children: [
                  ContentComponent(title: 'Mã nhân viên: ', content: 'NV001'),
                  ContentComponent(
                      title: 'Tên nhân viên: ', content: 'Nguyễn Trung Tính'),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  ContentComponent(title: 'Chức vụ: ', content: 'Trưởng phòng'),
                  ContentComponent(title: 'Phòng ban: ', content: 'Marketing'),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  ContentComponent(
                      title: 'Lương cơ bản: ', content: '3000000 ' 'VND'),
                  ContentComponent(title: 'Phụ cấp: ', content: '100000' 'VND'),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  ContentComponent(
                      title: 'Khen thưởng: ', content: '30000' 'VND'),
                  ContentComponent(
                      title: 'Kỷ luật: ', content: '-100000' 'VND'),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  ContentComponent(title: 'Tháng: ', content: '1'),
                  ContentComponent(title: 'Năm: ', content: '2024'),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  ContentComponent(title: 'Số ngày công: ', content: '1'),
                  ContentComponent(title: 'Số ngày nghĩ: ', content: '2024'),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  ContentComponent(
                      title: 'Thuế thu nhập cá nhân: ', content: '10000' 'VND'),
                  ContentComponent(title: 'Lương: ', content: '40000000' 'VND')
                ],
              ),
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
          child: const Text('Thoát',
              style: TextStyle(fontFamily: 'CeraPro', color: AppColors.white)),
        ),
      ],
    );
  }
}
