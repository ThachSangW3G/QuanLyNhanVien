class BangLuong {
  final String maLuong;
  final String maPhieuCC;
  final String maNV;
  final int soTien;
  final int thang;
  final int nam;

  BangLuong(
      {required this.maNV,
      required this.maPhieuCC,
      required this.maLuong,
      required this.soTien,
      required this.thang,
      required this.nam});

  factory BangLuong.fromJson(Map<String, dynamic> json) {
    return BangLuong(
        maNV: json['maNV'] ?? '',
        maPhieuCC: json['maPhieuCC'] ?? '',
        maLuong: json['maLuong'] ?? '',
        soTien: json['soTien'] ?? 0,
        thang: json['thang'] ?? 0,
        nam: json['nam'] ?? 0);
  }

  Map<String, dynamic> toJson() {
    return {
      'maLuong': maLuong,
      'maPhieuCC': maPhieuCC,
      'maNV': maNV,
      'soTien': soTien,
      'thang': thang,
      'nam': nam,
    };
  }
}

List<BangLuong> listBangLuong = [
  BangLuong(
    maLuong: 'L001',
    maPhieuCC: 'P001',
    maNV: 'NV001',
    soTien: 5000000,
    thang: 1,
    nam: 2024,
  ),
  BangLuong(
    maLuong: 'L002',
    maPhieuCC: 'P001',
    maNV: 'NV001',
    soTien: 5000000,
    thang: 1,
    nam: 2024,
  ),
  BangLuong(
    maLuong: 'L002',
    maPhieuCC: 'P001',
    maNV: 'NV001',
    soTien: 5000000,
    thang: 1,
    nam: 2024,
  ),
];
