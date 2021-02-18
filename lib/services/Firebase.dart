import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  static FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  static User firebaseUser;
  static FirebaseFirestore firebaseFirestore;
  CollectionReference users;

  init() {
    FirebaseFirestore.instance.settings = Settings(
        persistenceEnabled: true, sslEnabled: true, cacheSizeBytes: 100000000);

    firebaseFirestore = FirebaseFirestore.instance;
  }

  static addUser(Map<String, dynamic> data) {
    firebaseFirestore
        .collection("Users")
        .doc(firebaseAuth.currentUser.uid)
        .set(data);
  }

  static Future<DocumentSnapshot>getUser() {
    print('current user ==> ${firebaseAuth.currentUser.uid}');
   return firebaseFirestore
        .collection("Users")
        .doc(firebaseAuth.currentUser.uid)
        .get();
  }


  static Future <void> updateUser(Map<String, dynamic> data) {
   return  firebaseFirestore
        .collection("Users")
        .doc(firebaseAuth.currentUser.uid)
        .update(data);
  }

  static Future <void>setLeaderBoard(Map<String, dynamic> data) {
    return  firebaseFirestore
        .collection("LeaderBoard")
        .doc(firebaseAuth.currentUser.uid)
        .set(data);
  }

  static Future<QuerySnapshot>getLeaderBoard() {
    return firebaseFirestore
        .collection("LeaderBoard").get();
  }
}
