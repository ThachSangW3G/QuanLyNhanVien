import 'package:flutter/material.dart';
import 'package:quanlynhanvien/models/phieuluong.model.dart';

import 'package:quanlynhanvien/repositories/phieuluong.repository.dart';

class PhieuLuongProvider extends ChangeNotifier {
  late PhieuLuongRepository phieuLuongRepository;

  PhieuLuongProvider() {
    phieuLuongRepository = PhieuLuongRepositoryImpl();
  }

  Future<void> addPhieuLuong(PhieuLuong phieuLuong) async {
    await phieuLuongRepository.addPhieuLuong(phieuLuong);
    notifyListeners();
  }

  Future<List<PhieuLuong>> getAllPhieuLuongn() async {
    return await phieuLuongRepository.getAllPhieuLuong();
  }

  Future<PhieuLuong> getPhieuLuong(String maPB) async {
    return await phieuLuongRepository.getPhieuLuong(maPB);
  }

  Future<void> delPhieuLuong(String maPB) async {
    await phieuLuongRepository.delPhieuLuong(maPB);
    notifyListeners();
  }

  Future<void> updPhieuLuong(PhieuLuong phieuLuong) async {
    await phieuLuongRepository.updPhieuLuong(phieuLuong);
    notifyListeners();
  }

  Future<bool> getExistPhieuLuong(String maNV, int thang, int nam) async {
    return await phieuLuongRepository.getExistPhieuLuong(maNV, thang, nam);
  }
}
