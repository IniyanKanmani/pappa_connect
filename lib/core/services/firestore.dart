import 'package:cloud_firestore/cloud_firestore.dart';

class Firestore {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<String> createDocument({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    final CollectionReference collection = firestore.collection(path);
    final DocumentReference document = await collection.add(data);

    return document.id;
  }
}
