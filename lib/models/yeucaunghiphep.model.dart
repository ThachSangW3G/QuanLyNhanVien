import 'package:cloud_firestore/cloud_firestore.dart';

class YeuCauNghiPhep {
  final String maNV;
  final Timestamp ngayBatDau;
  final Timestamp ngayKetThuc;
  final String lyDo;
  final String trangThai;
  final Timestamp ngayduyet;
  final String nguoiDuyet;

  YeuCauNghiPhep(
      {required this.maNV,
      required this.ngayBatDau,
      required this.ngayKetThuc,
      required this.lyDo,
      required this.ngayduyet,
      required this.nguoiDuyet,
      required this.trangThai});

  factory YeuCauNghiPhep.fromJson(Map<String, dynamic> json) {
    return YeuCauNghiPhep(
        maNV: json['maNV'] ?? '',
        ngayBatDau: json['ngayBatDau'] ?? '',
        ngayKetThuc: json['ngayKetThuc'] ?? '',
        ngayduyet: json['ngayDuyet'] ?? '',
        nguoiDuyet: json['nguoiDuyet'] ?? '',
        lyDo: json['lyDo'] ?? '',
        trangThai: json['trangThai'] ?? '');
  }

  Map<String, dynamic> toJson() {
    return {
      'maNV': maNV,
      'ngayBatDau': ngayBatDau,
      'ngayKetThuc': ngayKetThuc,
      'lyDo': lyDo,
      'nguoiDuyet': nguoiDuyet,
      'ngayDuyet': ngayduyet,
      'trangThai': trangThai
    };
  }
}

List<YeuCauNghiPhep> listYeuCauNghiPhep = [
  YeuCauNghiPhep(
    maNV: "NV001",
    ngayBatDau: Timestamp.fromDate(DateTime(2024, 1, 8)),
    ngayKetThuc: Timestamp.fromDate(DateTime(2024, 1, 10)),
    ngayduyet: Timestamp.fromDate(DateTime(2024, 1, 10)),
    nguoiDuyet: 'NV003',
    lyDo: "Nghỉ phép đi công tác",
    trangThai: "Chờ duyệt",
  ),
  YeuCauNghiPhep(
    maNV: "NV002",
    ngayBatDau: Timestamp.fromDate(DateTime(2024, 1, 9)),
    ngayKetThuc: Timestamp.fromDate(DateTime(2024, 1, 12)),
    ngayduyet: Timestamp.fromDate(DateTime(2024, 1, 10)),
    nguoiDuyet: 'NV003',
    lyDo: "Nghỉ phép nghỉ lễ",
    trangThai: "Không được duyệt",
  ),
  YeuCauNghiPhep(
    maNV: "NV003",
    ngayBatDau: Timestamp.fromDate(DateTime(2024, 1, 8)),
    ngayKetThuc: Timestamp.fromDate(DateTime(2024, 1, 10)),
    ngayduyet: Timestamp.fromDate(DateTime(2024, 1, 10)),
    nguoiDuyet: 'NV003',
    lyDo: "Nghỉ phép đi công tác",
    trangThai: "Chờ duyệt",
  ),
  YeuCauNghiPhep(
    maNV: "NV004",
    ngayBatDau: Timestamp.fromDate(DateTime(2024, 1, 9)),
    ngayKetThuc: Timestamp.fromDate(DateTime(2024, 1, 12)),
    ngayduyet: Timestamp.fromDate(DateTime(2024, 1, 10)),
    nguoiDuyet: 'NV003',
    lyDo: "Nghỉ phép nghỉ lễ",
    trangThai: "Đã duyệt",
  )
];
