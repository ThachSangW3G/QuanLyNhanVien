import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quanlynhanvien/components/failed_snackbar.dart';
import 'package:quanlynhanvien/components/input.number.component.dart';
import 'package:quanlynhanvien/components/input.select.component.dart';
import 'package:quanlynhanvien/components/input.text.multiline.component.dart';
import 'package:quanlynhanvien/components/input.time.component.dart';
import 'package:quanlynhanvien/components/success_snackbar.dart';
import 'package:quanlynhanvien/constants/app_colors.dart';
import 'package:quanlynhanvien/models/nhanvien.model.dart';
import 'package:quanlynhanvien/models/phucap.model.dart';
import 'package:quanlynhanvien/providers/nhanvien.provider.dart';
import 'package:quanlynhanvien/providers/phieuluong.provider.dart';
import 'package:quanlynhanvien/providers/phucap.provider.dart';
import 'package:quanlynhanvien/services/getlastthreechar.dart';

class AddAllowanceComponent extends StatefulWidget {
  const AddAllowanceComponent({super.key});

  @override
  State<AddAllowanceComponent> createState() => _AddAllowanceComponentState();
}

class _AddAllowanceComponentState extends State<AddAllowanceComponent> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    String? maNV;
    String? maPV;
    int? soTien;
    String? moTa;
    DateTime? ngayPC;
    final nhanVienProvider = Provider.of<NhanVienProvider>(context);
    final phuCapProvider = Provider.of<PhuCapProvider>(context);
    final phieuLuongProvider = Provider.of<PhieuLuongProvider>(context);
    return AlertDialog(
      title: const Text(
        'Thêm phụ cấp',
        style: TextStyle(fontFamily: 'CeraPro'),
      ),
      content: Column(children: [
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
          child: Column(
            children: [
              Row(children: [
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
                            hinttext: '--Chọn nhân viên--');
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
                  width: 15,
                ),
                InputNumberField(
                    label: 'Số tiền',
                    name: '',
                    hinttext: '',
                    onChanged: (value) {
                      soTien = int.tryParse(value);
                    })
              ]),
              const SizedBox(
                height: 45,
              ),
              Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                InputTimePicker(
                    label: 'Ngày phụ cấp',
                    name: '',
                    hinttext: '',
                    onChanged: (value) {
                      ngayPC = value;
                    }),
                const SizedBox(
                  width: 15,
                ),
                InputTextMultiline(
                    label: 'Mô tả',
                    name: '',
                    hinttext: '',
                    onChanged: (value) {
                      moTa = value;
                    })
              ]),
            ],
          ),
        )
      ]),
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
              PhuCap? lastPhuCap = await phuCapProvider.getLastPhuCap();

              int soThuTu = lastPhuCap != null
                  ? getLastThreeCharsAsInteger(lastPhuCap.maPC) + 1
                  : 0;

              String maPC = 'PC' + soThuTu.toString().padLeft(3, '0');

              final phuCap = PhuCap(
                  maPC: maPC,
                  maNV: maNV!,
                  soTien: soTien!,
                  moTa: moTa!,
                  ngayPC: Timestamp.fromDate(ngayPC!));

              await phuCapProvider.addPhuCap(phuCap);

              final phieuLuong = await phieuLuongProvider
                  .getPhieuLuong('PL${ngayPC!.month}-${ngayPC!.year}-${maNV}');

              phieuLuong.phuCap += soTien!;

              await phieuLuongProvider.updPhieuLuong(phieuLuong);

              ScaffoldMessenger.of(context).showSnackBar(
                  buildSuccessSnackbar('Thêm phụ cấp thành công!'));
            } catch (e) {
              print(e);
              ScaffoldMessenger.of(context)
                  .showSnackBar(buildFailedSnackbar('Thêm phụ cấp thất bại!'));
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
