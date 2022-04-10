import 'package:flutter/material.dart';
import 'package:kipos/screens/badgePage.dart';
import 'package:kipos/screens/homePage.dart';
import 'package:kipos/screens/statisticsPage.dart';
import 'package:kipos/screens/tipsPage.dart';

void main() {
  runApp(const MyApp());
} //main

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    List<String> descriptions = [
      'Testo tip 1',
      'Testo tip 2',
      'Testo tip 3',
    ];

    List<String> title = [
      'Choose the right pair of shoes',
      'How to do stretching',
      'Run with a pace of 80-100bpm'
    ];

    return MaterialApp(
      initialRoute:
          HomePage.route, //Poi sara' da sostituire con LoginPage.route (?)
      routes: {
        HomePage.route: (context) => HomePage(),
        BadgePage.route: (context) => BadgePage(),
        StatisticsPage.route: (context) => StatisticsPage(),
        TipsPage.route: (context) => TipsPage(
                tasks: List.generate(
              3,
              (i) => Task(
                title[i],
                descriptions[i],
              ),
            )),
      },
    );
  } //build
}//MyApp
