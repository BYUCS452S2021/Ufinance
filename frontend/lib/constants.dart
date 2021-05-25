import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

const ColorizeColors = [
  Colors.purple,
  Colors.blue,
  Colors.yellow,
  Colors.red,
];

const ColorizeTextStyle = TextStyle(
  fontSize: 60.0,
  fontFamily: 'Horizon',
);

const TextFieldDecoration = InputDecoration(
  hintText: 'Enter a value',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

final ButtonStyle accountSummaryStyle = ElevatedButton.styleFrom(
  onPrimary: Colors.black87,
  primary: Colors.grey[300],
  minimumSize: Size(88, 36),
  padding: EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(2)),
  ),
);

const kTextColor = Color(0xFF151C2A);
const kTextSecondaryColor = Color(0xFF7E8EAA);
const kPrimaryColor = Color(0xFF5D92EB);
const kGreenColor = Color(0xFF30C96B);
const kRedColor = Color(0xFFEE6B8D);
const kPurpleColor = Color(0xFFC482F9);
const kBackgroundColor = Color(0xFFFBF8FF);
const kLineColor = Color(0xFFEAEEF4);
const kShadowColor1 = Color.fromRGBO(149, 190, 207, 0.50);
const kShadowColor2 = Color(0xFFCFECF8);
const kShadowColor3 = Color.fromRGBO(0, 0, 0, 0.10);
const kShadowColor4 = Color.fromRGBO(207, 236, 248, 0.50);
const kShadowColor5 = Color.fromRGBO(238, 226, 255, 0.70);

const kSpacingUnit = 10.0;

final kTitleTextStyle = TextStyle(
  fontSize: ScreenUtil().setSp(16),
  color: kTextColor,
);

final kBodyTextStyle = GoogleFonts.lato(fontSize: 30);

final kCaptionTextStyle = TextStyle(
  fontSize: ScreenUtil().setSp(10),
  color: kTextSecondaryColor,
);

final kCardTextStyle = TextStyle(
  fontFamily: 'TTNorms',
  color: Colors.white,
  shadows: [
    BoxShadow(
      color: kShadowColor3,
      blurRadius: kSpacingUnit.w,
      offset: Offset(0, kSpacingUnit.w * 0.5),
    ),
  ],
);
