import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quanlynhanvien/models/nhanvien.model.dart';

abstract class NhanVienRepository {
  Future<void> addNhanVien(NhanVien nhanVien);
  Future<List<NhanVien>> getAllNhanVien();
  Future<NhanVien> getNhanVien(String maNV);
  Future<void> delNhanVien(String maNV);
  Future<void> updNhanVien(NhanVien nhanVien);
}

class NhanVienRepositoryImpl implements NhanVienRepository {
  CollectionReference nhanViens =
      FirebaseFirestore.instance.collection('NhanViens');

  @override
  Future<void> addNhanVien(NhanVien nhanVien) {
    return nhanViens
        .doc(nhanVien.maNV)
        .set(nhanVien.toJson())
        .then((value) => print('add NhanVien successfully'));
  }

  @override
  Future<void> delNhanVien(String maNV) {
    return nhanViens
        .doc(maNV)
        .delete()
        .then((value) => print('delete NhanVien successfully'));
  }

  @override
  Future<List<NhanVien>> getAllNhanVien() async {
    List<NhanVien> listNhanVien = [];
    await nhanViens.get().then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        listNhanVien.add(NhanVien.fromJson(doc.data() as Map<String, dynamic>));
      }
    });

    return Future.value(listNhanVien);
  }

  @override
  Future<NhanVien> getNhanVien(String maNV) async {
    return await nhanViens.doc(maNV).get().then((DocumentSnapshot doc) {
      final data = NhanVien.fromJson(doc.data() as Map<String, dynamic>);
      return Future.value(data);
    });
  }

  @override
  Future<void> updNhanVien(NhanVien nhanVien) {
    return nhanViens
        .doc(nhanVien.maNV)
        .update(nhanVien.toJson())
        .then((value) => print('update NhanVien succcessfully'));
  }
}
