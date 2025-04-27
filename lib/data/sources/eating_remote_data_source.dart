import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

import '../models/eating_model.dart';

abstract class EatingRemoteDataSource {
  Stream<List<EatingModel>> watchAllEatings();
  Stream<List<EatingModel>> watchTodayEatings();
  Future<String> addEating(EatingModel model);
  Future<void> updateEating(EatingModel model);
  Future<void> deleteEating(String id);
  Future<EatingModel?> getEating(String id);
  Future<List<EatingModel>> getAllEatings();
}

@LazySingleton(as: EatingRemoteDataSource)
class EatingRemoteDataSourceImpl implements EatingRemoteDataSource {
  final FirebaseFirestore _firestore;

  EatingRemoteDataSourceImpl(this._firestore);

  CollectionReference<EatingModel> get _collection => _firestore
      .collection('eatings_test')
      .withConverter<EatingModel>(
        fromFirestore:
            (snapshot, _) => EatingModel.fromJson(
              snapshot.data()!,
            ).copyWith(id: snapshot.id),
        toFirestore: (model, _) => model.toJson(),
      );

  @override
  Stream<List<EatingModel>> watchAllEatings() {
    return _collection.snapshots().map(
      (snapshot) => snapshot.docs.map((doc) => doc.data()).toList(),
    );
  }

  @override
  Stream<List<EatingModel>> watchTodayEatings() {
    final DateTime today = DateTime.now();
    final DateTime startOfDay = DateTime(today.year, today.month, today.day);
    final DateTime endOfDay = startOfDay.add(const Duration(days: 1));

    return _collection
        .where(
          'eatDate',
          isGreaterThanOrEqualTo: Timestamp.fromDate(startOfDay),
        )
        .where('eatDate', isLessThan: Timestamp.fromDate(endOfDay))
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => doc.data()).toList());
  }

  @override
  Future<String> addEating(EatingModel model) async {
    final DocumentReference<EatingModel> ref = await _collection.add(model);
    return ref.id;
  }

  @override
  Future<void> updateEating(EatingModel model) async {
    if (model.id.isEmpty) {
      throw Exception('Document ID is required for update.');
    }
    await _collection.doc(model.id).set(model);
  }

  @override
  Future<void> deleteEating(String id) async {
    await _collection.doc(id).delete();
  }

  @override
  Future<EatingModel?> getEating(String id) async {
    final doc = await _collection.doc(id).get();
    return doc.data();
  }

  @override
  Future<List<EatingModel>> getAllEatings() async {
    final snapshot = await _collection.get();
    return snapshot.docs.map((doc) => doc.data()).toList();
  }
}
