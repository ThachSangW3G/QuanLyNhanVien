import 'package:flutter/material.dart';

import 'package:quanlynhanvien/models/loaikhenthuong.model.dart';

import 'package:quanlynhanvien/repositories/loaikhenthuong.repository.dart';

class LoaiKhenThuongProvider extends ChangeNotifier {
  late LoaiKhenThuongRepository loaiKhenThuongRepository;

  LoaiKhenThuongProvider() {
    loaiKhenThuongRepository = LoaiKhenThuongRepositoryImpl();
  }

  Future<void> addLoaiKhenThuong(LoaiKhenThuong loaiKhenThuong) async {
    await loaiKhenThuongRepository.addLoaiKhenThuong(loaiKhenThuong);
    notifyListeners();
  }

  Future<List<LoaiKhenThuong>> getAllLoaiKhenThuong() async {
    return await loaiKhenThuongRepository.getAllLoaiKhenThuong();
  }

  Future<LoaiKhenThuong> getLoaiKhenThuong(String maLKT) async {
    return await loaiKhenThuongRepository.getLoaiKhenThuong(maLKT);
  }

  Future<void> delLoaiKhenThuong(String maLKT) async {
    await loaiKhenThuongRepository.delLoaiKhenThuong(maLKT);
    notifyListeners();
  }

  Future<void> updLoaiKhenThuong(LoaiKhenThuong loaiKhenThuong) async {
    await loaiKhenThuongRepository.updLoaiKhenThuong(loaiKhenThuong);
    notifyListeners();
  }

  Future<LoaiKhenThuong?> getLastLoaiKhenThuong() {
    return loaiKhenThuongRepository.getLastLoaiKhenThuong();
  }
}
