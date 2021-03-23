import 'package:flutter/material.dart';
import 'package:sharedprefrences_localstorage/ui/Home.dart';


void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return new MaterialApp(

      home: Home(),

    );
  }
}


