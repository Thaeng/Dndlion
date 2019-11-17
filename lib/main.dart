import 'package:dndlion/model/Character.dart';
import 'package:dndlion/view/TabBarHome.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  static const TextStyle _defaultTextStyle = TextStyle(color: Colors.white, fontSize: 20.0);
  final Character _character = Character();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dndlion',
      //theme: _buildTheme(),
      home: TabBarHome(_character, context).getHome(),
    );
  }

  ThemeData _buildTheme(){
    int test = 70;
    return ThemeData(
      primaryColor: Colors.black.withRed(test).withBlue(test).withGreen(test),
      scaffoldBackgroundColor: Colors.black.withRed(test).withBlue(test).withGreen(test),
      accentColor: Colors.white,
      primaryIconTheme: IconThemeData(
        color: Colors.white
      ),
      dialogTheme: DialogTheme(
        backgroundColor: Colors.black.withRed(test).withBlue(test).withGreen(test),
        contentTextStyle: _defaultTextStyle,
        titleTextStyle: _defaultTextStyle,
      ),
      textTheme: TextTheme(
        body1: _defaultTextStyle,
        body2: _defaultTextStyle,
        button: _defaultTextStyle,
        caption: _defaultTextStyle,
        display1: _defaultTextStyle,
        display2: _defaultTextStyle,
        display3: _defaultTextStyle,
        display4: _defaultTextStyle,
        headline: _defaultTextStyle,
        overline: _defaultTextStyle,
        subhead: _defaultTextStyle,
        subtitle: _defaultTextStyle,
        title: _defaultTextStyle,
      ),
    );
  }

}

