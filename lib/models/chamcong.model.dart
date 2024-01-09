import 'package:cloud_firestore/cloud_firestore.dart';

class ChamCong {
  final String maCC;
  final String maNV;
  final Timestamp ngayCC;
  final Timestamp timeVao;
  final Timestamp timeVaoTT;
  final Timestamp timeRa;
  final Timestamp timeRaTT;
  final String status;

  ChamCong(
      {required this.maCC,
      required this.maNV,
      required this.ngayCC,
      required this.timeVao,
      required this.timeVaoTT,
      required this.timeRa,
      required this.timeRaTT,
      required this.status});

  Map<String, dynamic> toJson() {
    return {
      'maCC': maCC,
      'maNV': maNV,
      'ngayCC': ngayCC,
      'timeVao': timeVao,
      'timeVaoTT': timeVaoTT,
      'timeRa': timeRa,
      'timeRaTT': timeRaTT,
      'status': status
    };
  }

  factory ChamCong.fromJson(Map<String, dynamic> json) {
    return ChamCong(
        maCC: json['maCC'] ?? '',
        maNV: json['maNV'] ?? '',
        ngayCC: json['ngayCC'] ?? '',
        timeVao: json['timeVao'] ?? '',
        timeVaoTT: json['timeVaoTT'] ?? '',
        timeRa: json['timeRa'] ?? '',
        timeRaTT: json['timeRaTT'] ?? '',
        status: json['status'] ?? '');
  }
}

List<ChamCong> listChamCong = [
  ChamCong(
      maCC: 'CC001',
      maNV: 'NV001',
      ngayCC: Timestamp.now(),
      timeVao: Timestamp.now(),
      timeVaoTT: Timestamp.now(),
      timeRa: Timestamp.now(),
      timeRaTT: Timestamp.now(),
      status: 'Trễ'),
  ChamCong(
      maCC: 'CC002',
      maNV: 'NV002',
      ngayCC: Timestamp.now(),
      timeVao: Timestamp.now(),
      timeVaoTT: Timestamp.now(),
      timeRa: Timestamp.now(),
      timeRaTT: Timestamp.now(),
      status: 'Đúng giờ'),
  ChamCong(
      maCC: 'CC003',
      maNV: 'NV003',
      ngayCC: Timestamp.now(),
      timeVao: Timestamp.now(),
      timeVaoTT: Timestamp.now(),
      timeRa: Timestamp.now(),
      timeRaTT: Timestamp.now(),
      status: 'Trễ'),
  ChamCong(
      maCC: 'CC004',
      maNV: 'NV004',
      ngayCC: Timestamp.now(),
      timeVao: Timestamp.now(),
      timeVaoTT: Timestamp.now(),
      timeRa: Timestamp.now(),
      timeRaTT: Timestamp.now(),
      status: 'Trễ'),
];
