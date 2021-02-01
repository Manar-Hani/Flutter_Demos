import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Wisdom extends StatefulWidget {
  @override
  _WisdomState createState() => _WisdomState();

}

class _WisdomState extends State<Wisdom> {

  int _index=0;
  List quotes =[
    "The greatest glory in living lies not in never falling, but in rising every time we fall." "-Nelson Mandela",
    "The way to get started is to quit talking and begin doing." "-Walt Disney",
    "Your time is limited, so don't waste it living someone else's life. Don't be trapped by dogma – which is living with the results of other people's thinking." "-Steve Jobs",
    "If life were predictable it would cease to be life, and be without flavor." "-Eleanor Roosevelt",
    "If you look at what you have in life, you'll always have more. If you look at what you don't have in life, you'll never have enough." "-Oprah Winfrey",
    "If you set your goals ridiculously high and it's a failure, you will fail above everyone else's success." "-James Cameron",
    "Life is what happens when you're busy making other plans." "-John Lennon"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quotes") ,
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Center(
                child: Container(
                    width: 350,
                    height: 200,
                    margin: EdgeInsets.all(30.0),
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(14.5)
                    ) ,
                    child: Center(
                        child: Text(quotes[_index % quotes.length],
                          style: TextStyle(
                              color: Colors.grey.shade600,
                              fontStyle: FontStyle.italic,
                              fontSize: 16.6
                          ),))),
              ),
            ),
            Divider(
              thickness:1.3 ,
            ),
            Padding(
              padding: const EdgeInsets.only(top:8.0),
              child: FlatButton.icon(
                  onPressed: _showQuote,
                  color:Colors.blueGrey ,
                  icon: Icon(Icons.wb_sunny),
                  label: Text("Inspire me!", style: TextStyle(
                    fontSize:16.6 ,
                    color: Colors.white,
                  ),)),
            ),
            Spacer()
          ],
        ),
      ),
    );
  }

  _showQuote() {

    setState(() {
      _index +=1;

    });

  }
}
