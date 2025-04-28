import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

import '../models/pickup_model.dart';

abstract class PickupRemoteDataSource {
  Stream<PickupModel> watchPickup();
  Future<String> addPickup(PickupModel model);
  Future<void> updatePickup(PickupModel model);
  Future<void> deletePickup(String id);
}

@LazySingleton(as: PickupRemoteDataSource)
class PickupRemoteDataSourceImpl implements PickupRemoteDataSource {
  final FirebaseFirestore _firestore;

  PickupRemoteDataSourceImpl(this._firestore);

  CollectionReference<PickupModel> get _collection => _firestore
      .collection('pickups_test')
      .withConverter<PickupModel>(
        fromFirestore:
            (snapshot, _) => PickupModel.fromJson(
              snapshot.data()!,
            ).copyWith(id: snapshot.id),
        toFirestore: (model, _) => model.toJson(),
      );

  @override
  Stream<PickupModel> watchPickup() {
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
        .map((snapshot) => snapshot.docs.map((doc) => doc.data()).toList()[0]);
  }

  @override
  Future<String> addPickup(PickupModel model) async {
    final DocumentReference<PickupModel> ref = await _collection.add(model);
    return ref.id;
  }

  @override
  Future<void> updatePickup(PickupModel model) async {
    if (model.id.isEmpty) {
      throw Exception('Document ID is required for update.');
    }
    await _collection.doc(model.id).set(model);
  }

  @override
  Future<void> deletePickup(String id) async {
    await _collection.doc(id).delete();
  }
}
