import 'package:flutter/material.dart';
import 'package:space_nasa/presentation/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nasa Daily',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      darkTheme: ThemeData.dark(),
      home: Home(),
    );
  }
}