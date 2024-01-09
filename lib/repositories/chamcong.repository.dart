import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quanlynhanvien/models/chamcong.model.dart';

abstract class ChamCongRepository {
  Future<void> addChamCong(ChamCong chamCong);
  Stream<List<ChamCong>> getChamCongByDate(DateTime specificDate);
  Future<ChamCong> getChamCong(String maCC);
  Future<void> delChamCong(String maCC);
  Future<void> updChamCong(ChamCong chamCong);
  Stream<List<ChamCong>> getChamCongByMaNVAndMonth(
      String maNV, DateTime specificDate);
}

class ChamCongRepositoryImpl implements ChamCongRepository {
  CollectionReference chamCongs =
      FirebaseFirestore.instance.collection('ChamCongs');

  @override
  Future<void> addChamCong(ChamCong chamCong) {
    return chamCongs
        .doc(chamCong.maCC)
        .set(chamCong.toJson())
        .then((value) => print('add chamCong successfully'));
  }

  @override
  Future<void> delChamCong(String maCC) {
    return chamCongs
        .doc(maCC)
        .delete()
        .then((value) => print('delete chamCong successfully'));
  }

  List<ChamCong> _recipeListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs
        .map((doc) => ChamCong.fromJson(doc.data() as Map<String, dynamic>))
        .toList();
  }

  @override
  Stream<List<ChamCong>> getChamCongByDate(DateTime specificDate) {
    Timestamp startTimestamp = Timestamp.fromDate(DateTime(specificDate.year,
        specificDate.month, specificDate.day, 0, 0, 0, 0, 0));
    Timestamp endTimestamp = Timestamp.fromDate(DateTime(specificDate.year,
        specificDate.month, specificDate.day, 23, 59, 59, 999, 999));
    return chamCongs
        .where('ngayCC', isGreaterThanOrEqualTo: startTimestamp)
        .where('ngayCC', isLessThanOrEqualTo: endTimestamp)
        .snapshots()
        .map(_recipeListFromSnapshot);
  }

  @override
  Stream<List<ChamCong>> getChamCongByMaNVAndMonth(
      String maNV, DateTime specificDate) {
    DateTime firstDayOfMonth =
        DateTime(specificDate.year, specificDate.month, 1);
    DateTime lastDayOfMonth =
        DateTime(specificDate.year, specificDate.month + 1, 0);

    Timestamp startTimestamp = Timestamp.fromDate(firstDayOfMonth);
    Timestamp endTimestamp = Timestamp.fromDate(DateTime(lastDayOfMonth.year,
        lastDayOfMonth.month, lastDayOfMonth.day, 23, 59, 59, 999, 999));
    return chamCongs
        .where('ngayCC', isGreaterThanOrEqualTo: startTimestamp)
        .where('ngayCC', isLessThanOrEqualTo: endTimestamp)
        .where('maNV', isEqualTo: maNV)
        .snapshots()
        .map(_recipeListFromSnapshot);
  }

  @override
  Future<ChamCong> getChamCong(String maCC) async {
    return await chamCongs.doc(maCC).get().then((DocumentSnapshot doc) {
      final data = ChamCong.fromJson(doc.data() as Map<String, dynamic>);
      return Future.value(data);
    });
  }

  @override
  Future<void> updChamCong(ChamCong chamCong) {
    return chamCongs
        .doc(chamCong.maCC)
        .update(chamCong.toJson())
        .then((value) => print('update ChamCong succcessfully'));
  }
}
