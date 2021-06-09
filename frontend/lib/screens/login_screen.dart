import 'package:flutter/material.dart';
import 'package:frontend/components/rounded_button.dart';
import 'package:frontend/constants.dart';
import 'package:frontend/screens/main_screen.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
// import 'package:frontend/screens/registration_screen.dart';
// import 'package:openapi/api.dart';
import 'package:frontend/data_models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:frontend/data/server_proxy.dart';


class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}


class _LoginScreenState extends State<LoginScreen> {
  bool showSpinner = false;
  var user;
  String email;
  String password;
  final FirebaseAuth _auth = FirebaseAuth.instance;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    height: 200.0,
                    child: Image.asset('../../assets/logo.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  email = value;
                },
                decoration:
                    TextFieldDecoration.copyWith(hintText: 'Enter your email'),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  password = value;
                },
                decoration: TextFieldDecoration.copyWith(
                    hintText: 'Enter your password'),
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                title: 'Log In',
                colour: Colors.lightBlueAccent,
                onPressed: () async {
                  setState(() {
                    showSpinner = true;
                  });
                  var user = await ServerProxy.loginUser(email, password);
                  setState(() {
                    showSpinner = false;
                  });
                  if (user != null){
                    print('i am here');
                    ActiveUser().setLoggedInUser(user);
                    Navigator.popAndPushNamed(context, MainScreen.id);
                  }
                  // print('User will be logged in');
                  
                },
              ),
              RoundedButton(
                title: 'Create an account',
                colour: Colors.lightBlueAccent,
                onPressed: () {
                  // Navigator.popAndPushNamed(context, RegistrationScreen.id);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }


  Future<User> signInWithEmailPassword(String email, String password) async {
  await Firebase.initializeApp();
  User user; 
  try {
    UserCredential userCredential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    user = userCredential.user;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found' || e.code == 'wrong-password') {
      print('Incorrect User or password.');
    } else {
      print('Something went wrong');
    }
  }

  return user;
}

  // Future<User> registerWithEmailPassword(String email, String password) async {
  //   await Firebase.initializeApp();
  //   User user; 
  //   try {
  //     UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
  //     email:email, 
  //     password: password); 
  //     user = userCredential.user;
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'weak-password') {
  //       print('The password provided is too weak.');
  //     } else if (e.code == 'email-already-in-use') {
  //       print('An account already exists for that email.');
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  //   return user; 
  // } 
  // void attemptLogin() async {
  //   User currUser;
  //   final apiInstance = LoginApi();

  //   try {
  //     final result = apiInstance.loginPost(
  //         inlineObject:
  //             InlineObject(emailAddress: this.email, password: this.password));
  //     var response = await result;
  //     // currUser = User(1, "hi", "first", "middle", "lastName", 2);
  //     currUser = User(
  //       response.userId,
  //       response.emailAddress,
  //       response.firstName,
  //       response.middleName,
  //       response.lastName,
  //       response.investmentStrategy,
  //       response.token,
  //     );
  //     if (currUser != Null) {
  //       Navigator.popAndPushNamed(context, MainScreen.id, arguments: currUser);
  //     }
  //   } catch (e) {
  //     print('Exception when calling LoginApi->loginPost(): $e\n');
  //     showPrompt("Invalid username or password, please try again");
  //   }

  //   // TODO: Delete
  //   // Navigator.popAndPushNamed(context, MainScreen.id,
  //   //     arguments: User(100, "test@gmail.com", "Mr. Test", "Middle", "McTester",
  //   //         2, "token"));
  // }

  //TODO: Refactor
  void showPrompt(String prompt) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.blue[900],
        content: Text(prompt,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 26,
                color: Colors.white,
                fontWeight: FontWeight.w400)),
      ),
    );
  }
}
