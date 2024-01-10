import 'package:flutter/material.dart';
import 'package:quanlynhanvien/models/nhanvien.model.dart';
import 'package:quanlynhanvien/repositories/nhanvien.repository.dart';

class NhanVienProvider extends ChangeNotifier {
  late NhanVienRepository nhanVienRepository;

  NhanVienProvider() {
    nhanVienRepository = NhanVienRepositoryImpl();
  }

  Future<void> addNhanVien(NhanVien nhanVien) async {
    await nhanVienRepository.addNhanVien(nhanVien);
    notifyListeners();
  }

  Future<List<NhanVien>> getAllNhanVien() async {
    return await nhanVienRepository.getAllNhanVien();
  }

  Future<NhanVien> getNhanVien(String maNV) async {
    return await nhanVienRepository.getNhanVien(maNV);
  }

  Future<void> dekNhanVien(String maNV) async {
    await nhanVienRepository.delNhanVien(maNV);
    notifyListeners();
  }

  Future<void> updNhanVien(NhanVien nhanVien) async {
    await nhanVienRepository.updNhanVien(nhanVien);
    notifyListeners();
  }

  Future<NhanVien?> getLastNhanVien() {
    return nhanVienRepository.getLastNhanVien();
  }
}
