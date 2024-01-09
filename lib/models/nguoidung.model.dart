class NguoiDung {
  final String maND;
  final String maNV;
  final String tenDangNhap;
  String matKhau;
  final String loaiND;

  NguoiDung(
      {required this.maND,
      required this.maNV,
      required this.tenDangNhap,
      required this.matKhau,
      required this.loaiND});

  factory NguoiDung.fromJson(Map<String, dynamic> json) {
    return NguoiDung(
        maND: json['maND'] ?? '',
        maNV: json['maNV'] ?? '',
        tenDangNhap: json['tenDangNhap'] ?? '',
        matKhau: json['matKhau'] ?? '',
        loaiND: json['loaiND'] ?? '');
  }

  Map<String, dynamic> toJson() {
    return {
      'maND': maND,
      'maNV': maNV,
      'tenDangNhap': tenDangNhap,
      'matKhau': matKhau,
      'loaiND': loaiND
    };
  }
}
