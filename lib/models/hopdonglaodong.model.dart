import 'package:cloud_firestore/cloud_firestore.dart';

class HopDongLaoDong {
  final String maHD;
  final String maNV;
  final Timestamp ngayBatDau;
  final Timestamp ngayKetThuc;
  final int luongCoBan;

  HopDongLaoDong(
      {required this.maHD,
      required this.maNV,
      required this.ngayBatDau,
      required this.ngayKetThuc,
      required this.luongCoBan});

  factory HopDongLaoDong.fromJson(Map<String, dynamic> json) {
    return HopDongLaoDong(
        maHD: json['maHD'] ?? '',
        maNV: json['maNV'] ?? '',
        ngayBatDau: json['ngayBatDau'],
        ngayKetThuc: json['ngayKetThuc'],
        luongCoBan: json['luongCoBan'] ?? 0);
  }

  Map<String, dynamic> toJson() {
    return {
      'maHD': maHD,
      'maNV': maNV,
      'ngayBatDau': ngayBatDau,
      'ngayKetThuc': ngayKetThuc,
      'luongCoBan': luongCoBan
    };
  }
}

List<HopDongLaoDong> listHDLD = [
  HopDongLaoDong(
      maHD: 'HD001',
      maNV: 'NV001',
      ngayBatDau: Timestamp.fromDate(DateTime.now()),
      ngayKetThuc: Timestamp.fromDate(DateTime.now()),
      luongCoBan: 5000000),
  HopDongLaoDong(
      maHD: 'HD001',
      maNV: 'NV001',
      ngayBatDau: Timestamp.fromDate(DateTime.now()),
      ngayKetThuc: Timestamp.fromDate(DateTime.now()),
      luongCoBan: 5000000),
  HopDongLaoDong(
      maHD: 'HD001',
      maNV: 'NV001',
      ngayBatDau: Timestamp.fromDate(DateTime.now()),
      ngayKetThuc: Timestamp.fromDate(DateTime.now()),
      luongCoBan: 5000000),
  HopDongLaoDong(
      maHD: 'HD001',
      maNV: 'NV001',
      ngayBatDau: Timestamp.fromDate(DateTime.now()),
      ngayKetThuc: Timestamp.fromDate(DateTime.now()),
      luongCoBan: 5000000),
  HopDongLaoDong(
      maHD: 'HD001',
      maNV: 'NV001',
      ngayBatDau: Timestamp.fromDate(DateTime.now()),
      ngayKetThuc: Timestamp.fromDate(DateTime.now()),
      luongCoBan: 5000000),
  HopDongLaoDong(
      maHD: 'HD001',
      maNV: 'NV001',
      ngayBatDau: Timestamp.fromDate(DateTime.now()),
      ngayKetThuc: Timestamp.fromDate(DateTime.now()),
      luongCoBan: 5000000),
];
