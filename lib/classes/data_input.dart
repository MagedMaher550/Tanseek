import 'package:flutter/cupertino.dart';

class MyData {
  final double res;
  final String college;
  final String region;
  final String division;
  final int year;

  MyData({
    @required this.res,
    @required this.college,
    @required this.region,
    @required this.year,
    this.division
  });
}
