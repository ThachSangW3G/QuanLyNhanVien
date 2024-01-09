import 'package:cloud_firestore/cloud_firestore.dart';

class KyLuat {
  final String maKL;
  final String maNV;
  final String maLKL;
  final String moTa;
  final Timestamp ngayKL;

  KyLuat(
      {required this.maKL,
      required this.maNV,
      required this.maLKL,
      required this.moTa,
      required this.ngayKL});

  factory KyLuat.fromJson(Map<String, dynamic> json) {
    return KyLuat(
        maKL: json['maKL'] ?? '',
        maNV: json['maNV'] ?? '',
        maLKL: json['maLKL'] ?? '',
        moTa: json['moTa'] ?? '',
        ngayKL: json['ngayKL']);
  }
  Map<String, dynamic> toJson() {
    return {
      'maKL': maKL,
      'maNV': maNV,
      'maLKL': maLKL,
      'moTa': moTa,
      'ngayKL': ngayKL
    };
  }
}

List<KyLuat> danhSachKyLuat = [
  KyLuat(
    maKL: 'KL001',
    maNV: 'NV001',
    maLKL: 'LKL001',
    moTa: 'Lỗi vi phạm nội quy công ty',
    ngayKL: Timestamp.fromDate(DateTime(2022, 5, 15)),
  ),
  KyLuat(
    maKL: 'KL002',
    maNV: 'NV002',
    maLKL: 'LKL002',
    moTa: 'Thái độ làm việc không tốt',
    ngayKL: Timestamp.fromDate(DateTime(2022, 7, 20)),
  ),
  KyLuat(
    maKL: 'KL003',
    maNV: 'NV003',
    maLKL: 'LKL001',
    moTa: 'Lỗi vi phạm nội quy công ty',
    ngayKL: Timestamp.fromDate(DateTime(2023, 2, 10)),
  ),
  // Thêm các phần tử khác vào đây
];
