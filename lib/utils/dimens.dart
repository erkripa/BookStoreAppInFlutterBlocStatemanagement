import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const normalHeight = 805.3;

class Dimens {
//double
  static double screenHeight = ScreenUtil().screenHeight;
  static double screenWidth = ScreenUtil().screenWidth;
//Height 805.3 height
  static double h10 = screenHeight / 80.5;
  static double h15 = screenHeight / 53.7;
  static double h20 = screenHeight / 40.3;
  static double h25 = screenHeight / 32.2;
  static double h30 = screenHeight / 26.84;
  static double h45 = screenHeight / 17.9;
  static double h40 = screenHeight / 20.13;
  static double h220 = screenHeight / 3.7;
// width 384 screen width
  static double w10 = screenWidth / 38.4;
  static double w15 = screenWidth / 25.5;
  static double w20 = screenWidth / 19.2;
  static double w30 = screenWidth / 12.8;
//Font Size
  static double f16 = screenHeight / 50.33;
  static double f18 = screenHeight / 44.70;
  static double f21 = screenHeight / 38.34;
  static double f20 = screenHeight / 40.3;
  static double f12 = screenHeight / 67.1;
  static double f14 = screenHeight / 57.5;
//Radius
  static double r20 = screenHeight / 40.3;
  static double r15 = screenHeight / 53.7;
  static double r10 = screenHeight / 80.5;
  static double r30 = screenHeight / 26.8;

  static double defaultPaddingValue = eight;

  static double eight = 8.r;
  static double eighteen = 18.r;
  static double eighty = 80.r;
  static double eleven = 11.r;
  static double fifteen = 15.r;
  static double fifty = 50.r;
  static double fiftyFive = 55.r;
  static double fiftyFour = 54.r;
  static double fiftySix = 56.r;
  static double five = 5.r;
  static double four = 4.r;
  static double fourteen = 14.r;
  static double fourty = 40.r;
  static double fourtyTwo = 42.r;
  static double fourtyEight = 48.r;
  static double h54 = 54.h;
  static double hundred = 100.r;
  static double nineteen = 19.r;
  static double oneSeventy = 170.r;
  static double ninetyEight = 98.r;
  static double ninetyFive = 95.r;
  static double one = 1.r;
  static double oneHundredFifty = 150.r;
  static double oneHundredNinty = 190.r;
  static double oneHundredTwenty = 120.r;
  static double twoHundred10 = 210.r;
  static double pointEight = 0.8.r;
  static double pointFive = 0.5.r;
  static double pointFour = 0.4.r;
  static double pointNine = 0.9.r;
  static double pointOne = 0.1.r;
  static double pointSeven = 0.7.r;
  static double pointSix = 0.6.r;
  static double pointThree = 0.3.r;
  static double pointTwo = 0.2.r;
  static double seven = 7.r;
  static double seventy = 70.r;
  static double seventyEight = 78.r;
  static SizedBox shrinkedBox = const SizedBox.shrink();
  static double six = 6.r;
  static double sixTeen = 16.r;
  static double sixty = 60.r;
  static double sixtyFour = 64.r;
  static double ten = 10.r;
  static double thirteen = 13.r;
  static double thirty = 30.r;
  static double thirtyFive = 35.r;
  static double thirtyFour = 34.r;
  static double thirtyNine = 39.r;
  static double thirtySix = 36.r;
  static double thirtyTwo = 32.r;
  static double three = 3.r;
  static double twelve = 12.r;
  static double twenty = 20.r;
  static double twentyEight = 28.r;
  static double twentyFive = 25.r;
  static double twentyFour = 24.r;
  static double twentySix = 26.r;
  static double twentyThree = 23.r;
  static double twentyTwo = 22.r;
  static double two = 2.r;
  static double zero = 0.r;
  static double h185 = 185.r;

