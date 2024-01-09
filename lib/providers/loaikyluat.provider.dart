import 'package:flutter/material.dart';
import 'package:quanlynhanvien/models/loaikyluat.model.dart';

import 'package:quanlynhanvien/repositories/loaikyluat.repository.dart';

class LoaiKyLuatProvider extends ChangeNotifier {
  late LoaiKyLuatRepository loaiKyLuatRepository;

  LoaiKyLuatProvider() {
    loaiKyLuatRepository = LoaiKyLuatRepositoryImpl();
  }

  Future<void> addLoaiKyLuat(LoaiKyLuat loaiKyLuat) async {
    await loaiKyLuatRepository.addLoaiKyLuat(loaiKyLuat);
    notifyListeners();
  }

  Future<List<LoaiKyLuat>> getAllLoaiKyLuat() async {
    return await loaiKyLuatRepository.getAllLoaiKyLuat();
  }

  Future<LoaiKyLuat> getLoaiKyLuat(String maLKL) async {
    return await loaiKyLuatRepository.getLoaiKyLuat(maLKL);
  }

  Future<void> delLoaiKyLuat(String maLKL) async {
    await loaiKyLuatRepository.delLoaiKyLuat(maLKL);
    notifyListeners();
  }

  Future<void> updLoaiKyLuat(LoaiKyLuat loaiKyLuat) async {
    await loaiKyLuatRepository.updLoaiKyLuat(loaiKyLuat);
    notifyListeners();
  }

  Future<LoaiKyLuat?> getLastLoaiKyLuat() {
    return loaiKyLuatRepository.getLastLoaiKyLuat();
  }
}
