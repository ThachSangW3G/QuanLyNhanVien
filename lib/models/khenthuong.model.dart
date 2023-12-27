class KhenThuong {
  final String maKT;
  final String tenKT;
  final int soTien;
  final String ghiChu;

  KhenThuong(
      {required this.maKT,
      required this.tenKT,
      required this.soTien,
      required this.ghiChu});

  factory KhenThuong.fromJson(Map<String, dynamic> json) {
    return KhenThuong(
        maKT: json['maKT'] ?? '',
        tenKT: json['tenKT'] ?? '',
        soTien: json['soTien'] ?? 0,
        ghiChu: json['ghiChu'] ?? '');
  }

  Map<String, dynamic> toJson() {
    return {'maKT': maKT, 'tenKT': tenKT, 'soTien': soTien, 'ghiChu': ghiChu};
  }
}
