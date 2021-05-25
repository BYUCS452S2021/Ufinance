import 'package:flutter/material.dart';
import 'package:frontend/components/strategy_card.dart';
import 'package:frontend/constants.dart';
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
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            Text(
              "Welcome " + _currUser.firstName,
              style: TextStyle(
                fontSize: 20.0,
                fontFamily: 'Horizon',
              ),
            ),
            SizedBox(height: 13.0),
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
                  FutureBuilder(
                      future: fetchTotalValue(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: snapshot.data.toString() != ""
                                      ? snapshot.data.toString()
                                      : "\$0",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4
                                      .apply(
                                          color: Colors.white,
                                          fontWeightDelta: 2),
                                ),
                              ],
                            ),
                          );
                        } else {
                          return Text('Loading...');
                        }
                      })
                ],
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            FutureBuilder(
                future: fetchStrategies(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  // print("before if");
                  if (snapshot.hasData) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return StrategyCard(
                          title: snapshot.data[index].strategyName,
                          description: snapshot.data[index].description,
                          strategy: snapshot.data[index].strategyId,
                          selectedStrategy: _currUser.investmentStrategy,
                          onPressed: () {
                            print(index);
                          },
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Column(
                      children: [
                        const Icon(
                          Icons.error_outline,
                          color: Colors.red,
                          size: 60,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: Text('Error: ${snapshot.error}'),
                        )
                      ],
                    );
                  } else {
                    // print('project snapshot data is: ${snapshot.data}');
                    return Center(child: LinearProgressIndicator());
                  }
                })
            // ListView.builder(
            //   shrinkWrap: true,
            //   physics: NeverScrollableScrollPhysics(),
            //   itemCount: strategyData.length,
            //   itemBuilder: (BuildContext context, int index) {
            //     return StrategyCard(
            //         title: strategyData[index].strategyName,
            //         description: strategyData[index].description,
            //         onPressed: () {});
            //   },
            // ),
          ],
        ),
      ),
    );
  }

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

  Future<String> fetchTotalValue() async {
    final apiInstance = UsersApi();

    try {
      final result = apiInstance.usersUserIdAllholdingsGet(
          _currUser.userId, _currUser.token);
      var response = await result;
      return response.totalValue;
    } catch (e) {
      print('Exception when calling UsersApi->usersUserIdAllholdingsGet: $e\n');
      return null;
    }
  }
}
