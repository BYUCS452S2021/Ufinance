import 'package:flutter/material.dart';
import 'package:frontend/components/rounded_button.dart';
import 'package:frontend/constants.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:frontend/screens/registration_screen.dart';
import 'package:frontend/screens/main_screen.dart';
class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showSpinner = false;
  String email;
  String password;

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
                    child: Image.asset('images/logo.png'),
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
                  try {
                    Navigator.popAndPushNamed(context, MainScreen.id);
                    print('User will be logged in');
                    setState(() {
                      showSpinner = false;
                    });
                  } catch (e) {
                    print(e);
                  }
                },
              ),
              RoundedButton(
                title: 'Already have an account',
                colour: Colors.lightBlueAccent,
                onPressed:() {
                  Navigator.popAndPushNamed(context, RegistrationScreen.id);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}