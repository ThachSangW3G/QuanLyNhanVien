import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quanlynhanvien/models/hopdonglaodong.model.dart';

abstract class HopDongLaoDongRepositoryAbs {
  Future<void> addHopDongLapDong(HopDongLaoDong hopDongLaoDong);
  Future<List<HopDongLaoDong>> getAllHopDongLaoDong();
  Future<HopDongLaoDong> getHopDongLaoDong(String maHD);
  Future<void> delHopDongLaoDong(String maHD);
  Future<void> updHopDongLaoDong(HopDongLaoDong hopDongLaoDong);
}

class HopDongLaoDongRepository implements HopDongLaoDongRepositoryAbs {
  CollectionReference hopDongLaoDongs =
      FirebaseFirestore.instance.collection('HopDongLaoDongs');

  @override
  Future<void> addHopDongLapDong(HopDongLaoDong hopDongLaoDong) {
    return hopDongLaoDongs
        .doc(hopDongLaoDong.maHD)
        .set(hopDongLaoDong.toJson())
        .then((value) => print('add hopDongLaoDong successfully'));
  }

  @override
  Future<void> delHopDongLaoDong(String maHD) {
    return hopDongLaoDongs
        .doc(maHD)
        .delete()
        .then((value) => print('delete hopDongLaoDong successfully'));
  }

  @override
  Future<List<HopDongLaoDong>> getAllHopDongLaoDong() async {
    List<HopDongLaoDong> listHDLD = [];
    await hopDongLaoDongs.get().then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        listHDLD
            .add(HopDongLaoDong.fromJson(doc.data() as Map<String, dynamic>));
      }
    });

    return Future.value(listHDLD);
  }

  @override
  Future<HopDongLaoDong> getHopDongLaoDong(String maHD) async {
    return await hopDongLaoDongs.doc(maHD).get().then((DocumentSnapshot doc) {
      final data = HopDongLaoDong.fromJson(doc.data() as Map<String, dynamic>);
      return Future.value(data);
    });
  }

  @override
  Future<void> updHopDongLaoDong(HopDongLaoDong hopDongLaoDong) {
    return hopDongLaoDongs
        .doc(hopDongLaoDong.maHD)
        .update(hopDongLaoDong.toJson())
        .then((value) => print('update hopDongLaoDong succcessfully'));
  }
}
