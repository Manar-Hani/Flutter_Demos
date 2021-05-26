import 'package:flutter/material.dart';
import 'package:joke_app/ui/master_detail_screen.dart';

void main() => runApp(new Home());
// void main() => runApp(new MaterialApp(
//   home: MasterDetailScreen(),
// ));

class Home extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Jokes',
        theme: new ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MasterDetailScreen()
    );
  }
}