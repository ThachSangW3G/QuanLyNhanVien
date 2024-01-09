import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quanlynhanvien/models/khenthuong.model.dart';

abstract class KhenThuongRepository {
  Future<void> addKhenThuong(KhenThuong khenThuong);
  Future<List<KhenThuong>> getAllKhenThuong();
  Future<KhenThuong> getKhenThuong(String maKT);
  Future<void> delKhenThuong(String maKT);
  Future<void> updKhenThuong(KhenThuong khenThuong);
  Future<KhenThuong?> getLastKhenThuong();
  Future<int> getTongTienThuong(String maNV, DateTime specificDate);
}

class KhenThuongRepositoryImpl implements KhenThuongRepository {
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

  @override
  Future<KhenThuong?> getLastKhenThuong() async {
    List<KhenThuong> listLKT = [];
    await khenThuongs
        .orderBy('maKT', descending: true)
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        listLKT.add(KhenThuong.fromJson(doc.data() as Map<String, dynamic>));
      }
    });

    return Future.value(listLKT[0]);
  }

  @override
  Future<int> getTongTienThuong(String maNV, DateTime specificDate) async {
    try {
      Timestamp startTimestamp = Timestamp.fromDate(DateTime(specificDate.year,
          specificDate.month, specificDate.day, 0, 0, 0, 0, 0));
      Timestamp endTimestamp = Timestamp.fromDate(DateTime(specificDate.year,
          specificDate.month, specificDate.day, 23, 59, 59, 999, 999));

      final listKhenThuong = await khenThuongs
          .where('ngayKT', isGreaterThanOrEqualTo: startTimestamp)
          .where('ngayKT', isLessThanOrEqualTo: endTimestamp)
          .where('maNV', isEqualTo: maNV)
          .orderBy('ngayKT', descending: false)
          .get();
      int tongTien = 0;
      List<KhenThuong> listLKT = [];
      listKhenThuong.docs.forEach((award) {
        listLKT.add(KhenThuong.fromJson(award.data() as Map<String, dynamic>));
      });
      listLKT.forEach((element) {
        tongTien += element.soTienThuong;
      });

      return Future.value(tongTien);
    } catch (e) {
      print(e);
      return Future.value(0);
    }
  }

  List<KhenThuong> _recipeListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs
        .map((doc) => KhenThuong.fromJson(doc.data() as Map<String, dynamic>))
        .toList();
  }
}
