import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' hide UserInfo;
import 'package:frontend/data_models/stock.dart';
import 'package:frontend/data_models/strategy_model.dart';
import 'package:intl/intl.dart';
import 'package:frontend/data_models/user_info.dart';

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

  static Future<UserInfo> fetchUserInfo() async {
    DocumentSnapshot<Map<String, dynamic>> results = await ActiveUser.database
        .collection('users')
        .doc(ActiveUser.loggedInUser.uid)
        .get();
    Map<String, dynamic> data = results.data();
    UserInfo info = new UserInfo(
        ActiveUser.loggedInUser.email,
        data["First Name"],
        data["Middle Name"],
        data["Last Name"],
        data["Strategy"]);
    return info;
  }

  static Future<User> registerUser(String email, String password) async {
    UserCredential userCredential =
        await database.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential.user;
  }

  static getUserInfo() async {
    return await ActiveUser.database
        .collection('users')
        .doc(ActiveUser.loggedInUser.uid)
        .get();
  }

  static void writeUserInfo(
      String firstName, String lastName, String middleName, String strategy) {
    ActiveUser.database
        .collection('users')
        .doc(ActiveUser.loggedInUser.uid)
        .set({
      'First Name': firstName,
      'Last Name': lastName,
      'Middle Name': middleName,
      'Strategy': strategy,
    });
  }

  static Future<List<Map<String, dynamic>>> getUserHoldings() async {
    var stream = await ActiveUser.database
        .collection('users')
        .doc(ActiveUser.loggedInUser.uid)
        .collection('holdings')
        .get();
    return stream.docs.map((doc) => doc.data()).toList();
  }

  static Future<List<InvestmentStrategy>> getStrategies() async {
    List<InvestmentStrategy> strategies = [];

    QuerySnapshot<Map<String, dynamic>> results =
        await ActiveUser.database.collection('strategies').get();
    List<QueryDocumentSnapshot<Map<String, dynamic>>> resultsData =
        results.docs;
    resultsData.forEach((element) {
      Map<String, dynamic> currData = element.data();
      strategies.add(InvestmentStrategy(
          id: currData["Id"],
          strategyName: currData["Name"],
          lowerRiskBound: currData["Lower bound"],
          upperRiskBound: currData["Upper bound"],
          description: currData["Description"]));
    });
    return strategies;
  }

  //   static Stream<QuerySnapshot> getStrategies(String supplierDocumentID) {
  //   return ActiveUser.database.collection('strategies').get().snapshots();
  // }

  static Stream<QuerySnapshot> get(String supplierDocumentID) {
    return ActiveUser.database.collection('strategies').snapshots();
  }

  static Future<User> getActiveUser() async {
    return database.currentUser;
  }

  static getUserData() async {
    var holdings = getUserHoldings();
    print(holdings);
  }
}
