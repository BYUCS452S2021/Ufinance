import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:frontend/components/strategy_card.dart';
import 'package:frontend/constants.dart';
import 'package:frontend/data_models/strategy_model.dart';
import 'package:frontend/data_models/user.dart';
import 'package:frontend/data_models/user_info.dart';
import 'package:openapi/api.dart';
import 'package:frontend/data/server_proxy.dart';

class SummaryScreen extends StatefulWidget {
  static const String id = 'summary_screen';
  @override
  _SummaryScreen createState() => _SummaryScreen();
}

class _SummaryScreen extends State<SummaryScreen> {
  UserInfo _currUserInfo;

  _SummaryScreen() {
    this._currUserInfo = ActiveUser().getUserInfo();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            Text(
              "Welcome " + _currUserInfo.firstName,
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
                      }
                    )
                ],
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            FutureBuilder<QuerySnapshot>(
                future: ActiveUser.database.collection('strategies').get(),
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  // print("before if");
                  if (snapshot.hasData) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data.docs.length,
                      itemBuilder: (BuildContext context, int index) {
                        return StrategyCard(
                          title: snapshot.data.docs[index]['Name'],
                          description: snapshot.data.docs[index]['Description'],
                          strategy: snapshot.data.docs[index]['Id'],
                          selectedStrategy: _currUserInfo.investmentStrategy,
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
    // final apiInstance = UsersApi();

    // try {
    //   final result = apiInstance.usersUserIdAllholdingsGet(
    //       _currUserInfo.userId, _currUserInfo.token);
    //   var response = await result;
    //   return response.totalValue;
    // } catch (e) {
    //   print('Exception when calling UsersApi->usersUserIdAllholdingsGet: $e\n');
    //   return null;
    // }
  }
}
