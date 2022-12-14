import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_admin/models/category_model.dart';

class DBHelper {
  static const String collectionAdmin = 'admins';
  static const String collectionCategory = 'categories';
  static final FirebaseFirestore _db = FirebaseFirestore.instance;

  static Future<bool> isAdmin(String uid) async {
    final snapshot = await _db.collection(collectionAdmin).doc(uid).get();

    return snapshot.exists;
  }

  static Future<void> addNewCategory(CategoryModel categoryModel) {
    final doc = _db.collection(collectionCategory).doc();
    categoryModel.catId = doc.id;
    return doc.set(categoryModel.toMap());
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> getAllCategories() =>
      _db.collection(collectionCategory).snapshots();
}
