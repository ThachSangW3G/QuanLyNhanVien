import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quanlynhanvien/models/nguoidung.model.dart';

abstract class NguoiDungRepository {
  Future<NguoiDung?> dangNhap(String tenDangNhap, String matKhau);
}

class NguoiDungRepositoryImpl implements NguoiDungRepository {
  CollectionReference nguoiDungs =
      FirebaseFirestore.instance.collection('NguoiDungs');

  @override
  Future<NguoiDung?> dangNhap(String tenDangNhap, String matKhau) async {
    print(matKhau);
    return await nguoiDungs
        .where('tenDangNhap', isEqualTo: tenDangNhap)
        .where('matKhau', isEqualTo: matKhau)
        .get()
        .then((QuerySnapshot snapshot) {
      if (snapshot.docs.isEmpty) {
        return null;
      }
      final data = NguoiDung.fromJson(
          snapshot.docs.first.data() as Map<String, dynamic>);
      return Future.value(data);
    });
  }
}
