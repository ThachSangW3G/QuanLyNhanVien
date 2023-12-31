import 'package:cloud_firestore/cloud_firestore.dart';

class NhanVien {
  final String maNV;
  final String hoTen;
  final String noiSinh;
  final String nguyenQuan;
  final String diaChiThuongTru;
  final String diaChiTamTru;
  final String soDienThoai;
  final String danToc;
  final String tonGiao;
  final String quocTich;
  final String hocVan;
  final String ghiChu;
  final String maPB;
  final Timestamp ngaySinh;
  final String gioiTinh;
  final String tinhTrangHonNhan;
  final String cCCD;
  final String noiCap;
  final String maCV;

  NhanVien(
      {required this.maNV,
      required this.hoTen,
      required this.maPB,
      required this.ngaySinh,
      required this.gioiTinh,
      required this.tinhTrangHonNhan,
      required this.cCCD,
      required this.noiCap,
      required this.maCV,
      required this.noiSinh,
      required this.nguyenQuan,
      required this.diaChiThuongTru,
      required this.diaChiTamTru,
      required this.soDienThoai,
      required this.danToc,
      required this.tonGiao,
      required this.quocTich,
      required this.hocVan,
      required this.ghiChu});

  factory NhanVien.fromJson(Map<String, dynamic> json) {
    return NhanVien(
      maNV: json['maNV'] ?? '',
      hoTen: json['hoTen'] ?? '',
      maPB: json['maPB'] ?? '',
      ngaySinh: json['ngaySinh'],
      gioiTinh: json['gioiTinh'] ?? '',
      tinhTrangHonNhan: json['tinhTrangHonNhan'] ?? '',
      cCCD: json['cCCD'] ?? '',
      noiCap: json['noiCap'] ?? '',
      maCV: json['maCV'] ?? '',
      noiSinh: json['noiSinh'] ?? '',
      nguyenQuan: json['nguyenQuan'] ?? '',
      diaChiThuongTru: json['diaChiThuongTru'] ?? '',
      diaChiTamTru: json['diaChiTamTru'] ?? '',
      soDienThoai: json['soDienThoai'] ?? '',
      danToc: json['danToc'] ?? '',
      tonGiao: json['tonGiao'] ?? '',
      quocTich: json['quocTich'] ?? '',
      hocVan: json['hocVan'] ?? '',
      ghiChu: json['ghiChu'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'maNV': maNV,
      'hoTen': hoTen,
      'maPB': maPB,
      'ngaySinh': ngaySinh,
      'gioiTinh': gioiTinh,
      'tinhTrangHonNhan': tinhTrangHonNhan,
      'cCCD': cCCD,
      'noiCap': noiCap,
      'maCV': maCV,
      'noiSinh': noiSinh,
      'nguyenQuan': nguyenQuan,
      'diaChiThuongTru': diaChiThuongTru,
      'diaChiTamTru': diaChiTamTru,
      'soDienThoai': soDienThoai,
      'danToc': danToc,
      'tonGiao': tonGiao,
      'quocTich': quocTich,
      'hocVan': hocVan,
      'ghiChu': ghiChu
    };
  }
}

List<NhanVien> listNhanVien = [
  NhanVien(
      maNV: 'NV001',
      hoTen: 'Nguyen Van A',
      maPB: 'PB001',
      ngaySinh: Timestamp.fromDate(DateTime.now()),
      gioiTinh: 'Nam',
      tinhTrangHonNhan: 'Da ket hon',
      cCCD: '0324564543',
      noiCap: 'Tra Vinh',
      maCV: 'CV001',
      noiSinh: 'Tra Vinh',
      nguyenQuan: 'TraVinh',
      diaChiThuongTru: 'TraVinh',
      diaChiTamTru: 'TraVinh',
      soDienThoai: '65434567',
      danToc: 'Kinh',
      tonGiao: 'tonGiao',
      quocTich: 'quocTich',
      hocVan: 'hocVan',
      ghiChu: 'ghiChu'),
  NhanVien(
      maNV: 'NV002',
      hoTen: 'Nguyen Van K',
      maPB: 'PB001',
      ngaySinh: Timestamp.fromDate(DateTime.now()),
      gioiTinh: 'Nam',
      tinhTrangHonNhan: 'Da ket hon',
      cCCD: '0324564543',
      noiCap: 'Tra Vinh',
      maCV: 'CV001',
      noiSinh: 'Tra Vinh',
      nguyenQuan: 'TraVinh',
      diaChiThuongTru: 'TraVinh',
      diaChiTamTru: 'TraVinh',
      soDienThoai: '65434567',
      danToc: 'Kinh',
      tonGiao: 'tonGiao',
      quocTich: 'quocTich',
      hocVan: 'hocVan',
      ghiChu: 'ghiChu'),
  NhanVien(
      maNV: 'NV003',
      hoTen: 'Nguyen Van F',
      maPB: 'PB001',
      ngaySinh: Timestamp.fromDate(DateTime.now()),
      gioiTinh: 'Nam',
      tinhTrangHonNhan: 'Da ket hon',
      cCCD: '0324564543',
      noiCap: 'Tra Vinh',
      maCV: 'CV001',
      noiSinh: 'Tra Vinh',
      nguyenQuan: 'TraVinh',
      diaChiThuongTru: 'TraVinh',
      diaChiTamTru: 'TraVinh',
      soDienThoai: '65434567',
      danToc: 'Kinh',
      tonGiao: 'tonGiao',
      quocTich: 'quocTich',
      hocVan: 'hocVan',
      ghiChu: 'ghiChu'),
];
