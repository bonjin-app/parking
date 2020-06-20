import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logger/logger.dart';
import 'package:parking/consts/strings.dart';
import 'package:parking/enums/user_state.dart';
import 'package:parking/models/user.dart';
import 'package:parking/utils/utilities.dart';

class UserRepository {
  Logger logger = Logger();

  static final Firestore _firestore = Firestore.instance;
  static final CollectionReference _userCollection = _firestore.collection(USER_COLLECTION);

  final FirebaseAuth _auth = FirebaseAuth.instance;
  GoogleSignIn _googleSignIn = GoogleSignIn();

  /// 최근 Firebase에 로그인한 사용자의 정보 획득
  Future<FirebaseUser> getCurrentUser() async {
    logger.d("FirebaseMethods getCurrentUser");

    FirebaseUser currentUser;
    currentUser = await _auth.currentUser();
    return currentUser;
  }

  /// Firestore에서 user 조회
  Future<User> getUserDetails() async {
    FirebaseUser currentUser = await _auth.currentUser();

    DocumentSnapshot documentSnapshot = await _userCollection.document(currentUser.uid).get();

    return User.fromMap(documentSnapshot.data);
  }

  ///
  Future<User> getUserDetailsById(id) async {
    try {
      DocumentSnapshot documentSnapshot = await _userCollection.document(id).get();
      return User.fromMap(documentSnapshot.data);

    } catch(e) {
      print(e);
      return null;
    }
  }

  /// Google 계정을 이용하여 Firebase에 로그인
  Future<FirebaseUser> signInWithGoogle() async {
    logger.d("FirebaseMethods signInWithGoogle");

    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);
    final FirebaseUser user = (await _auth.signInWithCredential(credential)).user;
    return user;
  }

  /// Firestore의 user 인증 true: 신규, false: 기존
  Future<bool> authenticateUser(FirebaseUser user) async {
    logger.d("FirebaseMethods authenticateUser");

    QuerySnapshot result = await _firestore
        .collection(USER_COLLECTION)
        .where(EMAIL_FIELD, isEqualTo: user.email)
        .getDocuments();

    final List<DocumentSnapshot> docs = result.documents;

    return docs.length == 0;
  }

  /// Firestore에 user 저장
  Future<void> addDataToDB(FirebaseUser currentUser) async {
    logger.d("FirebaseMethods addDataToDB");

    String username = Utils.getUsername(currentUser.email);

    User user = User(
      uid: currentUser.uid,
      email: currentUser.email,
      name: currentUser.displayName,
      profilePhoto: currentUser.photoUrl,
      username: username,
    );

    _firestore
        .collection(USER_COLLECTION)
        .document(currentUser.uid)
        .setData(user.toMap(user));
  }

  /// Firestore 전체 user 조회
  Future<List<User>> fetchAllUsers() async {
    logger.d("FirebaseMethods fetchAllUsers");

    FirebaseUser user = await _auth.currentUser();
    List<User> userList = List<User>();

    QuerySnapshot querySnapshot = await _firestore.collection(USER_COLLECTION).getDocuments();
    for (var i = 0; i < querySnapshot.documents.length; i++) {
      if (querySnapshot.documents[i].documentID != user.uid) {
        userList.add(User.fromMap(querySnapshot.documents[i].data));
      }
    }
    return userList;
  }

  /// Firebase user signOut
  Future<bool> signOut() async {
    logger.d("FirebaseMethods signOut");

    try {
//    await _googleSignIn.disconnect();
      await _googleSignIn.signOut();
      await _auth.signOut();
      return true;

    } catch(e) {
      return false;
    }
  }

  /// Firebase user Profile Image 변경
  Future<void> setUserProfileImage({String userId, String url}) async {
    await _userCollection.document(userId).updateData({
      "profilePhoto": url,
    });
  }

  /// Firebase user 상태 변경
  void setUserState({String userId, UserState userState}) {
    String stateNum = Utils.stateToString(userState);

    _userCollection.document(userId).updateData({
      "state": stateNum,
    });
  }

  ///
  Stream<DocumentSnapshot> getUserStream({String uid}) {
    return _userCollection.document(uid).snapshots();
  }
}