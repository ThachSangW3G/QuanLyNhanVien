import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quanlynhanvien/models/phieuluong.model.dart';

abstract class PhieuLuongRepository {
  Future<void> addPhieuLuong(PhieuLuong phieuLuong);
  Future<List<PhieuLuong>> getAllPhieuLuong();
  Future<PhieuLuong> getPhieuLuong(String maPL);
  Future<void> delPhieuLuong(String maPL);
  Future<void> updPhieuLuong(PhieuLuong phieuLuong);
  Future<bool> getExistPhieuLuong(String maNV, int thang, int nam);
}

class PhieuLuongRepositoryImpl implements PhieuLuongRepository {
  CollectionReference phieuLuongs =
      FirebaseFirestore.instance.collection('PhieuLuongs');

  @override
  Future<void> addPhieuLuong(PhieuLuong phieuLuong) {
    return phieuLuongs
        .doc(phieuLuong.maPL)
        .set(phieuLuong.toJson())
        .then((value) => print('add PhongBan successfully'));
  }

  @override
  Future<void> delPhieuLuong(String maPB) {
    return phieuLuongs
        .doc(maPB)
        .delete()
        .then((value) => print('delete PhongBan successfully'));
  }

  @override
  Future<List<PhieuLuong>> getAllPhieuLuong() async {
    List<PhieuLuong> listPhongBan = [];
    await phieuLuongs.get().then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        listPhongBan
            .add(PhieuLuong.fromJson(doc.data() as Map<String, dynamic>));
      }
    });

    return Future.value(listPhongBan);
  }

  @override
  Future<PhieuLuong> getPhieuLuong(String maPB) async {
    return await phieuLuongs.doc(maPB).get().then((DocumentSnapshot doc) {
      final data = PhieuLuong.fromJson(doc.data() as Map<String, dynamic>);
      return Future.value(data);
    });
  }

  @override
  Future<void> updPhieuLuong(PhieuLuong phieuLuong) {
    return phieuLuongs
        .doc(phieuLuong.maPL)
        .update(phieuLuong.toJson())
        .then((value) => print('update PhongBan succcessfully'));
  }

  @override
  Future<bool> getExistPhieuLuong(String maNV, int thang, int nam) async {
    QuerySnapshot awards = await phieuLuongs
        .where('maNV', isEqualTo: maNV)
        .where('thang', isEqualTo: thang)
        .where('nam', isEqualTo: nam)
        .get();

    print(maNV);
    print(awards.docs.isNotEmpty);
    return Future.value(awards.docs.isNotEmpty);
  }
}
