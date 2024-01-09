import 'package:flutter/material.dart';
import 'package:quanlynhanvien/models/khenthuong.model.dart';
import 'package:quanlynhanvien/repositories/khenthuong.repository.dart';

class KhenThuongProvider extends ChangeNotifier {
  late KhenThuongRepository khenThuongRepository;

  KhenThuongProvider() {
    khenThuongRepository = KhenThuongRepositoryImpl();
  }

  Future<void> addKhenThuong(KhenThuong khenThuong) async {
    await khenThuongRepository.addKhenThuong(khenThuong);
    notifyListeners();
  }

  Future<List<KhenThuong>> getAllKhenThuong() async {
    return await khenThuongRepository.getAllKhenThuong();
  }

  Future<KhenThuong> getKhenThuong(String maKT) async {
    return await khenThuongRepository.getKhenThuong(maKT);
  }

  Future<void> delKhenThuong(String maKT) async {
    await khenThuongRepository.delKhenThuong(maKT);
    notifyListeners();
  }

  Future<void> updKhenThuong(KhenThuong khenThuong) async {
    await khenThuongRepository.updKhenThuong(khenThuong);
    notifyListeners();
  }

  Future<KhenThuong?> getLastKhenThuong() {
    return khenThuongRepository.getLastKhenThuong();
  }

  Future<int> getTongTienThuong(String maNV, DateTime specificDate) {
    return khenThuongRepository.getTongTienThuong(maNV, specificDate);
  }
}
