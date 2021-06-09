// class User {
//   final int userId;
//   final String emailAddress;
//   final String firstName;
//   final String middleName;
//   final String lastName;
//   final int investmentStrategy;
//   String token;

//   User(
//     this.userId,
//     this.emailAddress,
//     this.firstName,
//     this.middleName,
//     this.lastName,
//     this.investmentStrategy,
//     this.token,
//   );
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ActiveUser {
  static final ActiveUser _singleton = ActiveUser._internal();
  static User _loggedInUser;
  static FirebaseFirestore _database = FirebaseFirestore.instance;

  factory ActiveUser() {
    return _singleton;
  }

  void setLoggedInUser(User loggedInUser) {
    _loggedInUser = loggedInUser;
  }

  User getUser() {
    return _loggedInUser;
  }

  void logOutUser() {
    _loggedInUser = null;
  }

  static FirebaseFirestore get database => _database;

  static User get loggedInUser => _loggedInUser;

  ActiveUser._internal();
}

// class AppUser{
//   var user; 
//   var uid; 
//   var userEmail; 
//   final FirebaseAuth _auth = FirebaseAuth.instance;


//   void registerNewUser(String email, String password){
//     this.user = registerWithEmailPassword(email, password); 
//   }

//   void loginUser(String email, String password){
//     this.user = signInWithEmailPassword(email, password)
//   }

//   Future<User> registerWithEmailPassword(String email, String password) async {
//     await Firebase.initializeApp();
//     try {
//       UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
//       email:email, 
//       password: password); 
//       user = userCredential.user;
//       if (user != null){
//         this.uid = user.uid; 
//         this.userEmail = user.email; 
//       }
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'weak-password') {
//         print('The password provided is too weak.');
//       } else if (e.code == 'email-already-in-use') {
//         print('An account already exists for that email.');
//       }
//     } catch (e) {
//       print(e);
//     }
//     return user; 
//   }

//   Future<User> signInWithEmailPassword(String email, String password) async {
//   await Firebase.initializeApp();

//   try {
//     UserCredential userCredential = await _auth.signInWithEmailAndPassword(
//       email: email,
//       password: password,
//     );
//     user = userCredential.user;

//     if (user != null) {
//       uid = user.uid;
//       userEmail = user.email;

//       // SharedPreferences prefs = await SharedPreferences.getInstance();
//       // await prefs.setBool('auth', true);
//     }
//   } on FirebaseAuthException catch (e) {
//     if (e.code == 'user-not-found') {
//       print('No user found for that email.');
//     } else if (e.code == 'wrong-password') {
//       print('Wrong password provided.');
//     }
//   }

//   return user;
// }

// }

