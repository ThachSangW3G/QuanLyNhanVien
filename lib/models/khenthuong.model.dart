import 'package:cloud_firestore/cloud_firestore.dart';

class KhenThuong {
  final String maKT;
  final String maNV;
  final String maLKT;
  final String moTa;
  final Timestamp ngayKT;
  final int soTienThuong;

  KhenThuong(
      {required this.maKT,
      required this.maNV,
      required this.maLKT,
      required this.moTa,
      required this.ngayKT,
      required this.soTienThuong});

  factory KhenThuong.fromJson(Map<String, dynamic> json) {
    return KhenThuong(
        maKT: json['maKT'] ?? '',
        maNV: json['maNV'] ?? '',
        maLKT: json['maLKT'] ?? '',
        moTa: json['moTa'] ?? '',
        ngayKT: json['ngayKT'],
        soTienThuong: json['soTienThuong']);
  }

  Map<String, dynamic> toJson() {
    return {
      'maKT': maKT,
      'maNV': maNV,
      'maLKT': maLKT,
      'moTa': moTa,
      'ngayKT': ngayKT,
      'soTienThuong': soTienThuong
    };
  }
}

// List<KhenThuong> listKhenThuong = [
//   KhenThuong(
//       maKT: 'KT001',
//       maNV: 'NV001',
//       maLKT: 'LKT001',
//       moTa: 'Đi làm sớm',
//       ngayKT: Timestamp.fromDate(DateTime.now())),
//   KhenThuong(
//       maKT: 'KT001',
//       maNV: 'NV001',
//       maLKT: 'LKT001',
//       moTa: 'Đi làm sớm',
//       ngayKT: Timestamp.fromDate(DateTime.now())),
//   KhenThuong(
//       maKT: 'KT001',
//       maNV: 'NV001',
//       maLKT: 'LKT001',
//       moTa: 'Đi làm sớm',
//       ngayKT: Timestamp.fromDate(DateTime.now())),
//   KhenThuong(
//       maKT: 'KT001',
//       maNV: 'NV001',
//       maLKT: 'LKT001',
//       moTa: 'Đi làm sớm',
//       ngayKT: Timestamp.fromDate(DateTime.now())),
//   KhenThuong(
//       maKT: 'KT001',
//       maNV: 'NV001',
//       maLKT: 'LKT001',
//       moTa: 'Đi làm sớm',
//       ngayKT: Timestamp.fromDate(DateTime.now())),
//   KhenThuong(
//       maKT: 'KT001',
//       maNV: 'NV001',
//       maLKT: 'LKT001',
//       moTa: 'Đi làm sớm',
//       ngayKT: Timestamp.fromDate(DateTime.now())),
//   KhenThuong(
//       maKT: 'KT001',
//       maNV: 'NV001',
//       maLKT: 'LKT001',
//       moTa: 'Đi làm sớm',
//       ngayKT: Timestamp.fromDate(DateTime.now())),
//   KhenThuong(
//       maKT: 'KT001',
//       maNV: 'NV001',
//       maLKT: 'LKT001',
//       moTa: 'Đi làm sớm',
//       ngayKT: Timestamp.fromDate(DateTime.now())),
//   KhenThuong(
//       maKT: 'KT001',
//       maNV: 'NV001',
//       maLKT: 'LKT001',
//       moTa: 'Đi làm sớm',
//       ngayKT: Timestamp.fromDate(DateTime.now())),
// ];
