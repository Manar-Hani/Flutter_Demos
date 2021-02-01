import 'package:catbox/ui/adopted_list.dart';
import 'package:catbox/ui/cat_list.dart';
import 'package:catbox/ui/liked_list.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(new CatBoxApp());
}

class CatBoxApp extends StatefulWidget {
  State<StatefulWidget> createState() {
    return _HomeState();
  }
  }

class _HomeState extends State<CatBoxApp> {
  int _currentIndex = 0;
  final tabs =[
    new CatList(),
    new AdoptedList(),
    new LikedList()
  ];

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
          primarySwatch: Colors.blue,
          accentColor: Colors.pinkAccent,
          fontFamily: 'Ubuntu'
      ),
      home: new Scaffold(
        body: tabs[_currentIndex],
        bottomNavigationBar: new BottomNavigationBar(
          onTap: onTabTapped, // new
            currentIndex: _currentIndex,
            // backgroundColor: Colors.white,
          items: [
              new BottomNavigationBarItem(
                icon: new Icon(Icons.home),
                title: new Text ("Home"),
              ),
              new BottomNavigationBarItem(
                icon: new Icon(Icons.favorite),
                title: new Text ("Adopted"),
              ),
              new BottomNavigationBarItem(
                icon: new Icon(Icons.thumb_up),
                title: new Text ("Liked"),
              ),
            ],
        ),

      ),
    );
  }
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
