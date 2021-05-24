import 'package:flutter/material.dart';
import 'package:frontend/components/strategy_card.dart';
import 'package:frontend/data_models/strategy_model.dart';
import 'package:frontend/data_models/user.dart';
import 'package:openapi/api.dart';

class SummaryScreen extends StatefulWidget {
  static const String id = 'summary_screen';
  final User currUser;
  SummaryScreen({Key key, @required this.currUser}) : super(key: key);
  @override
  _SummaryScreen createState() => _SummaryScreen(currUser);
}

class _SummaryScreen extends State<SummaryScreen> {
  User _currUser;

  _SummaryScreen(User currUser) {
    this._currUser = currUser;
    fetchStrategies();
  }

  final strategyData = [];
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
                    "Your investment",
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 11.0,
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "Total amount",
                        style: TextStyle(color: Colors.grey[300]),
                      )
                    ],
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
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: strategyData.length,
              itemBuilder: (BuildContext context, int index) {
                return StrategyCard(
                    title: strategyData[index].strategyName,
                    description: strategyData[index].description,
                    onPressed: () {});
              },
            ),
          ],
        ),
      ),
    );
  }

  void fetchStrategies() async {
    final apiInstance = StrategiesApi();

    try {
      final result = apiInstance.strategiesGet();
      var response = await result;

      response.strategies.forEach((current) => {
            strategyData.add(InvestmentStrategy(
                strategyName: "Change Database",
                description: current.strategyDescription))
          });
    } catch (e) {
      print('Exception when calling LoginApi->loginPost(): $e\n');
    }
  }
}
