import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quanlynhanvien/models/phieuluonchinhthuc.model.dart';

abstract class PhieuLuongChinhThucRepository {
  Future<void> addPhieuLuong(PhieuLuongChinhThuc phieuLuong);
  Future<List<PhieuLuongChinhThuc>> getAllPhieuLuong();
  Future<PhieuLuongChinhThuc> getPhieuLuong(String maPL);
  Future<void> delPhieuLuong(String maPL);
  Future<void> updPhieuLuong(PhieuLuongChinhThuc phieuLuong);
  Future<bool> getExistPhieuLuong(String maNV, int thang, int nam);
  Future<List<PhieuLuongChinhThuc>> getPhieuLuongByThangNam(
      DateTime specificDate);
}

class PhieuLuongChinhThucRepositoryImpl
    implements PhieuLuongChinhThucRepository {
  CollectionReference phieuLuongs =
      FirebaseFirestore.instance.collection('PhieuLuongChinhThucs');

  @override
  Future<void> addPhieuLuong(PhieuLuongChinhThuc phieuLuong) {
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
  Future<List<PhieuLuongChinhThuc>> getAllPhieuLuong() async {
    List<PhieuLuongChinhThuc> listPhongBan = [];
    await phieuLuongs.get().then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        listPhongBan.add(
            PhieuLuongChinhThuc.fromJson(doc.data() as Map<String, dynamic>));
      }
    });

    return Future.value(listPhongBan);
  }

  @override
  Future<PhieuLuongChinhThuc> getPhieuLuong(String maPB) async {
    return await phieuLuongs.doc(maPB).get().then((DocumentSnapshot doc) {
      final data =
          PhieuLuongChinhThuc.fromJson(doc.data() as Map<String, dynamic>);
      return Future.value(data);
    });
  }

  @override
  Future<void> updPhieuLuong(PhieuLuongChinhThuc phieuLuong) {
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

  @override
  Future<List<PhieuLuongChinhThuc>> getPhieuLuongByThangNam(
      DateTime specificDate) async {
    try {
      List<PhieuLuongChinhThuc> listPLCT = [];
      await phieuLuongs
          .where('thang', isEqualTo: specificDate.month)
          .where('nam', isEqualTo: specificDate.year)
          .get()
          .then((QuerySnapshot querySnapshot) {
        for (var doc in querySnapshot.docs) {
          listPLCT.add(
              PhieuLuongChinhThuc.fromJson(doc.data() as Map<String, dynamic>));
        }
      });
      return Future.value(listPLCT);
    } catch (e) {
      return Future.value([]);
    }
  }
}
