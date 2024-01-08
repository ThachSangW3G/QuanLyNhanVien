import 'package:cloud_firestore/cloud_firestore.dart';

class PhongBan {
  final String maPB;
  final String tenPB;
  final Timestamp ngayThanhLap;
  final String moTa;

  PhongBan(
      {required this.maPB,
      required this.tenPB,
      required this.ngayThanhLap,
      required this.moTa});

  factory PhongBan.fromJson(Map<String, dynamic> json) {
    return PhongBan(
        maPB: json['maPB'] ?? '',
        tenPB: json['tenPB'] ?? '',
        ngayThanhLap: json['ngayThanhLap'],
        moTa: json['moTa'] ?? '');
  }

  Map<String, dynamic> toJson() {
    return {
      'maPB': maPB,
      'tenPB': tenPB,
      'ngayThanhLap': ngayThanhLap,
      'moTa': moTa
    };
  }
}

List<PhongBan> listPB = [
  // PhongBan(
  //     maPB: 'PB001',
  //     tenPB: 'Tài chính',
  //     ngayThanhLap: Timestamp.fromDate(DateTime.now())),
  // PhongBan(
  //     maPB: 'PB001',
  //     tenPB: 'Tài chính',
  //     ngayThanhLap: Timestamp.fromDate(DateTime.now())),
  // PhongBan(
  //     maPB: 'PB001',
  //     tenPB: 'Tài chính',
  //     ngayThanhLap: Timestamp.fromDate(DateTime.now())),
  // PhongBan(
  //     maPB: 'PB001',
  //     tenPB: 'Tài chính',
  //     ngayThanhLap: Timestamp.fromDate(DateTime.now())),
  // PhongBan(
  //     maPB: 'PB001',
  //     tenPB: 'Tài chính',
  //     ngayThanhLap: Timestamp.fromDate(DateTime.now())),
  // PhongBan(
  //     maPB: 'PB001',
  //     tenPB: 'Tài chính',
  //     ngayThanhLap: Timestamp.fromDate(DateTime.now())),
  // PhongBan(
  //     maPB: 'PB001',
  //     tenPB: 'Tài chính',
  //     ngayThanhLap: Timestamp.fromDate(DateTime.now())),
  // PhongBan(
  //     maPB: 'PB001',
  //     tenPB: 'Tài chính',
  //     ngayThanhLap: Timestamp.fromDate(DateTime.now())),
  // PhongBan(
  //     maPB: 'PB001',
  //     tenPB: 'Tài chính',
  //     ngayThanhLap: Timestamp.fromDate(DateTime.now())),
];
