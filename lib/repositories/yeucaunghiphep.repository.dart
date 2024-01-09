import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quanlynhanvien/models/yeucaunghiphep.model.dart';

abstract class YeuCauNghiPhepRepository {
  Future<void> addYeuCauNghiPhep(YeuCauNghiPhep yeuCauNghiPhep);
  Stream<List<YeuCauNghiPhep>> getAllYeuCauNghiPhep();
  Future<YeuCauNghiPhep> getYeuCauNghiPhep(String maYCNP);
  Future<void> delYeuCauNghiPhep(String maYCNP);
  Future<void> updYeuCauNghiPhep(YeuCauNghiPhep yeuCauNghiPhep);
}

class YeuCauNghiPhepRepositoryImpl implements YeuCauNghiPhepRepository {
  CollectionReference yeuCauNghiPheps =
      FirebaseFirestore.instance.collection('YeuCauNghiPheps');

  @override
  Future<void> addYeuCauNghiPhep(YeuCauNghiPhep yeuCauNghiPhep) {
    return yeuCauNghiPheps
        .doc(yeuCauNghiPhep.maYCNP)
        .set(yeuCauNghiPhep.toJson())
        .then((value) => print('add yeuCauNghiPhep successfully'));
  }

  @override
  Future<void> delYeuCauNghiPhep(String maYCNP) {
    return yeuCauNghiPheps
        .doc(maYCNP)
        .delete()
        .then((value) => print('delete yeuCauNghiPhep successfully'));
  }

  List<YeuCauNghiPhep> _recipeListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs
        .map((doc) =>
            YeuCauNghiPhep.fromJson(doc.data() as Map<String, dynamic>))
        .toList();
  }

  @override
  Stream<List<YeuCauNghiPhep>> getAllYeuCauNghiPhep() {
    return yeuCauNghiPheps.snapshots().map(_recipeListFromSnapshot);
  }

  @override
  Future<YeuCauNghiPhep> getYeuCauNghiPhep(String maYCNP) async {
    return await yeuCauNghiPheps.doc(maYCNP).get().then((DocumentSnapshot doc) {
      final data = YeuCauNghiPhep.fromJson(doc.data() as Map<String, dynamic>);
      return Future.value(data);
    });
  }

  @override
  Future<void> updYeuCauNghiPhep(YeuCauNghiPhep yeuCauNghiPhep) {
    return yeuCauNghiPheps
        .doc(yeuCauNghiPhep.maYCNP)
        .update(yeuCauNghiPhep.toJson())
        .then((value) => print('update ChucVu succcessfully'));
  }
}
