import 'package:cloud_firestore/cloud_firestore.dart';

class KhenThuong {
  final String maKT;
  final String maNV;
  final String tenNV;
  final String maLKT;
  final String moTa;
  final Timestamp ngayKT;

  KhenThuong(
      {required this.maKT,
      required this.maNV,
      required this.maLKT,
      required this.tenNV,
      required this.moTa,
      required this.ngayKT});

  factory KhenThuong.fromJson(Map<String, dynamic> json) {
    return KhenThuong(
        maKT: json['maKT'] ?? '',
        maNV: json['maNV'] ?? '',
        maLKT: json['maLKT'] ?? '',
        tenNV: json['tenNV'] ?? ' ',
        moTa: json['moTa'] ?? '',
        ngayKT: json['ngayKT']);
  }

  Map<String, dynamic> toJson() {
    return {
      'maKT': maKT,
      'maNV': maNV,
      'maLKT': maLKT,
      'moTa': moTa,
      'ngayKT': ngayKT
    };
  }
}

List<KhenThuong> listKhenThuong = [
  KhenThuong(
      maKT: 'KT001',
      maNV: 'NV001',
      maLKT: 'LKT001',
      tenNV: 'Nguyen Trung Tinh',
      moTa: 'Đi làm sớm',
      ngayKT: Timestamp.fromDate(DateTime.now())),
  KhenThuong(
      maKT: 'KT001',
      maNV: 'NV001',
      tenNV: 'Nguyen Trung Tinh',
      maLKT: 'LKT001',
      moTa: 'Đi làm sớm',
      ngayKT: Timestamp.fromDate(DateTime.now())),
  KhenThuong(
      maKT: 'KT001',
      maNV: 'NV001',
      maLKT: 'LKT001',
      tenNV: 'Nguyen Trung Tinh',
      moTa: 'Đi làm sớm',
      ngayKT: Timestamp.fromDate(DateTime.now())),
  KhenThuong(
      maKT: 'KT001',
      maNV: 'NV001',
      tenNV: 'Nguyen Trung Tinh',
      maLKT: 'LKT001',
      moTa: 'Đi làm sớm',
      ngayKT: Timestamp.fromDate(DateTime.now())),
  KhenThuong(
      maKT: 'KT001',
      maNV: 'NV001',
      maLKT: 'LKT001',
      tenNV: 'Nguyen Trung Tinh',
      moTa: 'Đi làm sớm',
      ngayKT: Timestamp.fromDate(DateTime.now())),
  KhenThuong(
      maKT: 'KT001',
      maNV: 'NV001',
      maLKT: 'LKT001',
      tenNV: 'Nguyen Trung Tinh',
      moTa: 'Đi làm sớm',
      ngayKT: Timestamp.fromDate(DateTime.now())),
  KhenThuong(
      maKT: 'KT001',
      maNV: 'NV001',
      tenNV: 'Nguyen Trung Tinh',
      maLKT: 'LKT001',
      moTa: 'Đi làm sớm',
      ngayKT: Timestamp.fromDate(DateTime.now())),
  KhenThuong(
      maKT: 'KT001',
      maNV: 'NV001',
      tenNV: 'Nguyen Trung Tinh',
      maLKT: 'LKT001',
      moTa: 'Đi làm sớm',
      ngayKT: Timestamp.fromDate(DateTime.now())),
  KhenThuong(
      maKT: 'KT001',
      tenNV: 'Nguyen Trung Tinh',
      maNV: 'NV001',
      maLKT: 'LKT001',
      moTa: 'Đi làm sớm',
      ngayKT: Timestamp.fromDate(DateTime.now())),
];
