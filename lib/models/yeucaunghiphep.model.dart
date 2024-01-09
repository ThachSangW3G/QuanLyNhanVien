import 'package:cloud_firestore/cloud_firestore.dart';

class YeuCauNghiPhep {
  final String maYCNP;
  final String maNV;
  final Timestamp ngayBatDau;
  final Timestamp ngayKetThuc;
  final String lyDo;
  String trangThai;
  Timestamp ngayDuyet;
  String nguoiDuyet;

  YeuCauNghiPhep(
      {required this.maYCNP,
      required this.maNV,
      required this.ngayBatDau,
      required this.ngayKetThuc,
      required this.lyDo,
      required this.ngayDuyet,
      required this.nguoiDuyet,
      required this.trangThai});

  factory YeuCauNghiPhep.fromJson(Map<String, dynamic> json) {
    return YeuCauNghiPhep(
        maYCNP: json['maYCNP'] ?? '',
        maNV: json['maNV'] ?? '',
        ngayBatDau: json['ngayBatDau'],
        ngayKetThuc: json['ngayKetThuc'],
        ngayDuyet: json['ngayDuyet'],
        nguoiDuyet: json['nguoiDuyet'],
        lyDo: json['lyDo'] ?? '',
        trangThai: json['trangThai'] ?? '');
  }

  Map<String, dynamic> toJson() {
    return {
      'maYCNP': maYCNP,
      'maNV': maNV,
      'ngayBatDau': ngayBatDau,
      'ngayKetThuc': ngayKetThuc,
      'lyDo': lyDo,
      'nguoiDuyet': nguoiDuyet,
      'ngayDuyet': ngayDuyet,
      'trangThai': trangThai
    };
  }
}

List<YeuCauNghiPhep> listYeuCauNghiPhep = [
  YeuCauNghiPhep(
    maYCNP: 'YCPN001',
    maNV: "NV001",
    ngayBatDau: Timestamp.fromDate(DateTime(2024, 1, 8)),
    ngayKetThuc: Timestamp.fromDate(DateTime(2024, 1, 10)),
    ngayDuyet: Timestamp.fromDate(DateTime(2024, 1, 10)),
    nguoiDuyet: 'NV003',
    lyDo: "Nghỉ phép đi công tác",
    trangThai: "Chờ duyệt",
  ),
  YeuCauNghiPhep(
    maYCNP: 'YCPN001',
    maNV: "NV002",
    ngayBatDau: Timestamp.fromDate(DateTime(2024, 1, 9)),
    ngayKetThuc: Timestamp.fromDate(DateTime(2024, 1, 12)),
    ngayDuyet: Timestamp.fromDate(DateTime(2024, 1, 10)),
    nguoiDuyet: 'NV003',
    lyDo: "Nghỉ phép nghỉ lễ",
    trangThai: "Không được duyệt",
  ),
  YeuCauNghiPhep(
    maYCNP: 'YCPN001',
    maNV: "NV003",
    ngayBatDau: Timestamp.fromDate(DateTime(2024, 1, 8)),
    ngayKetThuc: Timestamp.fromDate(DateTime(2024, 1, 10)),
    ngayDuyet: Timestamp.fromDate(DateTime(2024, 1, 10)),
    nguoiDuyet: 'NV003',
    lyDo: "Nghỉ phép đi công tác",
    trangThai: "Chờ duyệt",
  ),
  YeuCauNghiPhep(
    maYCNP: 'YCPN001',
    maNV: "NV004",
    ngayBatDau: Timestamp.fromDate(DateTime(2024, 1, 9)),
    ngayKetThuc: Timestamp.fromDate(DateTime(2024, 1, 12)),
    ngayDuyet: Timestamp.fromDate(DateTime(2024, 1, 10)),
    nguoiDuyet: 'NV003',
    lyDo: "Nghỉ phép nghỉ lễ",
    trangThai: "Đã duyệt",
  )
];
