import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

class BaseCard extends StatelessWidget {
  BaseCard({this.padding, this.boxDecoration, this.cardChild, this.onPressed});

  final Function onPressed;
  final padding;
  final cardChild;
  final boxDecoration;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Material(
        child: Ink(
          padding: this.padding,
          decoration: this.boxDecoration,
          child: InkWell(
            child: this.cardChild,
            onTap: this.onPressed,
          ),
        ),

        //   padding: this.padding,
        //   decoration: this.boxDecoration,
        //   child: this.cardChild
      ),
    );
  }
}
