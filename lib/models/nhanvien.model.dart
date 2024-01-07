import 'package:cloud_firestore/cloud_firestore.dart';

class NhanVien {
  final String maNV;
  final String hoTen;
  final String email;
  final String image;
  final String noiSinh;
  final String diaChiThuongTru;
  final String diaChiTamTru;
  final String soDienThoai;
  final String danToc;
  final String tonGiao;
  final String quocTich;
  final String hocVan;
  final String maPB;
  final Timestamp ngaySinh;
  final String gioiTinh;
  final String tinhTrangHonNhan;
  final String cCCD;
  final String noiCap;
  final Timestamp ngayCap;
  final String maCV;

  NhanVien({
    required this.maNV,
    required this.hoTen,
    required this.email,
    required this.image,
    required this.maPB,
    required this.ngaySinh,
    required this.gioiTinh,
    required this.tinhTrangHonNhan,
    required this.cCCD,
    required this.noiCap,
    required this.ngayCap,
    required this.maCV,
    required this.noiSinh,
    required this.diaChiThuongTru,
    required this.diaChiTamTru,
    required this.soDienThoai,
    required this.danToc,
    required this.tonGiao,
    required this.quocTich,
    required this.hocVan,
  });

  factory NhanVien.fromJson(Map<String, dynamic> json) {
    return NhanVien(
      maNV: json['maNV'] ?? '',
      hoTen: json['hoTen'] ?? '',
      email: json['email'] ?? '',
      image: json['image'] ?? '',
      maPB: json['maPB'] ?? '',
      ngaySinh: json['ngaySinh'],
      gioiTinh: json['gioiTinh'] ?? '',
      tinhTrangHonNhan: json['tinhTrangHonNhan'] ?? '',
      cCCD: json['cCCD'] ?? '',
      noiCap: json['noiCap'] ?? '',
      ngayCap: json['ngayCap'],
      maCV: json['maCV'] ?? '',
      noiSinh: json['noiSinh'] ?? '',
      diaChiThuongTru: json['diaChiThuongTru'] ?? '',
      diaChiTamTru: json['diaChiTamTru'] ?? '',
      soDienThoai: json['soDienThoai'] ?? '',
      danToc: json['danToc'] ?? '',
      tonGiao: json['tonGiao'] ?? '',
      quocTich: json['quocTich'] ?? '',
      hocVan: json['hocVan'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'maNV': maNV,
      'hoTen': hoTen,
      'email': email,
      'image': image,
      'maPB': maPB,
      'ngaySinh': ngaySinh,
      'gioiTinh': gioiTinh,
      'tinhTrangHonNhan': tinhTrangHonNhan,
      'cCCD': cCCD,
      'noiCap': noiCap,
      'ngayCap': ngayCap,
      'maCV': maCV,
      'noiSinh': noiSinh,
      'diaChiThuongTru': diaChiThuongTru,
      'diaChiTamTru': diaChiTamTru,
      'soDienThoai': soDienThoai,
      'danToc': danToc,
      'tonGiao': tonGiao,
      'quocTich': quocTich,
      'hocVan': hocVan,
    };
  }
}

List<NhanVien> listNhanVien = [
  NhanVien(
    maNV: 'NV001',
    hoTen: 'Nguyen Van A',
    email: 'nguyenvanA@gmail.com',
    image:
        'https://upanh123.com/wp-content/uploads/2021/03/hinh-anh-cute13.jpg',
    maPB: 'PB001',
    ngaySinh: Timestamp.fromDate(DateTime.now()),
    gioiTinh: 'Nam',
    tinhTrangHonNhan: 'Da ket hon',
    cCCD: '0324564543',
    noiCap: 'Tra Vinh',
    maCV: 'CV001',
    noiSinh: 'Tra Vinh',
    ngayCap: Timestamp.fromDate(DateTime.now()),
    diaChiThuongTru: 'TraVinh',
    diaChiTamTru: 'TraVinh',
    soDienThoai: '65434567',
    danToc: 'Kinh',
    tonGiao: 'tonGiao',
    quocTich: 'quocTich',
    hocVan: 'hocVan',
  ),
  NhanVien(
    maNV: 'NV001',
    hoTen: 'Nguyen Van A',
    email: 'nguyenvanA@gmail.com',
    image:
        'https://upanh123.com/wp-content/uploads/2021/03/hinh-anh-cute13.jpg',
    maPB: 'PB001',
    ngaySinh: Timestamp.fromDate(DateTime.now()),
    gioiTinh: 'Nam',
    tinhTrangHonNhan: 'Da ket hon',
    cCCD: '0324564543',
    noiCap: 'Tra Vinh',
    maCV: 'CV001',
    noiSinh: 'Tra Vinh',
    ngayCap: Timestamp.fromDate(DateTime.now()),
    diaChiThuongTru: 'TraVinh',
    diaChiTamTru: 'TraVinh',
    soDienThoai: '65434567',
    danToc: 'Kinh',
    tonGiao: 'tonGiao',
    quocTich: 'quocTich',
    hocVan: 'hocVan',
  ),
  NhanVien(
    maNV: 'NV001',
    hoTen: 'Nguyen Van A',
    email: 'nguyenvanA@gmail.com',
    image:
        'https://upanh123.com/wp-content/uploads/2021/03/hinh-anh-cute13.jpg',
    maPB: 'PB001',
    ngaySinh: Timestamp.fromDate(DateTime.now()),
    gioiTinh: 'Nam',
    tinhTrangHonNhan: 'Da ket hon',
    cCCD: '0324564543',
    noiCap: 'Tra Vinh',
    maCV: 'CV001',
    noiSinh: 'Tra Vinh',
    ngayCap: Timestamp.fromDate(DateTime.now()),
    diaChiThuongTru: 'TraVinh',
    diaChiTamTru: 'TraVinh',
    soDienThoai: '65434567',
    danToc: 'Kinh',
    tonGiao: 'tonGiao',
    quocTich: 'quocTich',
    hocVan: 'hocVan',
  ),
];
