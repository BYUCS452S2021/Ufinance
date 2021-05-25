import 'package:flutter/material.dart';
import 'package:frontend/components/rounded_button.dart';
import 'package:frontend/constants.dart';
import 'package:frontend/data_models/strategy_model.dart';
import 'package:frontend/data_models/user.dart';
import 'package:frontend/screens/main_screen.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:openapi/api.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'registration_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final passwordText = TextEditingController();
  final passwordRetypeText = TextEditingController();
  bool showSpinner = false;
  String email;
  String password;
  String passwordRetype;
  String firstName;
  String middleName;
  String lastName;
  String dropdownValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Create Account'),
      ),
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
                controller: passwordText,
                onChanged: (value) {
                  password = value;
                },
                decoration: TextFieldDecoration.copyWith(
                    hintText: 'Enter your password'),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                controller: passwordRetypeText,
                onChanged: (value) {
                  passwordRetype = value;
                },
                decoration: TextFieldDecoration.copyWith(
                    hintText: 'Re-enter your password'),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                onChanged: (value) {
                  firstName = value;
                },
                decoration:
                    TextFieldDecoration.copyWith(hintText: 'First name'),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                onChanged: (value) {
                  middleName = value;
                },
                decoration: TextFieldDecoration.copyWith(
                    hintText: 'Middle name (optional)'),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                onChanged: (value) {
                  lastName = value;
                },
                decoration: TextFieldDecoration.copyWith(hintText: 'Last name'),
              ),
              SizedBox(
                height: 8.0,
              ),
              Container(
                alignment: Alignment(0.0, 0.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  border: Border.all(color: Colors.blueAccent),
                ),
                child: DropdownButton<String>(
                  value: dropdownValue,
                  icon: const Icon(Icons.arrow_drop_down),
                  iconSize: 44,
                  elevation: 16,
                  hint: Text(
                    "Select investment strategy",
                  ),
                  underline: Container(
                    height: 0,
                  ),
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValue = newValue;
                    });
                  },
                  //TODO: Refactor
                  items: <String>[
                    "Safe",
                    "Conservative",
                    "Moderate",
                    "Aggressive"
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                title: 'Register',
                colour: Colors.blueAccent,
                onPressed: () => registerIsClicked(),
              ),
              SizedBox(
                height: 60.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void registerIsClicked() {
    if (dropdownValue == null ||
        email == null ||
        firstName == null ||
        lastName == null ||
        password == null ||
        passwordRetype == null) {
      showPrompt('Fill in missing fields');
    } else if (password != passwordRetype) {
      passwordText.clear();
      passwordRetypeText.clear();
      showPrompt('Passwords do not match');
    } else if (password.length < 8) {
      passwordText.clear();
      passwordRetypeText.clear();
      showPrompt('Password must be at least 8 characters');
    } else {
      registerUser();
    }
  }

  Future<void> registerUser() async {
    // Check if user exists
    // Add user to database and move to the main page
    User currUser;
    final apiInstance = UsersApi();
    int selectedStrategy;
    //TODO: Refactor
    switch (dropdownValue) {
      case "Safe":
        {
          selectedStrategy = 1;
        }
        break;
      case "Conservative":
        {
          selectedStrategy = 2;
        }
        break;
      case "Moderate":
        {
          selectedStrategy = 3;
        }
        break;
      case "Aggressive":
        {
          selectedStrategy = 4;
        }
        break;
    }

    try {
      final result = apiInstance.usersPost(
          inlineObject1: InlineObject1(
              emailAddress: this.email,
              password: this.password,
              firstName: this.firstName,
              middleName: this.middleName,
              lastName: this.lastName,
              investmentStrategy: selectedStrategy));
      var response = await result;
      // currUser = User(1, "hi", "first", "middle", "lastName", 2);
      currUser = User(
          response.userId,
          response.emailAddress,
          response.firstName,
          response.middleName,
          response.lastName,
          response.investmentStrategy,
          response.token);
      print(currUser);
      if (currUser != Null) {
        Navigator.popAndPushNamed(context, MainScreen.id, arguments: currUser);
      }
    } catch (e) {
      print('Exception when calling UserApi->usersPost(): $e\n');
      showPrompt("Email already taken");
    }
  }

  //TODO: Refactor
  Future<List<InvestmentStrategy>> fetchStrategies() async {
    List<InvestmentStrategy> strategyData = [];
    final apiInstance = StrategiesApi();

    try {
      final result = apiInstance.strategiesGet();
      var response = await result;

      response.strategies.forEach((current) => {
            strategyData.add(InvestmentStrategy(
                strategyId: current.investmentStrategyId,
                strategyName: current.investmentStrategyName,
                lowerRiskBound: current.riskLowerBound,
                upperRiskBound: current.riskUpperBound,
                description: current.strategyDescription))
          });
      return strategyData;
    } catch (e) {
      print('Exception when calling StrategiesApi->strategies.get(): $e\n');
      return null;
    }
  }

//Todo: Refactor
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
