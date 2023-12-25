import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quanlynhanvien/models/kyluat.model.dart';

abstract class KyLuatRepositoryAbs {
  Future<void> addKyLuat(KyLuat kyLuat);
  Future<List<KyLuat>> getAllKyLuat();
  Future<KyLuat> getKyLuat(String maKL);
  Future<void> delKyLuat(String maKL);
  Future<void> updKyLuat(KyLuat kyLuat);
}

class KyLuatRepository implements KyLuatRepositoryAbs {
  CollectionReference kyLuats =
      FirebaseFirestore.instance.collection('KyLuats');

  @override
  Future<void> addKyLuat(KyLuat kyLuat) {
    return kyLuats
        .doc(kyLuat.maKL)
        .set(kyLuat.toJson())
        .then((value) => print('add KyLuat successfully'));
  }

  @override
  Future<void> delKyLuat(String maKL) {
    return kyLuats
        .doc(maKL)
        .delete()
        .then((value) => print('delete KyLuat successfully'));
  }

  @override
  Future<List<KyLuat>> getAllKyLuat() async {
    List<KyLuat> listKyLuat = [];
    await kyLuats.get().then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        listKyLuat.add(KyLuat.fromJson(doc.data() as Map<String, dynamic>));
      }
    });

    return Future.value(listKyLuat);
  }

  @override
  Future<KyLuat> getKyLuat(String maKL) async {
    return await kyLuats.doc(maKL).get().then((DocumentSnapshot doc) {
      final data = KyLuat.fromJson(doc.data() as Map<String, dynamic>);
      return Future.value(data);
    });
  }

  @override
  Future<void> updKyLuat(KyLuat kyLuat) {
    return kyLuats
        .doc(kyLuat.maKL)
        .update(kyLuat.toJson())
        .then((value) => print('update KyLuat succcessfully'));
  }
}
