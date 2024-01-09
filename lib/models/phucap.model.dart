import 'package:cloud_firestore/cloud_firestore.dart';

class PhuCap {
  final String maPC;
  final String maNV;
  final String moTa;
  final int soTien;
  final Timestamp ngayPC;

  PhuCap({
    required this.maPC,
    required this.maNV,
    required this.moTa,
    required this.soTien,
    required this.ngayPC,
  });

  Map<String, dynamic> toJson() {
    return {
      'maPC': maPC,
      'maNV': maNV,
      'moTa': moTa,
      'ngayPC': ngayPC,
      'soTien': soTien
    };
  }

  factory PhuCap.fromJson(Map<String, dynamic> json) {
    return PhuCap(
      maPC: json['maPC'],
      maNV: json['maNV'],
      soTien: json['soTien'],
      moTa: json['moTa'],
      ngayPC: json['ngayPC'],
    );
  }
}

List<PhuCap> listphuCap = [
  PhuCap(
    maPC: 'PC001',
    maNV: 'NV001',
    soTien: 1000000,
    moTa: 'Phụ cấp chức vụ',
    ngayPC: Timestamp.now(),
  ),
  PhuCap(
    maPC: 'PC002',
    maNV: 'NV001',
    soTien: 1000000,
    moTa: 'Phụ cấp chức vụ',
    ngayPC: Timestamp.now(),
  ),
  PhuCap(
    maPC: 'PC003',
    maNV: 'NV001',
    soTien: 1000000,
    moTa: 'Phụ cấp chức vụ',
    ngayPC: Timestamp.now(),
  ),
];
