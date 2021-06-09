import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

// import '../constants.dart';
import 'package:frontend/data_models/user.dart';

class ServerProxy {
  static final database = FirebaseAuth.instance;
  static const double INITIAL_TOTAL = 0.0;

  static void getSupplierDocument() {}

  static Future<User> loginUser(String email, String password) async {
    print('I am here');
    UserCredential userCredential = await database.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential.user;
  }
  
  static Future<User> getActiveUser() async {
    return database.currentUser;
  }
}