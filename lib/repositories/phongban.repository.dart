import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quanlynhanvien/models/phongban.model.dart';

abstract class PhongBanRepository {
  Future<void> addPhongBan(PhongBan phongBan);
  Future<List<PhongBan>> getAllPhongBan();
  Future<PhongBan> getPhongBan(String maPB);
  Future<void> delPhongBan(String maPB);
  Future<void> updPhongBan(PhongBan phongBan);
}

class PhongBanRepositoryImpl implements PhongBanRepository {
  CollectionReference phongBans =
      FirebaseFirestore.instance.collection('PhongBans');

  @override
  Future<void> addPhongBan(PhongBan phongBan) {
    return phongBans
        .doc(phongBan.maPB)
        .set(phongBan.toJson())
        .then((value) => print('add PhongBan successfully'));
  }

  @override
  Future<void> delPhongBan(String maPB) {
    return phongBans
        .doc(maPB)
        .delete()
        .then((value) => print('delete PhongBan successfully'));
  }

  @override
  Future<List<PhongBan>> getAllPhongBan() async {
    List<PhongBan> listPhongBan = [];
    await phongBans.get().then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        listPhongBan.add(PhongBan.fromJson(doc.data() as Map<String, dynamic>));
      }
    });

    return Future.value(listPhongBan);
  }

  @override
  Future<PhongBan> getPhongBan(String maPB) async {
    return await phongBans.doc(maPB).get().then((DocumentSnapshot doc) {
      final data = PhongBan.fromJson(doc.data() as Map<String, dynamic>);
      return Future.value(data);
    });
  }

  @override
  Future<void> updPhongBan(PhongBan phongBan) {
    return phongBans
        .doc(phongBan.maPB)
        .update(phongBan.toJson())
        .then((value) => print('update PhongBan succcessfully'));
  }
}
