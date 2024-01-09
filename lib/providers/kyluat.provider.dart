import 'package:flutter/material.dart';
import 'package:quanlynhanvien/models/kyluat.model.dart';
import 'package:quanlynhanvien/repositories/kyluat.repository.dart';

class KyLuatProvider extends ChangeNotifier {
  late KyLuatRepository kyLuatRepository;

  KyLuatProvider() {
    kyLuatRepository = KyLuatRepositoryImpl();
  }

  Future<void> addKyLuat(KyLuat kyLuat) async {
    await kyLuatRepository.addKyLuat(kyLuat);
    notifyListeners();
  }

  Future<List<KyLuat>> getAllKyLuat() async {
    return await kyLuatRepository.getAllKyLuat();
  }

  Future<KyLuat> getKyLuat(String maKL) async {
    return await kyLuatRepository.getKyLuat(maKL);
  }

  Future<void> delKyLuat(String maKL) async {
    await kyLuatRepository.delKyLuat(maKL);
    notifyListeners();
  }

  Future<void> updKyLuat(KyLuat kyLuat) async {
    await kyLuatRepository.updKyLuat(kyLuat);
    notifyListeners();
  }

  Future<KyLuat?> getLastKyLuat() {
    return kyLuatRepository.getLastKyLuat();
  }
}
