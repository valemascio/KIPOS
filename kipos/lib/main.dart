import 'package:flutter/material.dart';
import 'package:kipos/screens/homePage.dart';

void main() {
  runApp(const MyApp());
} //main

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomePage.route, //Poi sara' da sostituire con il login
      routes: {
        HomePage.route: (context) => HomePage(),
      },
    );
  } //build
}//MyApp
