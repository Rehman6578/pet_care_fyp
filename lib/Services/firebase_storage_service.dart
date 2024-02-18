import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

class FirebaseStorageService {
  final firebaseStorage = FirebaseStorage.instance;
  final firebaseAuth = FirebaseAuth.instance;
  Future<String?> uploadToStorage({required File? file}) async {
    try {
      final Reference ref = firebaseStorage.ref().child(
          '${firebaseAuth.currentUser?.uid}/file${DateTime.now().microsecondsSinceEpoch}');
      UploadTask task = ref.putFile(file!);
      TaskSnapshot snapshot = await task;
      String url = await snapshot.ref.getDownloadURL();
      return url;
    } catch (e) {
      Get.snackbar('Storage Error', e.toString());
      return "";
    }
  }
}
