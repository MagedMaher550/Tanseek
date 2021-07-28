import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'screens/result_screen.dart';
import 'screens/generalSecondary.dart';
import 'screens/industrialSecondary.dart';
import 'screens/commercialSecondary.dart';
import 'screens//agriculturalSecondary.dart';
import 'screens/azharSecondary.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp (
      initialRoute: '/',
      routes: {
        '/': (context) => GeneralSecondary(),
        '/resultScreen': (context) => Result(),
        '/industrialSecondary': (context) => IndustrialSecondary(),
        '/commercialSecondary': (context) => CommercialSecondary(),
        '/agriculturalSecondary': (context) => AgriculturalSecondary(),
        '/azharSecondary': (context) => AzharSecondary(),
      },
    );
  }

}
