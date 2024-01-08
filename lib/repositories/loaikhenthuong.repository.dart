import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quanlynhanvien/models/loaikhenthuong.model.dart';

abstract class LoaiKhenThuongRepository {
  Future<void> addLoaiKhenThuong(LoaiKhenThuong loaiKhenThuong);
  Future<List<LoaiKhenThuong>> getAllLoaiKhenThuong();
  Future<LoaiKhenThuong> getLoaiKhenThuong(String maLKT);
  Future<void> delLoaiKhenThuong(String maLKT);
  Future<void> updLoaiKhenThuong(LoaiKhenThuong loaiKhenThuong);
  Future<LoaiKhenThuong?> getLastLoaiKhenThuong();
}

class LoaiKhenThuongRepositoryImpl implements LoaiKhenThuongRepository {
  CollectionReference loaiKhenThuongs =
      FirebaseFirestore.instance.collection('LoaiKhenThuongs');

  @override
  Future<void> addLoaiKhenThuong(LoaiKhenThuong loaiKhenThuong) {
    return loaiKhenThuongs
        .doc(loaiKhenThuong.maLKT)
        .set(loaiKhenThuong.toJson())
        .then((value) => print('add loaiKhenThuong successfully'));
  }

  @override
  Future<void> delLoaiKhenThuong(String maLKT) {
    return loaiKhenThuongs
        .doc(maLKT)
        .delete()
        .then((value) => print('delete loaiKhenThuong successfully'));
  }

  @override
  Future<List<LoaiKhenThuong>> getAllLoaiKhenThuong() async {
    List<LoaiKhenThuong> listLKT = [];
    await loaiKhenThuongs.get().then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        listLKT
            .add(LoaiKhenThuong.fromJson(doc.data() as Map<String, dynamic>));
      }
    });

    return Future.value(listLKT);
  }

  @override
  Future<LoaiKhenThuong> getLoaiKhenThuong(String maLKT) async {
    return await loaiKhenThuongs.doc(maLKT).get().then((DocumentSnapshot doc) {
      final data = LoaiKhenThuong.fromJson(doc.data() as Map<String, dynamic>);
      return Future.value(data);
    });
  }

  @override
  Future<void> updLoaiKhenThuong(LoaiKhenThuong loaiKhenThuong) {
    return loaiKhenThuongs
        .doc(loaiKhenThuong.maLKT)
        .update(loaiKhenThuong.toJson())
        .then((value) => print('update LoaiKhenThuong succcessfully'));
  }

  @override
  Future<LoaiKhenThuong?> getLastLoaiKhenThuong() async {
    List<LoaiKhenThuong> listLKT = [];
    await loaiKhenThuongs
        .orderBy('maLKT', descending: true)
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        listLKT
            .add(LoaiKhenThuong.fromJson(doc.data() as Map<String, dynamic>));
      }
    });

    return Future.value(listLKT[0]);
  }
}
