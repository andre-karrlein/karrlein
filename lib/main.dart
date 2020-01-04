import 'package:flutter/material.dart';
import 'package:karrlein/profile_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'André Karrlein',
      theme: ThemeData(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        iconTheme: new IconThemeData(color: Colors.blue),
        fontFamily: "PT Sans",
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        backgroundColor: Colors.black,
        iconTheme: new IconThemeData(color: Colors.white),
        fontFamily: "PT Sans",
      ),
      home: ProfilePage(),
    );
  }
}
