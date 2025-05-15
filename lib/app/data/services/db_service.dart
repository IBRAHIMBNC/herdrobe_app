import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:herdrobe_app/app/data/models/product.dart';
import 'package:herdrobe_app/app/data/models/user.dart';
import 'package:herdrobe_app/app/data/services/auth_service.dart';
import 'package:herdrobe_app/main.dart';

class DbService extends GetxService {
  final CollectionReference usersReference = FirebaseFirestore.instance
      .collection('Users');

  final CollectionReference productsReference = FirebaseFirestore.instance
      .collection('Products');

  final orderRef = FirebaseFirestore.instance.collection('Orders');

  String? get currentUserId {
    final authService = Get.find<AuthService>();
    final user = authService.currentUser;
    return user.value?.uid;
  }

  String get generateDocId {
    return productsReference.doc().id;
  }

  CollectionReference get getCartReference {
    final authService = Get.find<AuthService>();
    final user = authService.currentUser;
    return FirebaseFirestore.instance
        .collection('Carts')
        .doc(user.value?.uid)
        .collection('Items');
  }

  //=========================================
  // Add and Update User Data in Firestore
  //=========================================

  Future<void> addUser(AppUser user) async {
    await usersReference.doc(user.uid).set(user.toMap());
  }

  Future<void> updateUser(AppUser user, {bool isUpdateUserOnly = false}) async {
    DocumentReference userRef = usersReference.doc(user.uid);
    DocumentSnapshot userSnapshot = await userRef.get();

    if (userSnapshot.exists) {
      await userRef.update(user.toMap());
    }
  }

  Future<AppUser?> fetchUserData(User user) async {
    final doc = await usersReference.doc(user.uid).get();
    if (!doc.exists) {
      return null;
    }
    final appUser = AppUser.fromMap(doc.data() as Map<String, dynamic>);

    return appUser;
  }

  Future<void> deleteUser(String userId) async {
    await usersReference.doc(userId).delete().then((value) {
      infoLog.i('userDataDeleted');
    });
  }

  //=========================================
  // Product Related Methods
  //=========================================

  Future<void> addProduct(ProductModel product) async {
    await productsReference.doc(product.id).set(product.toMap()).catchError((
      error,
    ) {
      errorLog.e('Error adding product: $error');
    });
  }

  Future<void> updateProduct(ProductModel product) async {
    await productsReference.doc(product.id).update(product.toMap()).catchError((
      error,
    ) {
      errorLog.e('Error updating product: $error');
    });
  }

  Future<void> deleteProduct(ProductModel product) async {
    product.imageUrls.forEach((url) {
      deleteFileByUrl(url);
    });
    await productsReference.doc(product.id).delete().catchError((error) {
      errorLog.e('Error deleting product: $error');
    });
  }

  Future<List<ProductModel>> fetchUserProducts() async {
    final authService = Get.find<AuthService>();
    final user = authService.currentUser;
    try {
      final snapshot =
          await productsReference
              .where('sellerUid', isEqualTo: user.value?.uid)
              .get();

      return snapshot.docs
          .map(
            (doc) => ProductModel.fromMap(doc.data() as Map<String, dynamic>),
          )
          .toList();
    } catch (e) {
      errorLog.e('Error fetching user products: $e');
      return [];
    }
  }

  Future<List<String>> uploadProductImages({
    List<File> files = const [],
    required String productId,
  }) async {
    try {
      final String path = 'Products/$productId';

      final result = await Future.wait(
        List.generate(
          files.length,
          (index) => _uploadImageToFireStore(
            file: files[index],
            path: path,
            fileName: 'image_${index + 1}',
          ),
        ),
      );
      return result;
    } catch (e) {
      errorLog.e('Error uploading product images: $e');
      return [];
    }
  }

  //=========================================
  // Upload File to Firebase Storage
  //=========================================
  Future<String> _uploadImageToFireStore({
    required File file,
    required String fileName,
    required String path,
  }) async {
    try {
      // Validate file
      if (!file.existsSync()) {
        throw Exception('File does not exist');
      }

      final imgExtension = file.path.split('.').last;
      if (imgExtension.isEmpty) {
        throw Exception('Invalid file extension');
      }

      final ref = FirebaseStorage.instance
          .ref()
          .child(path)
          .child(fileName + '.' + imgExtension);

      // Check if the file already exists and delete it
      try {
        await ref.getDownloadURL();
        await ref.delete();
      } catch (e) {
        // File does not exist, proceed without deletion
      }

      // Upload the file
      await ref.putFile(
        file,
        SettableMetadata(contentType: 'image/$imgExtension'),
      );

      // Return the download URL
      return await ref.getDownloadURL();
    } on FirebaseException catch (e) {
      errorLog.e('Firebase Storage error: ${e.message}');
      throw Exception('Failed to upload image: ${e.message}');
    } catch (e) {
      errorLog.e('Unexpected error: $e');
      throw Exception('An unexpected error occurred: $e');
    }
  }

  deleteFileByUrl(String path) async {
    try {
      FirebaseStorage storage = FirebaseStorage.instance;
      Reference firebaseStorageRef = storage.refFromURL(path);
      await firebaseStorageRef.delete();
    } catch (e) {
      errorLog.e('Error Deleting File: $e');
    }
  }

  Future<String?> uploadProfileImage({required File file}) async {
    try {
      final String path = 'Profiles';
      return await _uploadImageToFireStore(
        file: file,
        fileName: currentUserId!,
        path: path,
      );
    } catch (e) {
      errorLog.e('Error uploading profile image: $e');
      return null;
    }
  }
}
