class PhieuLuongChinhThuc {
  final String maPL;
  final String maNV;
  int luongCoBan;
  double heSoLuong;
  int phuCap;
  int khenThuong;
  int kyLuat;
  final int thang;
  final int nam;
  int soNgayCong;
  double luong;

  PhieuLuongChinhThuc({
    required this.maPL,
    required this.maNV,
    required this.luongCoBan,
    required this.heSoLuong,
    required this.phuCap,
    required this.khenThuong,
    required this.kyLuat,
    required this.thang,
    required this.nam,
    required this.soNgayCong,
    required this.luong,
  });

  Map<String, dynamic> toJson() {
    return {
      'maPL': maPL,
      'maNV': maNV,
      'luongCoBan': luongCoBan,
      'heSoLuong': heSoLuong,
      'phuCap': phuCap,
      'khenThuong': khenThuong,
      'kyLuat': kyLuat,
      'thang': thang,
      'nam': nam,
      'soNgayCong': soNgayCong,
      'luong': luong,
    };
  }

  factory PhieuLuongChinhThuc.fromJson(Map<String, dynamic> json) {
    return PhieuLuongChinhThuc(
      maPL: json['maPL'] ?? '',
      maNV: json['maNV'] ?? '',
      luongCoBan: json['luongCoBan'] ?? '',
      heSoLuong: json['heSoLuong'] ?? 0,
      phuCap: json['phuCap'] ?? '',
      khenThuong: json['khenThuong'] ?? '',
      kyLuat: json['kyLuat'] ?? '',
      thang: json['thang'] ?? '',
      nam: json['nam'] ?? '',
      soNgayCong: json['soNgayCong'] ?? '',
      luong: json['luong'] ?? '',
    );
  }
}
