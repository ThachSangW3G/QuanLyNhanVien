import 'package:flutter/material.dart';
import 'package:quanlynhanvien/models/phucap.model.dart';
import 'package:quanlynhanvien/repositories/phucap.repository.dart';

class PhuCapProvider extends ChangeNotifier {
  late PhuCapRepository phuCapRepository;

  PhuCapProvider() {
    phuCapRepository = PhuCapRepositoryImpl();
  }

  Future<void> addPhuCap(PhuCap phuCap) async {
    await phuCapRepository.addPhuCap(phuCap);
    notifyListeners();
  }

  Future<List<PhuCap>> getAllPhuCap() async {
    return await phuCapRepository.getAllPhuCap();
  }

  Future<PhuCap> getPhuCap(String maCV) async {
    return await phuCapRepository.getPhuCap(maCV);
  }

  Future<void> delPhuCap(String maCV) async {
    await phuCapRepository.delPhuCap(maCV);
    notifyListeners();
  }

  Future<void> updPhuCap(PhuCap phuCap) async {
    await phuCapRepository.updPhuCap(phuCap);
    notifyListeners();
  }

  Future<PhuCap?> getLastPhuCap() {
    return phuCapRepository.getLastPhuCap();
  }
}
