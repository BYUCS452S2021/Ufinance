import 'package:flutter/material.dart';
import 'package:frontend/components/strategy_card.dart';
import 'package:frontend/data_models/strategy_model.dart';

class SummaryScreen extends StatefulWidget {
  static const String id = 'summary_screen';
  @override
  _SummaryScreen createState() => _SummaryScreen();
}

class _SummaryScreen extends State<SummaryScreen>{
  final walletMockData = [
    InvestmentStrategy(
      strategyName: 'Conservative',
      description: 'Low risk, low gains',
    ),
    InvestmentStrategy(
      strategyName: 'Moderate',
      description: 'Some risk',
    ),
    InvestmentStrategy(
      strategyName: 'Agressive',
      description: 'More risk',
    )
  ];
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
              itemCount: walletMockData.length,
              itemBuilder: (BuildContext context, int index){
                return StrategyCard(title: walletMockData[index].strategyName, 
                description: walletMockData[index].description, onPressed: (){});
              },
            ),
          ],
        ),
      ),
    );
  }
}