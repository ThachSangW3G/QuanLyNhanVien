import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quanlynhanvien/components/failed_snackbar.dart';
import 'package:quanlynhanvien/components/input.text.multiline.component.dart';
import 'package:quanlynhanvien/components/input.time.component.dart';
import 'package:quanlynhanvien/components/success_snackbar.dart';
import 'package:quanlynhanvien/constants/app_colors.dart';
import 'package:quanlynhanvien/models/yeucaunghiphep.model.dart';
import 'package:quanlynhanvien/providers/nguoidung.provider.dart';
import 'package:quanlynhanvien/providers/yeucaunghiphep.provider.dart';
import 'package:quanlynhanvien/services/getlastthreechar.dart';

class RequestRestCompnonet extends StatefulWidget {
  const RequestRestCompnonet({super.key});

  @override
  State<RequestRestCompnonet> createState() => _AddPhongBanState();
}

class _AddPhongBanState extends State<RequestRestCompnonet> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    final nguoiDungProvider = Provider.of<NguoiDungProvider>(context);
    final yeuCauNghiPhepProvider = Provider.of<YeuCauNghiPhepProvider>(context);
    DateTime? ngayBatDau;
    DateTime? ngayKetThuc;
    String? lyDo;

    return AlertDialog(
      title: const Text(
        'Yêu Cầu Nghĩ Phép',
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
                  InputTimePicker(
                      label: 'Ngày bắt đầu',
                      name: '',
                      hinttext: 'DD/MM/YYYY',
                      onChanged: (value) {
                        ngayBatDau = value;
                      }),
                  const SizedBox(
                    width: 45,
                  ),
                  InputTimePicker(
                      label: 'Ngày kết thúc',
                      name: '',
                      hinttext: 'DD/MM/YYYY',
                      onChanged: (value) {
                        ngayKetThuc = value;
                      }),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InputTextMultiline(
                      label: 'Lý do',
                      name: '',
                      hinttext: '',
                      onChanged: (value) {
                        lyDo = value;
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
              setState(() {
                loading = true;
              });
              YeuCauNghiPhep? lastYeuCauNghiPhep =
                  await yeuCauNghiPhepProvider.getLastYeuCauNghiPhep();

              int soThuTu = lastYeuCauNghiPhep != null
                  ? getLastThreeCharsAsInteger(lastYeuCauNghiPhep.maYCNP) + 1
                  : 0;

              String maYCNP = 'YCNP' + soThuTu.toString().padLeft(3, '0');

              final yeuCauNghiPhep = YeuCauNghiPhep(
                  maYCNP: maYCNP,
                  maNV: nguoiDungProvider.nguoiDung!.maNV,
                  ngayBatDau: Timestamp.fromDate(ngayBatDau!),
                  ngayKetThuc: Timestamp.fromDate(ngayKetThuc!),
                  lyDo: lyDo!,
                  ngayDuyet: null,
                  nguoiDuyet: null,
                  trangThai: 'Đã gửi');

              await yeuCauNghiPhepProvider.addYeuCauNghiPhep(yeuCauNghiPhep);

              ScaffoldMessenger.of(context).showSnackBar(
                  buildSuccessSnackbar('Thêm yêu cầu nghỉ phép thành công!'));
            } catch (e) {
              print(e);
              ScaffoldMessenger.of(context).showSnackBar(
                  buildFailedSnackbar('Thêm yêu cầu nghỉ phép thất bại!'));
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
