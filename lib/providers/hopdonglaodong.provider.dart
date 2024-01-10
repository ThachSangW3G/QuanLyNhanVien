import 'package:flutter/material.dart';
import 'package:quanlynhanvien/models/hopdonglaodong.model.dart';
import 'package:quanlynhanvien/repositories/hopdonglaodong.repository.dart';

class HopDongLaoDongProvider extends ChangeNotifier {
  late HopDongLaoDongRepository hopDongLaoDongRepository;

  HopDongLaoDongProvider() {
    hopDongLaoDongRepository = HopDongLaoDongRepositoryImpl();
  }

  Future<void> addHopDongLaoDong(HopDongLaoDong hopDongLaoDong) async {
    await hopDongLaoDongRepository.addHopDongLapDong(hopDongLaoDong);
    notifyListeners();
  }

  Future<List<HopDongLaoDong>> getAllHopDongLaoDong() async {
    return await hopDongLaoDongRepository.getAllHopDongLaoDong();
  }

  Future<HopDongLaoDong> getHopDongLaoDong(String maHD) async {
    return await hopDongLaoDongRepository.getHopDongLaoDong(maHD);
  }

  Future<void> delHopDonglaoDong(String maHD) async {
    await hopDongLaoDongRepository.delHopDongLaoDong(maHD);
    notifyListeners();
  }

  Future<void> updHopDongLaoDong(HopDongLaoDong hopDongLaoDong) async {
    await hopDongLaoDongRepository.updHopDongLaoDong(hopDongLaoDong);
    notifyListeners();
  }

  Future<HopDongLaoDong?> getLastHopDongLaoDong() {
    return hopDongLaoDongRepository.getLastHopDongLaoDong();
  }

  Future<HopDongLaoDong> getHopDongLaoDongByMaNV(String maNV) {
    return hopDongLaoDongRepository.getHopDongLaoDongByMaNV(maNV);
  }
}
