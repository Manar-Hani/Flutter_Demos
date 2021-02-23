import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quiz_app/ui/home.dart';

    final ThemeData _appTheme = _buildAppTheme();

    ThemeData _buildAppTheme() {
      final ThemeData base = ThemeData.dark();

      return base.copyWith(
          brightness: Brightness.dark,
          primaryColor: Colors.grey[800],
          textTheme: _appTextTheme(base.textTheme)
      );
    }

    TextTheme _appTextTheme( TextTheme base){
      return base.copyWith(
        headline: base.headline.copyWith(
          fontWeight: FontWeight.w500
        ),
            title: base.title.copyWith(
          fontSize: 18.0
      ),

        caption: base.caption.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 14.0
        ),
         body1: base.body1.copyWith(
             fontSize: 20,
             color: Colors.grey
         ),
        button: base.button.copyWith(
          letterSpacing: 2.0,
          fontSize: 14.0
        )
          .apply(
              fontFamily: "Lobster",
        )
      );
    }

void main() => runApp(new MaterialApp(
  theme: _appTheme,
  home: QuizApp(),
));





