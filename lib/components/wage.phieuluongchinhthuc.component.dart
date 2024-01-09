import 'package:flutter/material.dart';
import 'package:quanlynhanvien/components/content.component.dart';
import 'package:quanlynhanvien/constants/app_colors.dart';
import 'package:quanlynhanvien/models/phieuluonchinhthuc.model.dart';

class WagePhieuLuongChinhThuc extends StatefulWidget {
  final PhieuLuongChinhThuc phieuLuongChinhThuc;
  const WagePhieuLuongChinhThuc({super.key, required this.phieuLuongChinhThuc});

  @override
  State<WagePhieuLuongChinhThuc> createState() => _WageDetailsState();
}

class _WageDetailsState extends State<WagePhieuLuongChinhThuc> {
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
            child: Column(children: [
              Row(
                children: [
                  ContentComponent(
                      title: 'Mã nhân viên: ',
                      content: widget.phieuLuongChinhThuc.maNV),
                  const ContentComponent(
                      title: 'Tên nhân viên: ', content: 'Nguyễn Trung Tính'),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  ContentComponent(
                      title: 'Lương cơ bản: ',
                      content: '${widget.phieuLuongChinhThuc.luongCoBan} VND'),
                  ContentComponent(
                      title: 'Phụ cấp: ',
                      content: '${widget.phieuLuongChinhThuc.phuCap} VND'),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  ContentComponent(
                      title: 'Khen thưởng: ',
                      content: '${widget.phieuLuongChinhThuc.khenThuong} VND'),
                  ContentComponent(
                      title: 'Kỷ luật: ',
                      content: '- ${widget.phieuLuongChinhThuc.kyLuat} VND'),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  ContentComponent(
                      title: 'Tháng: ',
                      content: widget.phieuLuongChinhThuc.thang.toString()),
                  ContentComponent(
                      title: 'Năm: ',
                      content: widget.phieuLuongChinhThuc.nam.toString()),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  ContentComponent(
                      title: 'Số ngày công: ',
                      content:
                          widget.phieuLuongChinhThuc.soNgayCong.toString()),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  ContentComponent(
                      title: 'Lương: ',
                      content: '${widget.phieuLuongChinhThuc.luong} VND')
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
