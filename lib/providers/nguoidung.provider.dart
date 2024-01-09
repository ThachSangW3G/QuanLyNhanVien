import 'package:flutter/material.dart';
import 'package:quanlynhanvien/models/nguoidung.model.dart';
import 'package:quanlynhanvien/repositories/nguoidung.repository.dart';

class NguoiDungProvider extends ChangeNotifier {
  late NguoiDungRepository nguoiDungRepository;

  NguoiDung? _nguoiDung;

  NguoiDung? get nguoiDung => _nguoiDung;

  bool get isLoggedIn => _nguoiDung != null;

  // Lấy giá trị của nguoiDung

  NguoiDungProvider() {
    nguoiDungRepository = NguoiDungRepositoryImpl();
  }

  Future<void> dangNhap(String tenDangNhap, String matKhau) async {
    _nguoiDung = await nguoiDungRepository.dangNhap(tenDangNhap, matKhau);

    print(_nguoiDung);
    notifyListeners();
  }

  Future<void> addTaiKhoan(NguoiDung nguoiDung) async {
    await nguoiDungRepository.addTaiKhoan(nguoiDung);
    notifyListeners();
  }

  Future<NguoiDung?> getLastNguoiDung() {
    return nguoiDungRepository.getLastNguoiDung();
  }

  Future<void> updTaiKhoan(NguoiDung nguoiDung) async {
    await nguoiDungRepository.updTaiKhoan(nguoiDung);
    notifyListeners();
  }
}
