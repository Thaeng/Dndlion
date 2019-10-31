import 'package:dndlion/view/TabBarHome.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dndlion',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TabBarHome().getHome(),
    );
  }

}