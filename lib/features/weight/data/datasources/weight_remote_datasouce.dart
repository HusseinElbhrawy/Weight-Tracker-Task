import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:weight_tracker/core/utils/app_strings.dart';

abstract class WeightRemoteDataSource {
  Future<DocumentReference<Map<String, dynamic>>> saveWeight(double weight);
  Future<void> deleteWeight(String docsId);
  Future<void> updateWeight(String docsId, double newWeight);
}

class WeightRemoteDataSourceImplementation implements WeightRemoteDataSource {
  final FirebaseFirestore firebaseFirestore;

  WeightRemoteDataSourceImplementation({required this.firebaseFirestore});
  @override
  Future<DocumentReference<Map<String, dynamic>>> saveWeight(
      double weight) async {
    return await firebaseFirestore.collection(AppStrings.collectionName).add(
      {
        'date': Timestamp.now(),
        'weight': weight,
      },
    );
  }

  @override
  Future<void> deleteWeight(String docsId) async {
    return await firebaseFirestore
        .collection(AppStrings.collectionName)
        .doc(docsId)
        .delete();
  }

  @override
  Future<void> updateWeight(String docsId, double newWeight) async {
    return await firebaseFirestore
        .collection(AppStrings.collectionName)
        .doc(docsId)
        .update(
      {
        'weight': newWeight,
      },
    );
  }
}
