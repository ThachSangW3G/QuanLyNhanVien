import 'package:cloud_firestore/cloud_firestore.dart';

class YeuCauNghiPhep {
  final String maNV;
  final Timestamp ngayBatDau;
  final Timestamp ngayKetThuc;
  final String lyDo;
  final String trangThai;

  YeuCauNghiPhep(
      {required this.maNV,
      required this.ngayBatDau,
      required this.ngayKetThuc,
      required this.lyDo,
      required this.trangThai});

  factory YeuCauNghiPhep.fromJson(Map<String, dynamic> json) {
    return YeuCauNghiPhep(
        maNV: json['maNV'] ?? '',
        ngayBatDau: json['ngayBatDau'] ?? '',
        ngayKetThuc: json['ngayKetThuc'] ?? '',
        lyDo: json['lyDo'] ?? '',
        trangThai: json['trangThai'] ?? '');
  }

  Map<String, dynamic> toJson() {
    return {
      'maNV': maNV,
      'ngayBatDau': ngayBatDau,
      'ngayKetThuc': ngayKetThuc,
      'lyDo': lyDo,
      'trangThai': trangThai
    };
  }
}

List<YeuCauNghiPhep> listYeuCauNghiPhep = [
  YeuCauNghiPhep(
    maNV: "NV001",
    ngayBatDau: Timestamp.fromDate(DateTime(2024, 1, 8)),
    ngayKetThuc: Timestamp.fromDate(DateTime(2024, 1, 10)),
    lyDo: "Nghỉ phép đi công tác",
    trangThai: "Chờ duyệt",
  ),
  YeuCauNghiPhep(
    maNV: "NV002",
    ngayBatDau: Timestamp.fromDate(DateTime(2024, 1, 9)),
    ngayKetThuc: Timestamp.fromDate(DateTime(2024, 1, 12)),
    lyDo: "Nghỉ phép nghỉ lễ",
    trangThai: "Đã duyệt",
  ),
  YeuCauNghiPhep(
    maNV: "NV003",
    ngayBatDau: Timestamp.fromDate(DateTime(2024, 1, 8)),
    ngayKetThuc: Timestamp.fromDate(DateTime(2024, 1, 10)),
    lyDo: "Nghỉ phép đi công tác",
    trangThai: "Chờ duyệt",
  ),
  YeuCauNghiPhep(
    maNV: "NV004",
    ngayBatDau: Timestamp.fromDate(DateTime(2024, 1, 9)),
    ngayKetThuc: Timestamp.fromDate(DateTime(2024, 1, 12)),
    lyDo: "Nghỉ phép nghỉ lễ",
    trangThai: "Đã duyệt",
  )
];
