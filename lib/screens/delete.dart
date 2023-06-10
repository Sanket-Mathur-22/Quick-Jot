import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;

Future<void> deleteDocument(String collectionName, String documentId) async {
  await _firestore.collection(collectionName).doc(documentId).delete();
}
