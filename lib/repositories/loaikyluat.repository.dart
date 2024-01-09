import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quanlynhanvien/models/loaikyluat.model.dart';

abstract class LoaiKyLuatRepository {
  Future<void> addLoaiKyLuat(LoaiKyLuat loaiKyLuat);
  Future<List<LoaiKyLuat>> getAllLoaiKyLuat();
  Future<LoaiKyLuat> getLoaiKyLuat(String maLKL);
  Future<void> delLoaiKyLuat(String maLKL);
  Future<void> updLoaiKyLuat(LoaiKyLuat loaiKyLuat);
  Future<LoaiKyLuat?> getLastLoaiKyLuat();
}

class LoaiKyLuatRepositoryImpl implements LoaiKyLuatRepository {
  CollectionReference loaiKyLuats =
      FirebaseFirestore.instance.collection('LoaiKyLuats');

  @override
  Future<void> addLoaiKyLuat(LoaiKyLuat loaiKyLuat) {
    return loaiKyLuats
        .doc(loaiKyLuat.maLKL)
        .set(loaiKyLuat.toJson())
        .then((value) => print('add loaiKyLuat successfully'));
  }

  @override
  Future<void> delLoaiKyLuat(String maLKL) {
    return loaiKyLuats
        .doc(maLKL)
        .delete()
        .then((value) => print('delete loaiKyLuat successfully'));
  }

  @override
  Future<List<LoaiKyLuat>> getAllLoaiKyLuat() async {
    List<LoaiKyLuat> listLKL = [];
    await loaiKyLuats.get().then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        listLKL.add(LoaiKyLuat.fromJson(doc.data() as Map<String, dynamic>));
      }
    });

    return Future.value(listLKL);
  }

  @override
  Future<LoaiKyLuat> getLoaiKyLuat(String maLKL) async {
    return await loaiKyLuats.doc(maLKL).get().then((DocumentSnapshot doc) {
      final data = LoaiKyLuat.fromJson(doc.data() as Map<String, dynamic>);
      return Future.value(data);
    });
  }

  @override
  Future<void> updLoaiKyLuat(LoaiKyLuat loaiKhenThuong) {
    return loaiKyLuats
        .doc(loaiKhenThuong.maLKL)
        .update(loaiKhenThuong.toJson())
        .then((value) => print('update loaiKyLuat succcessfully'));
  }

  @override
  Future<LoaiKyLuat?> getLastLoaiKyLuat() async {
    List<LoaiKyLuat> listLKL = [];
    await loaiKyLuats
        .orderBy('maLKL', descending: true)
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        listLKL.add(LoaiKyLuat.fromJson(doc.data() as Map<String, dynamic>));
      }
    });

    return Future.value(listLKL[0]);
  }
}
