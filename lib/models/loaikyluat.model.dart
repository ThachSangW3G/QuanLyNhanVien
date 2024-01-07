import 'package:cloud_firestore/cloud_firestore.dart';

class LoaiKyLuat {
  final String maLKL;
  final String tenLKL;
  final String moTa;
  final int soTienPhat;
  final Timestamp ngayTao;

  LoaiKyLuat(
      {required this.maLKL,
      required this.moTa,
      required this.tenLKL,
      required this.soTienPhat,
      required this.ngayTao});

  factory LoaiKyLuat.fromJson(Map<String, dynamic> json) {
    return LoaiKyLuat(
        maLKL: json['maLKL'] ?? '',
        tenLKL: json['tenLKL'] ?? '',
        moTa: json['moTa'] ?? '',
        ngayTao: json['ngayTao'],
        soTienPhat: json['soTienPhat'] ?? 0);
  }

  Map<String, dynamic> toJson() {
    return {
      'maLKT': maLKL,
      'tenLKT': tenLKL,
      'moTa': moTa,
      'ngayTao': ngayTao,
      'soTienThuong': soTienPhat
    };
  }
}

List<LoaiKyLuat> danhSachLoaiKyLuat = [
  LoaiKyLuat(
    maLKL: 'LKL001',
    tenLKL: 'Kỷ luật nhẹ',
    moTa: 'Các lỗi nhẹ không gây hậu quả nghiêm trọng',
    soTienPhat: 500000,
    ngayTao: Timestamp.fromDate(DateTime(2022, 1, 1)),
  ),
  LoaiKyLuat(
    maLKL: 'LKL002',
    tenLKL: 'Kỷ luật trung bình',
    moTa: 'Các lỗi trung bình gây ảnh hưởng đến công việc',
    soTienPhat: 1000000,
    ngayTao: Timestamp.fromDate(DateTime(2022, 1, 1)),
  ),
  LoaiKyLuat(
    maLKL: 'LKL003',
    tenLKL: 'Kỷ luật nghiêm trọng',
    moTa: 'Các lỗi nghiêm trọng ảnh hưởng đến uy tín công ty',
    soTienPhat: 2000000,
    ngayTao: Timestamp.fromDate(DateTime(2022, 1, 1)),
  ),
  // Thêm các phần tử khác vào đây
];
