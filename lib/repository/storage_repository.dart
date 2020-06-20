import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:logger/logger.dart';
import 'package:parking/providers/image_upload_provider.dart';
import 'package:parking/repository/message_repository.dart';
import 'package:parking/repository/user_repository.dart';

class StorageRepository {
  Logger logger = Logger();

  static final Firestore _firestore = Firestore.instance;

  StorageReference _storageReference;

  /// Firestore에 사진 저장
  Future<String> uploadImageToStorage(File image) async {
    logger.d("FirebaseMethods uploadImageToStorage");

    try {
      _storageReference = FirebaseStorage.instance.ref().child('${DateTime.now().millisecondsSinceEpoch}');

      StorageUploadTask _storageUploadTask = _storageReference.putFile(image);
      var url = await (await _storageUploadTask.onComplete).ref.getDownloadURL();
      return url;

    } catch(e) {
      logger.e(e);
      return null;
    }
  }

  void uploadImage(File image, String receiverId, String senderId, ImageUploadProvider imageUploadProvider) async {
    logger.d("FirebaseMethods uploadImage");

    // loading
    imageUploadProvider.setToLoading();

    String url = await uploadImageToStorage(image);

    // hide loading
    imageUploadProvider.setToIdle();

    final MessageRepository chatMethods = MessageRepository();
    chatMethods.setImageMessage(url, receiverId, senderId);
  }

  Future<void> updateProfileImage(File image, String userId) async {
    logger.d("FirebaseMethods uploadImage");

    String url = await uploadImageToStorage(image);
    final UserRepository userRepository = UserRepository();
    await userRepository.setUserProfileImage(userId: userId, url: url);
  }
}