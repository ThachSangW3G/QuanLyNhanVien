import 'package:flutter/material.dart';
import 'package:quanlynhanvien/models/khenthuong.model.dart';

class KhenThuongProvider extends ChangeNotifier {
  late KhenThuongProvider khenThuongProvider;

  KhenThuongProvider() {
    khenThuongProvider = KhenThuongProvider();
  }

  Future<void> addKhenThuong(KhenThuong khenThuong) async {
    await khenThuongProvider.addKhenThuong(khenThuong);
    notifyListeners();
  }

  Future<List<KhenThuong>> getAllKhenThuong() async {
    return await khenThuongProvider.getAllKhenThuong();
  }

  Future<KhenThuong> getKhenThuong(String maKT) async {
    return await khenThuongProvider.getKhenThuong(maKT);
  }

  Future<void> delKhenThuong(String maKT) async {
    await khenThuongProvider.delKhenThuong(maKT);
    notifyListeners();
  }

  Future<void> updKhenThuong(KhenThuong khenThuong) async {
    await khenThuongProvider.updKhenThuong(khenThuong);
    notifyListeners();
  }
}
