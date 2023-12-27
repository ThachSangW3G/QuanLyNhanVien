import 'package:flutter/material.dart';
import 'package:quanlynhanvien/models/chucvu.model.dart';
import 'package:quanlynhanvien/repositories/chucvu.repository.dart';

class ChucVuProvider extends ChangeNotifier {
  late ChucVuRepository chucVuRepository;

  ChucVuProvider() {
    chucVuRepository = ChucVuRepositoryImpl();
  }

  Future<void> addChucVu(ChucVu chucVu) async {
    await chucVuRepository.addChucVu(chucVu);
    notifyListeners();
  }

  Future<List<ChucVu>> getAllChucVu() async {
    return await chucVuRepository.getAllChucVu();
  }

  Future<ChucVu> getChucVu(String maCV) async {
    return await chucVuRepository.getChucVu(maCV);
  }

  Future<void> delChucVu(String maCV) async {
    await chucVuRepository.delChucVu(maCV);
    notifyListeners();
  }

  Future<void> updChucVu(ChucVu chucVu) async {
    await chucVuRepository.updChucVu(chucVu);
    notifyListeners();
  }
}
