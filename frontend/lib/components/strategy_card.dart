import 'package:flutter/material.dart';
import 'base_card.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

class StrategyCard extends StatelessWidget {
  StrategyCard({
    this.title,
    this.description,
    this.strategyId,
    this.selectedStrategy,
    this.currIndex,
    this.onPressed,
  });

  final String strategyId;
  final String selectedStrategy;
  final String description;
  final String title;
  final int currIndex;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      padding: EdgeInsets.all(15.0),
      boxDecoration: BoxDecoration(
        // Change color
        color: title == selectedStrategy ? Colors.blue[700] : Colors.lightBlue,
        borderRadius: BorderRadius.circular(15.0),
      ),
      cardChild: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title == selectedStrategy
                ? this.title + "   (selected)"
                : this.title,
            style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 11.0,
          ),
          Text(
            description,
            style: TextStyle(color: Colors.grey[200]),
          )
        ],
      ),
      onPressed: this.onPressed,
      // onPressed: () {
      //   print(currIndex);
      // },
    );
  }
}
