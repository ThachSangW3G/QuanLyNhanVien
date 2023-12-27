import 'package:flutter/material.dart';
import 'package:quanlynhanvien/models/phongban.model.dart';
import 'package:quanlynhanvien/repositories/phongban.repository.dart';

class PhongBanProvider extends ChangeNotifier {
  late PhongBanRepository phongBanRepository;

  PhongBanProvider() {
    phongBanRepository = PhongBanRepositoryImpl();
  }

  Future<void> addPhongBan(PhongBan phongBan) async {
    await phongBanRepository.addPhongBan(phongBan);
    notifyListeners();
  }

  Future<List<PhongBan>> getAllPhongBan() async {
    return await phongBanRepository.getAllPhongBan();
  }

  Future<PhongBan> getPhongBan(String maPB) async {
    return await phongBanRepository.getPhongBan(maPB);
  }

  Future<void> delPhongBan(String maPB) async {
    await phongBanRepository.delPhongBan(maPB);
    notifyListeners();
  }

  Future<void> updPhongBan(PhongBan phongBan) async {
    await phongBanRepository.updPhongBan(phongBan);
    notifyListeners();
  }
}
