class ChucVu {
  final String maCV;
  final String tenCV;

  ChucVu({required this.maCV, required this.tenCV});

  factory ChucVu.fromJson(Map<String, dynamic> json) {
    return ChucVu(maCV: json['maCV'] ?? '', tenCV: json['tenCV'] ?? '');
  }

  Map<String, dynamic> toJson() {
    return {'maCV': maCV, 'tenCV': tenCV};
  }
}
