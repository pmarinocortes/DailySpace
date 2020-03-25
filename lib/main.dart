import 'package:flutter/material.dart';
import 'package:space_nasa/presentation/home.dart';
import 'package:space_nasa/presentation/splash_screen.dart';

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
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.orange
      ),
      home: SplashScreen(),
    );
  }
}
