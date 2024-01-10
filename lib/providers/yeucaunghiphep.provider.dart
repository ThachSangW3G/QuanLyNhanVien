import 'package:flutter/material.dart';
import 'package:quanlynhanvien/models/yeucaunghiphep.model.dart';
import 'package:quanlynhanvien/repositories/yeucaunghiphep.repository.dart';

class YeuCauNghiPhepProvider extends ChangeNotifier {
  late YeuCauNghiPhepRepository yeuCauNghiPhepRepository;

  YeuCauNghiPhepProvider() {
    yeuCauNghiPhepRepository = YeuCauNghiPhepRepositoryImpl();
  }

  Future<void> addYeuCauNghiPhep(YeuCauNghiPhep yeuCauNghiPhep) async {
    await yeuCauNghiPhepRepository.addYeuCauNghiPhep(yeuCauNghiPhep);
    notifyListeners();
  }

  Stream<List<YeuCauNghiPhep>> getAllYeuCauNghiPhep() {
    return yeuCauNghiPhepRepository.getAllYeuCauNghiPhep();
  }

  Future<YeuCauNghiPhep> getYeuCauNghiPhep(String maYCNP) async {
    return await yeuCauNghiPhepRepository.getYeuCauNghiPhep(maYCNP);
  }

  Future<void> delYeuCauNghiPhep(String maYCNP) async {
    await yeuCauNghiPhepRepository.delYeuCauNghiPhep(maYCNP);
    notifyListeners();
  }

  Future<void> updYeuCauNghiPhep(YeuCauNghiPhep yeuCauNghiPhep) async {
    await yeuCauNghiPhepRepository.updYeuCauNghiPhep(yeuCauNghiPhep);
    notifyListeners();
  }

  Stream<List<YeuCauNghiPhep>> getAllYeuCauNghiPhepByMaNV(String maNV) {
    return yeuCauNghiPhepRepository.getAllYeuCauNghiPhepByMaNV(maNV);
  }

  Future<YeuCauNghiPhep?> getLastYeuCauNghiPhep() {
    return yeuCauNghiPhepRepository.getLastYeuCauNghiPhep();
  }
}
