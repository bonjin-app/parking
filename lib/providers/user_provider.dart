import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';
import 'package:parking/models/user.dart';
import 'package:parking/repository/storage_repository.dart';
import 'package:parking/repository/user_repository.dart';

class UserProvider with ChangeNotifier {
  Logger logger = Logger();

  User _user;
  final UserRepository _userRepository = UserRepository();

  User get user => _user;

  Future<void> refreshUser() async {
    logger.d("UserProvider refreshUser");

    User user = await _userRepository.getUserDetails();
    _user = user;
    notifyListeners();
  }

  Future<void> updateProfileImage(File image) async {
    logger.d("UserProvider updateProfileImage");

    var storageRepository = StorageRepository();
    await storageRepository.updateProfileImage(image, user.uid);

    await refreshUser();
  }

}