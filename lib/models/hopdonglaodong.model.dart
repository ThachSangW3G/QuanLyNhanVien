import 'package:cloud_firestore/cloud_firestore.dart';

class HopDongLaoDong {
  final String maHD;
  final String maNV;
  final Timestamp ngayBatDau;
  final Timestamp ngayKetThuc;
  final double heSoLuong;
  final int luongCoBan;

  HopDongLaoDong(
      {required this.maHD,
      required this.maNV,
      required this.ngayBatDau,
      required this.ngayKetThuc,
      required this.luongCoBan,
      required this.heSoLuong});

  factory HopDongLaoDong.fromJson(Map<String, dynamic> json) {
    return HopDongLaoDong(
        maHD: json['maHD'] ?? '',
        maNV: json['maNV'] ?? '',
        ngayBatDau: json['ngayBatDau'],
        ngayKetThuc: json['ngayKetThuc'],
        luongCoBan: json['luongCoBan'] ?? 0,
        heSoLuong: json['heSoLuong'] ?? 1);
  }

  Map<String, dynamic> toJson() {
    return {
      'maHD': maHD,
      'maNV': maNV,
      'ngayBatDau': ngayBatDau,
      'ngayKetThuc': ngayKetThuc,
      'luongCoBan': luongCoBan,
      'heSoLuong': heSoLuong
    };
  }
}

List<HopDongLaoDong> listHDLD = [
  HopDongLaoDong(
      maHD: 'HD001',
      maNV: 'NV001',
      ngayBatDau: Timestamp.fromDate(DateTime.now()),
      ngayKetThuc: Timestamp.fromDate(DateTime.now()),
      luongCoBan: 5000000,
      heSoLuong: 2),
  HopDongLaoDong(
      maHD: 'HD001',
      maNV: 'NV001',
      heSoLuong: 2,
      ngayBatDau: Timestamp.fromDate(DateTime.now()),
      ngayKetThuc: Timestamp.fromDate(DateTime.now()),
      luongCoBan: 5000000),
  HopDongLaoDong(
      maHD: 'HD001',
      maNV: 'NV001',
      heSoLuong: 2,
      ngayBatDau: Timestamp.fromDate(DateTime.now()),
      ngayKetThuc: Timestamp.fromDate(DateTime.now()),
      luongCoBan: 5000000),
  HopDongLaoDong(
      maHD: 'HD001',
      heSoLuong: 2,
      maNV: 'NV001',
      ngayBatDau: Timestamp.fromDate(DateTime.now()),
      ngayKetThuc: Timestamp.fromDate(DateTime.now()),
      luongCoBan: 5000000),
  HopDongLaoDong(
      maHD: 'HD001',
      maNV: 'NV001',
      heSoLuong: 2,
      ngayBatDau: Timestamp.fromDate(DateTime.now()),
      ngayKetThuc: Timestamp.fromDate(DateTime.now()),
      luongCoBan: 5000000),
  HopDongLaoDong(
      maHD: 'HD001',
      maNV: 'NV001',
      heSoLuong: 2,
      ngayBatDau: Timestamp.fromDate(DateTime.now()),
      ngayKetThuc: Timestamp.fromDate(DateTime.now()),
      luongCoBan: 5000000),
];
