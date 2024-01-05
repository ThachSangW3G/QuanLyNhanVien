class ChucVu {
  final String maCV;
  final String tenCV;
  final String moTa;

  ChucVu({required this.maCV, required this.tenCV, required this.moTa});

  factory ChucVu.fromJson(Map<String, dynamic> json) {
    return ChucVu(
        maCV: json['maCV'] ?? '',
        tenCV: json['tenCV'] ?? '',
        moTa: json['moTa']);
  }

  Map<String, dynamic> toJson() {
    return {'maCV': maCV, 'tenCV': tenCV};
  }
}

List<ChucVu> listChucVu = [
  ChucVu(maCV: 'CV001', tenCV: 'Trưởng phòng', moTa: 'Trưởng phòng mãi đỉnh'),
  ChucVu(maCV: 'CV001', tenCV: 'Trưởng phòng', moTa: 'Trưởng phòng mãi đỉnh'),
  ChucVu(maCV: 'CV001', tenCV: 'Trưởng phòng', moTa: 'Trưởng phòng mãi đỉnh'),
  ChucVu(maCV: 'CV001', tenCV: 'Trưởng phòng', moTa: 'Trưởng phòng mãi đỉnh'),
  ChucVu(maCV: 'CV001', tenCV: 'Trưởng phòng', moTa: 'Trưởng phòng mãi đỉnh'),
  ChucVu(maCV: 'CV001', tenCV: 'Trưởng phòng', moTa: 'Trưởng phòng mãi đỉnh'),
  ChucVu(maCV: 'CV001', tenCV: 'Trưởng phòng', moTa: 'Trưởng phòng mãi đỉnh'),
  ChucVu(maCV: 'CV001', tenCV: 'Trưởng phòng', moTa: 'Trưởng phòng mãi đỉnh'),
];
