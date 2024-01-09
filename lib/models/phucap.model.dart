import 'package:cloud_firestore/cloud_firestore.dart';

class PhuCap {
  final String maPC;
  final String maNV;
  final String maLPC;
  final String moTa;
  final int soTien;
  final Timestamp ngayPC;

  PhuCap({
    required this.maPC,
    required this.maNV,
    required this.maLPC,
    required this.moTa,
    required this.soTien,
    required this.ngayPC,
  });

  Map<String, dynamic> toJson() {
    return {
      'maPC': maPC,
      'maNV': maNV,
      'maLPC': maLPC,
      'moTa': moTa,
      'ngayPC': ngayPC,
    };
  }

  factory PhuCap.fromJson(Map<String, dynamic> json) {
    return PhuCap(
      maPC: json['maPC'],
      maNV: json['maNV'],
      soTien: json['soTien'],
      maLPC: json['maLPC'],
      moTa: json['moTa'],
      ngayPC: json['ngayPC'],
    );
  }
}

List<PhuCap> listphuCap = [
  PhuCap(
    maPC: 'PC001',
    maNV: 'NV001',
    maLPC: 'LPC001',
    soTien: 1000000,
    moTa: 'Phụ cấp chức vụ',
    ngayPC: Timestamp.now(),
  ),
  PhuCap(
    maPC: 'PC002',
    maNV: 'NV001',
    maLPC: 'LPC001',
    soTien: 1000000,
    moTa: 'Phụ cấp chức vụ',
    ngayPC: Timestamp.now(),
  ),
  PhuCap(
    maPC: 'PC003',
    maNV: 'NV001',
    soTien: 1000000,
    maLPC: 'LPC001',
    moTa: 'Phụ cấp chức vụ',
    ngayPC: Timestamp.now(),
  ),
];
