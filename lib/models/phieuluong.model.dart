class PhieuLuong {
  final String maPhieu;
  final String maNV;
  final String luongCoBan;
  final int phuCap;
  final int khenThuong;
  final int kyLuat;
  final int thang;
  final int nam;
  final int soNgayCong;
  final int soNgayNghi;
  final int luong;

  PhieuLuong({
    required this.maPhieu,
    required this.maNV,
    required this.luongCoBan,
    required this.phuCap,
    required this.khenThuong,
    required this.kyLuat,
    required this.thang,
    required this.nam,
    required this.soNgayCong,
    required this.soNgayNghi,
    required this.luong,
  });

  Map<String, dynamic> toJson() {
    return {
      'maPhieu': maPhieu,
      'maNV': maNV,
      'luongCoBan': luongCoBan,
      'phuCap': phuCap,
      'khenThuong': khenThuong,
      'kyLuat': kyLuat,
      'thang': thang,
      'nam': nam,
      'soNgayCong': soNgayCong,
      'soNgayNghi': soNgayNghi,
      'luong': luong,
    };
  }

  factory PhieuLuong.fromJson(Map<String, dynamic> json) {
    return PhieuLuong(
      maPhieu: json['maPhieu'] ?? '',
      maNV: json['maNV'] ?? '',
      luongCoBan: json['luongCoBan'] ?? '',
      phuCap: json['phuCap'] ?? '',
      khenThuong: json['khenThuong'] ?? '',
      kyLuat: json['kyLuat'] ?? '',
      thang: json['thang'] ?? '',
      nam: json['nam'] ?? '',
      soNgayCong: json['soNgayCong'] ?? '',
      soNgayNghi: json['soNgayNghi'] ?? '',
      luong: json['luong'] ?? '',
    );
  }
}
