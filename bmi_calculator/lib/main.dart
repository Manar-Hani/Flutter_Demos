import 'package:bmi_calculator/ui/InputPage.dart';
import 'package:bmi_calculator/ui/ResultPage.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(BMICalculator());
}

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: InputPage(),
      routes: {
        ResultPage.routeName: (context) => ResultPage(),
      },
    );
  }
}