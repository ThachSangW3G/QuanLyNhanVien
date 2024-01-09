import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quanlynhanvien/models/phucap.model.dart';

abstract class PhuCapRepository {
  Future<void> addPhuCap(PhuCap phuCap);
  Future<List<PhuCap>> getAllPhuCap();
  Future<PhuCap> getPhuCap(String maCV);
  Future<void> delPhuCap(String maCV);
  Future<void> updPhuCap(PhuCap chucVu);
  Future<PhuCap?> getLastPhuCap();
}

class PhuCapRepositoryImpl implements PhuCapRepository {
  CollectionReference phuCaps =
      FirebaseFirestore.instance.collection('PhuCaps');

  @override
  Future<void> addPhuCap(PhuCap phuCap) {
    return phuCaps
        .doc(phuCap.maPC)
        .set(phuCap.toJson())
        .then((value) => print('add chucVu successfully'));
  }

  @override
  Future<void> delPhuCap(String maCV) {
    return phuCaps
        .doc(maCV)
        .delete()
        .then((value) => print('delete chucVu successfully'));
  }

  @override
  Future<List<PhuCap>> getAllPhuCap() async {
    List<PhuCap> listChucVu = [];
    await phuCaps.get().then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        listChucVu.add(PhuCap.fromJson(doc.data() as Map<String, dynamic>));
      }
    });

    return Future.value(listChucVu);
  }

  @override
  Future<PhuCap> getPhuCap(String maCV) async {
    return await phuCaps.doc(maCV).get().then((DocumentSnapshot doc) {
      final data = PhuCap.fromJson(doc.data() as Map<String, dynamic>);
      return Future.value(data);
    });
  }

  @override
  Future<void> updPhuCap(PhuCap phuCap) {
    return phuCaps
        .doc(phuCap.maPC)
        .update(phuCap.toJson())
        .then((value) => print('update ChucVu succcessfully'));
  }

  @override
  Future<PhuCap?> getLastPhuCap() async {
    List<PhuCap> listLKT = [];
    await phuCaps
        .orderBy('maPC', descending: true)
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        listLKT.add(PhuCap.fromJson(doc.data() as Map<String, dynamic>));
      }
    });

    return Future.value(listLKT[0]);
  }
}
