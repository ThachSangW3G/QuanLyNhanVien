import 'package:cloud_firestore/cloud_firestore.dart';

class LoaiKhenThuong {
  final String maLKT;
  final String tenLKT;
  final String moTa;
  final int soTienThuong;
  final Timestamp ngayTao;

  LoaiKhenThuong(
      {required this.maLKT,
      required this.moTa,
      required this.tenLKT,
      required this.soTienThuong,
      required this.ngayTao});

  factory LoaiKhenThuong.fromJson(Map<String, dynamic> json) {
    return LoaiKhenThuong(
        maLKT: json['maLKT'] ?? '',
        tenLKT: json['tenLKT'] ?? '',
        moTa: json['moTa'] ?? '',
        ngayTao: json['ngayTao'],
        soTienThuong: json['soTienThuong'] ?? 0);
  }

  Map<String, dynamic> toJson() {
    return {
      'maLKT': maLKT,
      'tenLKT': tenLKT,
      'moTa': moTa,
      'ngayTao': ngayTao,
      'soTienThuong': soTienThuong
    };
  }
}

List<LoaiKhenThuong> listLoaiKT = [
  LoaiKhenThuong(
      maLKT: 'LKT001',
      moTa: 'Quá chời giỏi luông',
      tenLKT: 'Đi làm đúng giờ',
      soTienThuong: 200000,
      ngayTao: Timestamp.fromDate(DateTime.now())),
  LoaiKhenThuong(
      maLKT: 'LKT001',
      moTa: 'Quá chời giỏi luông',
      tenLKT: 'Đi làm đúng giờ',
      soTienThuong: 200000,
      ngayTao: Timestamp.fromDate(DateTime.now())),
  LoaiKhenThuong(
      maLKT: 'LKT001',
      moTa: 'Quá chời giỏi luông',
      tenLKT: 'Đi làm đúng giờ',
      soTienThuong: 200000,
      ngayTao: Timestamp.fromDate(DateTime.now())),
  LoaiKhenThuong(
      maLKT: 'LKT001',
      moTa: 'Quá chời giỏi luông',
      tenLKT: 'Đi làm đúng giờ',
      soTienThuong: 200000,
      ngayTao: Timestamp.fromDate(DateTime.now())),
  LoaiKhenThuong(
      maLKT: 'LKT001',
      moTa: 'Quá chời giỏi luông',
      tenLKT: 'Đi làm đúng giờ',
      soTienThuong: 200000,
      ngayTao: Timestamp.fromDate(DateTime.now())),
  LoaiKhenThuong(
      maLKT: 'LKT001',
      moTa: 'Quá chời giỏi luông',
      tenLKT: 'Đi làm đúng giờ',
      soTienThuong: 200000,
      ngayTao: Timestamp.fromDate(DateTime.now())),
  LoaiKhenThuong(
      maLKT: 'LKT001',
      moTa: 'Quá chời giỏi luông',
      tenLKT: 'Đi làm đúng giờ',
      soTienThuong: 200000,
      ngayTao: Timestamp.fromDate(DateTime.now())),
  LoaiKhenThuong(
      maLKT: 'LKT001',
      moTa: 'Quá chời giỏi luông',
      tenLKT: 'Đi làm đúng giờ',
      soTienThuong: 200000,
      ngayTao: Timestamp.fromDate(DateTime.now())),
];
