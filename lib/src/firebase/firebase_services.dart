import 'package:artist_community/src/model/model_class.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<List<ImageModel>> getImages() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
    await _firestore.collection('categories').get();

    List<ImageModel> images = [];

    for (QueryDocumentSnapshot<Map<String, dynamic>> doc in querySnapshot.docs) {
      final imageUrl = await _storage.ref('categoryImage').getDownloadURL();
      images.add(ImageModel(imageUrl: imageUrl));
    }
    return images;
  }
}
