class KyLuat {
  final String maKL;
  final String tenKL;
  final int soTien;
  final String ghiChu;

  KyLuat(
      {required this.maKL,
      required this.tenKL,
      required this.soTien,
      required this.ghiChu});

  factory KyLuat.fromJson(Map<String, dynamic> json) {
    return KyLuat(
        maKL: json['maKT'] ?? '',
        tenKL: json['tenKT'] ?? '',
        soTien: json['soTien'] ?? 0,
        ghiChu: json['ghiChu'] ?? '');
  }

  Map<String, dynamic> toJson() {
    return {'maKL': maKL, 'tenKL': tenKL, 'soTien': soTien, 'ghiChu': ghiChu};
  }
}
