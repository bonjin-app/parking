import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:logger/logger.dart';
import 'package:parking/consts/strings.dart';

class MessageProvider with ChangeNotifier {
  Logger logger = Logger();

  Stream<QuerySnapshot> messageStream({String senderId, String receiverId}) {
    return Firestore.instance
        .collection(MESSAGE_COLLECTION)
        .document(senderId)
        .collection(receiverId)
        .orderBy(TIMESTAMP_FIELD, descending: true)
        .snapshots();
  }
}