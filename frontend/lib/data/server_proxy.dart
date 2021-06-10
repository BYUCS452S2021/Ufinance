import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:frontend/data_models/stock.dart';
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
        .doc(ActiveUser.loggedInUser.uid).get(); 
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

  static getUserHoldings() async {
    var stream = await ActiveUser.database
        .collection('users')
        .doc(ActiveUser.loggedInUser.uid)
        .collection('holdings').get();  
    return stream.docs.map((doc) => doc.data()).toList();
    
  }

  static Stream<QuerySnapshot> getStrategies(String supplierDocumentID) {
    return ActiveUser.database.collection('strategies').snapshots();
  }

  static Stream<QuerySnapshot> get(String supplierDocumentID) {
    return ActiveUser.database.collection('strategies').snapshots();
  }

  static Future<User> getActiveUser() async {
    return database.currentUser;
  }

  static getStockPrice(date, stockTicker) async { 
    var holdingWorth; 
    var document = await ActiveUser.database.collection('stock_prices').doc(stockTicker)
    .collection('Prices').doc(date).get();

    return document;
  }

  static getPortfolioValue() async {
    var dayString = '06-09-2021'; 
    var holdings = await getUserHoldings();
    print(holdings);
    print(holdings);
    var total = 0.0; 
    for(var i = 0; i < holdings.length; i++){
      print(holdings[i]['Ticker']);
      var document = await getStockPrice(dayString, holdings[i]['Ticker']); 
      total += double.parse(document.get('Price')) * int.parse(holdings[i]['quantity']);
    }
    return total.toStringAsFixed(2); 
  }
}
