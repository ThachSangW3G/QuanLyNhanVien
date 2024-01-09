import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quanlynhanvien/models/chucvu.model.dart';

abstract class ChucVuRepository {
  Future<void> addChucVu(ChucVu chucVu);
  Future<List<ChucVu>> getAllChucVu();
  Future<ChucVu?> getChucVu(String maCV);
  Future<void> delChucVu(String maCV);
  Future<void> updChucVu(ChucVu chucVu);
}

class ChucVuRepositoryImpl implements ChucVuRepository {
  CollectionReference chucVus =
      FirebaseFirestore.instance.collection('ChucVus');

  @override
  Future<void> addChucVu(ChucVu chucVu) {
    return chucVus
        .doc(chucVu.maCV)
        .set(chucVu.toJson())
        .then((value) => print('add chucVu successfully'));
  }

  @override
  Future<void> delChucVu(String maCV) {
    return chucVus
        .doc(maCV)
        .delete()
        .then((value) => print('delete chucVu successfully'));
  }

  @override
  Future<List<ChucVu>> getAllChucVu() async {
    List<ChucVu> listChucVu = [];
    await chucVus.get().then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        listChucVu.add(ChucVu.fromJson(doc.data() as Map<String, dynamic>));
      }
    });

    return Future.value(listChucVu);
  }

  @override
  Future<ChucVu?> getChucVu(String maCV) async {
    return await chucVus.doc(maCV).get().then((DocumentSnapshot doc) {
      final data = ChucVu.fromJson(doc.data() as Map<String, dynamic>);
      return Future.value(data);
    });
  }

  @override
  Future<void> updChucVu(ChucVu chucVu) {
    return chucVus
        .doc(chucVu.maCV)
        .update(chucVu.toJson())
        .then((value) => print('update ChucVu succcessfully'));
  }
}
