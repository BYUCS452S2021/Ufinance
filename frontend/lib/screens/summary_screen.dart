import 'package:flutter/material.dart';
import 'package:frontend/constants.dart'; 

class SummaryScreen extends StatefulWidget {
  static const String id = 'summary_screen';
  @override
  _SummaryScreen createState() => _SummaryScreen();
}

class _SummaryScreen extends State<SummaryScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(25.0),
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Account Balance",
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 11.0,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "291.01",
                          style: Theme.of(context)
                              .textTheme
                              .headline4
                              .apply(color: Colors.white, fontWeightDelta: 2),
                        ),
                        TextSpan(text: " ETH")
                      ],
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.lock, color: Colors.grey[300]),
                      SizedBox(width: 5.0),
                      Text(
                        "Freezing amount: 1.0173 ETH",
                        style: TextStyle(color: Colors.grey[300]),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 11.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Flexible(
                        child: ElevatedButton(
                          style: accountSummaryStyle,
                          
                          onPressed: () {},
                          child: Text(
                            'Deposit',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Flexible(
                        child: RaisedButton(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 11.0),
                          color: Colors.deepPurple,
                          onPressed: () {},
                          child: Text(
                            'Cash',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(9.0),
                              side: BorderSide(color: Colors.white)),
                        ),
                      ),
                      Flexible(
                        child: RaisedButton(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 11.0),
                          color: Color(0xff1b4dff),
                          onPressed: () {},
                          child: Text(
                            'Deposit',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(9.0),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}