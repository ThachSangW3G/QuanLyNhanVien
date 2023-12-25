import 'package:cloud_firestore/cloud_firestore.dart';

class PhongBan {
  final String maPB;
  final String tenPB;
  final Timestamp ngayThanhLap;

  PhongBan(
      {required this.maPB, required this.tenPB, required this.ngayThanhLap});

  factory PhongBan.fromJson(Map<String, dynamic> json) {
    return PhongBan(
        maPB: json['maPB'] ?? '',
        tenPB: json['tenPB'] ?? '',
        ngayThanhLap: json['ngayThanhLap']);
  }

  Map<String, dynamic> toJson() {
    return {'maPB': maPB, 'tenPB': tenPB, 'ngayThanhLap': ngayThanhLap};
  }
}
