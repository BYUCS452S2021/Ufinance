import 'package:flutter/material.dart';
import 'base_card.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

class StrategyCard extends StatelessWidget {
  StrategyCard({
    this.title,
    this.description,
    this.strategy,
    this.selectedStrategy,
    this.currIndex,
    this.onPressed,
  });

  final int strategy;
  final int selectedStrategy;
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
        color:
            strategy == selectedStrategy ? Colors.blue[700] : Colors.lightBlue,
        borderRadius: BorderRadius.circular(15.0),
      ),
      cardChild: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            strategy == selectedStrategy
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
        // RichText(
        //   text: TextSpan(
        //     children: [
        //       TextSpan(
        //         text: "291.01",
        //         style: Theme.of(context)
        //             .textTheme
        //             .headline4
        //             .apply(color: Colors.white, fontWeightDelta: 2),
        //       ),
        //     ],
        //   ),
        // ),
      ),
      onPressed: this.onPressed,
      // onPressed: () {
      //   print(currIndex);
      // },
    );
    // return Container(
    //   decoration: BoxDecoration(
    //     color: Colors.white,
    //     borderRadius: BorderRadius.circular(kSpacingUnit / 2),
    //     boxShadow: [
    //       BoxShadow(
    //         color: kShadowColor5,
    //         blurRadius: kSpacingUnit * 4,
    //         offset: Offset(0, kSpacingUnit / 2),
    //         ),
    //     ],
    //   ),
    //   margin: EdgeInsets.symmetric(
    //     horizontal: kSpacingUnit * 2,
    //   ).copyWith(top: kSpacingUnit * 2),

    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: <Widget>[
    //       Text(
    //         title,
    //         style: kBodyTextStyle,
    //       ),
    //       SizedBox(height: kSpacingUnit),
    //       Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         children: <Widget>[
    //           Text(
    //             description
    //           ),
    //         ],
    //       ),
    //       // SizedBox(height: kSpacingUnit * 2),
    //       // Stack(
    //       //   children: <Widget>[
    //       //     Container(
    //       //       height: kSpacingUnit/ 2,
    //       //       width: 100,//MediaQuery.of(context).size.width,
    //       //       decoration: BoxDecoration(
    //       //         color: kLineColor,
    //       //         borderRadius: BorderRadius.circular(kSpacingUnit / 4),
    //       //       ),
    //       //     ),
    //       //   ],
    //       // ),
    //       // SizedBox(height: kSpacingUnit * 3),
    //     ],
    //   ),
    // );
  }
}
