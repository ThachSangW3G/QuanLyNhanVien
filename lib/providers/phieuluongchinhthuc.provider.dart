import 'package:flutter/material.dart';
import 'package:quanlynhanvien/models/phieuluonchinhthuc.model.dart';
import 'package:quanlynhanvien/repositories/phieuluongchinhthuc.repository.dart';

class PhieuLuongChinhThucProvider extends ChangeNotifier {
  late PhieuLuongChinhThucRepository phieuLuongRepository;

  PhieuLuongChinhThucProvider() {
    phieuLuongRepository = PhieuLuongChinhThucRepositoryImpl();
  }

  Future<void> addPhieuLuong(PhieuLuongChinhThuc phieuLuong) async {
    await phieuLuongRepository.addPhieuLuong(phieuLuong);
    notifyListeners();
  }

  Future<List<PhieuLuongChinhThuc>> getAllPhieuLuongn() async {
    return await phieuLuongRepository.getAllPhieuLuong();
  }

  Future<PhieuLuongChinhThuc> getPhieuLuong(String maPB) async {
    return await phieuLuongRepository.getPhieuLuong(maPB);
  }

  Future<void> delPhieuLuong(String maPB) async {
    await phieuLuongRepository.delPhieuLuong(maPB);
    notifyListeners();
  }

  Future<void> updPhieuLuong(PhieuLuongChinhThuc phieuLuong) async {
    await phieuLuongRepository.updPhieuLuong(phieuLuong);
    notifyListeners();
  }

  Future<bool> getExistPhieuLuong(String maNV, int thang, int nam) async {
    return await phieuLuongRepository.getExistPhieuLuong(maNV, thang, nam);
  }

  Future<List<PhieuLuongChinhThuc>> getPhieuLuongByThangNam(
      DateTime specificDate) async {
    return await phieuLuongRepository.getPhieuLuongByThangNam(specificDate);
  }

  Future<List<PhieuLuongChinhThuc>> getAllPhieuLuongByMaNV(String maNV) {
    return phieuLuongRepository.getAllPhieuLuongByMaNV(maNV);
  }
}
