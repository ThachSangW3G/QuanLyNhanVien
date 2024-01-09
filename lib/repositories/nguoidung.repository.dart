import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quanlynhanvien/models/nguoidung.model.dart';

abstract class NguoiDungRepository {
  Future<NguoiDung?> dangNhap(String tenDangNhap, String matKhau);
  Future<void> addTaiKhoan(NguoiDung nguoiDung);
  Future<NguoiDung?> getLastNguoiDung();
  Future<void> updTaiKhoan(NguoiDung nguoiDung);
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

  @override
  Future<void> addTaiKhoan(NguoiDung nguoiDung) {
    return nguoiDungs
        .doc(nguoiDung.maND)
        .set(nguoiDung.toJson())
        .then((value) => print('add nguoiDung successfully'));
  }

  @override
  Future<NguoiDung?> getLastNguoiDung() async {
    List<NguoiDung> listLKT = [];
    await nguoiDungs
        .orderBy('maND', descending: true)
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        listLKT.add(NguoiDung.fromJson(doc.data() as Map<String, dynamic>));
      }
    });

    return Future.value(listLKT[0]);
  }

  @override
  Future<void> updTaiKhoan(NguoiDung nguoiDung) {
    return nguoiDungs
        .doc(nguoiDung.maND)
        .update(nguoiDung.toJson())
        .then((value) => print('update ChucVu succcessfully'));
  }
}