  //SizedBoxes
  static SizedBox boxHeight10 = SizedBox(height: ten);
  static SizedBox boxHeight12 = SizedBox(height: twelve);
  static SizedBox boxHeight16 = SizedBox(height: sixTeen);
  static SizedBox boxHeight2 = SizedBox(height: two);
  static SizedBox boxHeight20 = SizedBox(height: twenty);
  static SizedBox boxHeight24 = SizedBox(height: twentyFour);
  static SizedBox boxHeight32 = SizedBox(height: thirtyTwo);
  static SizedBox boxHeight4 = SizedBox(height: four);
  static SizedBox boxHeight40 = SizedBox(height: fourty);
  static SizedBox boxHeight48 = SizedBox(height: fourtyEight);
  static SizedBox boxHeight60 = SizedBox(height: sixty);
  static SizedBox boxHeight64 = SizedBox(height: sixtyFour);
  static SizedBox boxHeight8 = SizedBox(height: eight);
  static SizedBox boxHeight6 = SizedBox(height: six);
  static SizedBox boxHeight80 = SizedBox(height: eighty);
  static SizedBox boxWidth10 = SizedBox(width: ten);
  static SizedBox boxWidth12 = SizedBox(width: twelve);
  static SizedBox boxWidth16 = SizedBox(width: sixTeen);
  static SizedBox boxWidth2 = SizedBox(width: two);
  static SizedBox boxWidth20 = SizedBox(width: twenty);
  static SizedBox boxWidth24 = SizedBox(width: twentyFour);
  static SizedBox boxWidth32 = SizedBox(width: thirtyTwo);
  static SizedBox boxWidth4 = SizedBox(width: four);
  static SizedBox boxWidth40 = SizedBox(width: fourty);
  static SizedBox boxWidth60 = SizedBox(width: sixty);
  static SizedBox boxWidth8 = SizedBox(width: eight);
  static SizedBox boxWidth80 = SizedBox(width: eighty);
  static Divider divider =
      Divider(height: Dimens.zero, thickness: Dimens.pointEight);
  static Divider dividerWithHeight =
      Divider(thickness: Dimens.pointEight, height: Dimens.one);

//EdgeInsets
  //Bottom 1.
  static EdgeInsets onlyBottom12 = EdgeInsets.only(bottom: twelve);
  static EdgeInsets onlyBottom16 = EdgeInsets.only(bottom: sixTeen);
  static EdgeInsets onlyBottom2 = EdgeInsets.only(bottom: two);
  static EdgeInsets onlyBottom4 = EdgeInsets.only(bottom: four);
  static EdgeInsets onlyBottom8 = EdgeInsets.only(bottom: eight);
  //left 2.
  static EdgeInsets onlyLeft12 = EdgeInsets.only(left: twelve);
  static EdgeInsets onlyLeft16 = EdgeInsets.only(left: sixTeen);
  static EdgeInsets onlyLeft20 = EdgeInsets.only(left: twenty);
  static EdgeInsets onlyLeft24 = EdgeInsets.only(left: twentyFour);
  static EdgeInsets onlyLeft32 = EdgeInsets.only(left: thirtyTwo);
  static EdgeInsets onlyLeft8 = EdgeInsets.only(left: eight);
  static EdgeInsets onlyLeft5 = EdgeInsets.only(left: five);
  //Top 3.
  static EdgeInsets onlyTop12 = EdgeInsets.only(top: twelve);
  static EdgeInsets onlyTop16 = EdgeInsets.only(top: sixTeen);
  static EdgeInsets onlyTop2 = EdgeInsets.only(top: two);
  static EdgeInsets onlyTop4 = EdgeInsets.only(top: four);
  static EdgeInsets onlyTop8 = EdgeInsets.only(top: eight);
  //right 4.
  static EdgeInsets onlyRight12 = EdgeInsets.only(right: twelve);
  static EdgeInsets onlyRight16 = EdgeInsets.only(right: sixTeen);
  static EdgeInsets onlyRight20 = EdgeInsets.only(right: twenty);
  static EdgeInsets onlyRight4 = EdgeInsets.only(right: four);
  static EdgeInsets onlyRight6 = EdgeInsets.only(right: six);
  static EdgeInsets onlyRight8 = EdgeInsets.only(right: eight);
  //default
  static EdgeInsets defaultPadding = EdgeInsets.all(h10);
  static EdgeInsets edgeHoriz20 = EdgeInsets.symmetric(horizontal: 20.r);
  static EdgeInsets edgeHoriz10 = EdgeInsets.symmetric(horizontal: 10.r);
  static EdgeInsets edgeVert20 = EdgeInsets.symmetric(vertical: 20.r);
  static EdgeInsets edgeVert10 = EdgeInsets.symmetric(vertical: 10.r);
  static EdgeInsets edge0 = EdgeInsets.zero;
  static EdgeInsets edgeH12 = EdgeInsets.symmetric(horizontal: twelve);
  static EdgeInsets edgeA16 = EdgeInsets.all(16.r);
  static EdgeInsets edgeA12 = EdgeInsets.all(12.r);
  static EdgeInsets edgeA8 = EdgeInsets.all(8.r);
  static EdgeInsets edgeV8 = EdgeInsets.symmetric(vertical: 8.r);
  static EdgeInsets edgeH8 = EdgeInsets.symmetric(horizontal: eight);
  static EdgeInsets edgeA4 = EdgeInsets.all(four);
  static EdgeInsets edgeA10 = EdgeInsets.all(ten);

  static EdgeInsets edgeV16H12 =
      EdgeInsets.symmetric(vertical: sixTeen, horizontal: twelve);

  static var edgeL20T10B8 = EdgeInsets.only(
    left: defaultPaddingValue,
    top: defaultPaddingValue / 2,
    bottom: defaultPaddingValue * 2.5,
  );

  static EdgeInsets edgeL20R20B56 = EdgeInsets.only(
    left: defaultPaddingValue,
    right: defaultPaddingValue,
    bottom: 36.r + defaultPaddingValue,
  );

  static var edgeL20T10B10 = EdgeInsets.only(
    left: defaultPaddingValue,
    top: defaultPaddingValue / 2,
    bottom: defaultPaddingValue / 2,
  );

  /// Get the height with the percent value of the screen height.
  static double percentHeight(double percentValue) => percentValue.sh;

  /// Get the width with the percent value of the screen width.
  static double percentWidth(double percentValue) => percentValue.sw;

  static SizedBox heightedBox(double height) => SizedBox(height: height);

  static SizedBox widthedBox(double width) => SizedBox(width: width);

  //border radius
  static BorderRadius circularBorderRadius = BorderRadius.circular(eight);
  static BorderRadius defaultBoderRadius = BorderRadius.circular(Dimens.four);
}
