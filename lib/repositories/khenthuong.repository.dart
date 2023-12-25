import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quanlynhanvien/models/khenthuong.model.dart';

abstract class KhenThuongRepositoryAbs {
  Future<void> addKhenThuong(KhenThuong khenThuong);
  Future<List<KhenThuong>> getAllKhenThuong();
  Future<KhenThuong> getKhenThuong(String maKT);
  Future<void> delKhenThuong(String maKT);
  Future<void> updKhenThuong(KhenThuong khenThuong);
}

class KhenThuongRepository implements KhenThuongRepositoryAbs {
  CollectionReference khenThuongs =
      FirebaseFirestore.instance.collection('KhenThuongs');

  @override
  Future<void> addKhenThuong(KhenThuong khenThuong) {
    return khenThuongs
        .doc(khenThuong.maKT)
        .set(khenThuong.toJson())
        .then((value) => print('add khenThuong successfully'));
  }

  @override
  Future<void> delKhenThuong(String maKT) {
    return khenThuongs
        .doc(maKT)
        .delete()
        .then((value) => print('delete khenThuong successfully'));
  }

  @override
  Future<List<KhenThuong>> getAllKhenThuong() async {
    List<KhenThuong> listKhenThuong = [];
    await khenThuongs.get().then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        listKhenThuong
            .add(KhenThuong.fromJson(doc.data() as Map<String, dynamic>));
      }
    });

    return Future.value(listKhenThuong);
  }

  @override
  Future<KhenThuong> getKhenThuong(String maKT) async {
    return await khenThuongs.doc(maKT).get().then((DocumentSnapshot doc) {
      final data = KhenThuong.fromJson(doc.data() as Map<String, dynamic>);
      return Future.value(data);
    });
  }

  @override
  Future<void> updKhenThuong(KhenThuong khenThuong) {
    return khenThuongs
        .doc(khenThuong.maKT)
        .update(khenThuong.toJson())
        .then((value) => print('update KhenThuong succcessfully'));
  }
}
