import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logger/logger.dart';
import 'package:parking/consts/strings.dart';
import 'package:parking/models/contact.dart';
import 'package:parking/models/message.dart';
import 'package:parking/models/user.dart';

class MessageRepository {
  Logger logger = Logger();

  static final Firestore _firestore = Firestore.instance;

  final CollectionReference _messageCollection = _firestore.collection(MESSAGE_COLLECTION);
  final CollectionReference _userCollection = _firestore.collection(USER_COLLECTION);

  /// Firestore에 message 저장
  Future<void> addMessageToDB(Message message, User sender, User receiver) async {
    logger.d("FirebaseMethods addMessageToDB");

    var map = message.toMap();

    await _messageCollection
        .document(message.senderId)
        .collection(message.receiverId)
        .add(map);

    addToContacts(
      senderId: message.senderId,
      receiverId: message.receiverId
    );

    await _messageCollection
        .document(message.receiverId)
        .collection(message.senderId)
        .add(map);
  }

  ///
  DocumentReference getContactsDocument({String of, String forContact}) {
    return _userCollection
        .document(of)
        .collection(CONTACT_COLLECTION)
        .document(forContact);
  }

  ///
  addToContacts({String senderId, String receiverId}) async {
    Timestamp currentTime = Timestamp.now();

    await addToSendersContact(senderId, receiverId, currentTime);
    await addToReceiverContact(senderId, receiverId, currentTime);
  }

  ///
  Future<void> addToSendersContact(String senderId, String receiverId, currentTime) async {
    DocumentSnapshot senderSnapshot = await getContactsDocument(of: senderId, forContact: receiverId).get();

    if (!senderSnapshot.exists) {
      // does not exists
      Contact receiverContact = Contact(
        uid: receiverId,
        addedOn: currentTime,
      );

      var receiverMap = receiverContact.toMap(receiverContact);
      getContactsDocument(of: senderId, forContact: receiverId)
          .setData(receiverMap);
    }
  }

  ///
  Future<void> addToReceiverContact(String senderId, String receiverId, currentTime) async {
    DocumentSnapshot receiverSnapshot = await getContactsDocument(of: receiverId, forContact: senderId).get();

    if (!receiverSnapshot.exists) {
      // does not exists
      Contact senderContact = Contact(
        uid: senderId,
        addedOn: currentTime,
      );

      var senderMap = senderContact.toMap(senderContact);

      getContactsDocument(of: receiverId, forContact: senderId)
          .setData(senderMap);
    }
  }

  ///
  void setImageMessage(String url, String receiverId, String senderId) async {
    logger.d("FirebaseMethods setImageMessage");

    Message _message;

    _message = Message.imageMessage(
      type: 'image',
      message: "IMAGE",
      receiverId: receiverId,
      senderId: senderId,
      photoUrl: url,
      timestamp: Timestamp.now(),
    );

    // create image map
    var map = _message.toImageMap();

    // Set the data to database
    await _messageCollection
        .document(_message.senderId)
        .collection(_message.receiverId)
        .add(map);

    await _messageCollection
        .document(_message.receiverId)
        .collection(_message.senderId)
        .add(map);
  }

  Stream<QuerySnapshot> fetchContacts({String userId}) => _userCollection
      .document(userId)
      .collection(CONTACT_COLLECTION)
      .snapshots();

  Stream<QuerySnapshot> fetchLastMessageBetween(
          {String senderId, receiverId}) =>
      _messageCollection
          .document(senderId)
          .collection(receiverId)
          .orderBy(TIMESTAMP_FIELD)
          .snapshots();
}