import 'package:flutter/material.dart';
import 'package:random_words/random_words.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Word Game',
        home: new RandomSentences(),
        );
  }
}
 class RandomSentences extends StatefulWidget{
  @override
   createState() => new RandomSentencesState();
 }

  class RandomSentencesState extends State<RandomSentences>{
    final _sentences =<String>[];
    final _saved = new Set<String>();
    final _biggerFont = const TextStyle(fontSize: 14);

    @override
    Widget build(BuildContext context) {
      return new Scaffold(
        appBar: new AppBar(
          title: new Text('Word Game'),
          actions: <Widget> [
            new IconButton(
                icon: new Icon(Icons.list),
                onPressed: _pushSaved)
          ],
        ),
        body: _buildSentences(),
      );
    }

    void _pushSaved(){
      Navigator.of(context).push(
        new MaterialPageRoute(
          builder: (context) {
            final tiles = _saved.map(
                  (sentence) {
                return new ListTile(
                  title: new Text(
                    sentence,
                    style: _biggerFont,
                  ),
                );
              },
            );
            final divided = ListTile.divideTiles(
              context: context,
              tiles: tiles,
            ).toList();
            return new Scaffold(
              appBar: new AppBar(
                title: new Text('Saved Sentences'),
              ),
              body: new ListView(children: divided),
            );
          },
            ),
      );
    }


      String _getSentence(){
        final noun = new WordNoun.random();
        final adjective = new WordAdjective.random();
        return "This is the generated Adjective: ${adjective.asCapitalized}\n"
                "This is the generated Noun: ${noun.asCapitalized}";

      }

    Widget _buildRow(String sentence) {
        final wantToSave = _saved.contains(sentence);

      return new ListTile(
        title: new Text(
          sentence,
          style: _biggerFont,
        ),
        trailing: new Icon(
          wantToSave ? Icons.thumb_up : Icons.thumb_down,
          color: wantToSave ? Colors.green : null,
        ),
        onTap: (){
          setState(() {
            if(wantToSave){
              _saved.remove(sentence);
            }else{
              _saved.add(sentence);
            }
          });
        },
      );
    }


        Widget _buildSentences() {
          return new ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemBuilder: (context, i) {
              if (i.isOdd) return new Divider();
              final index = i ~/ 2;
              if (index >= _sentences.length) {
                for (int x = 0; x < 10; x++) {
                  _sentences.add(_getSentence());
                }
              }
              return _buildRow(_sentences[index]);
            },
          );
        }




  }

