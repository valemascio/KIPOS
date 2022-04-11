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
    List<Text> title = [
      const Text(
        'Choose the right pair of shoes',
      ),
      const Text(
        'How to do stretching',
      ),
      const Text('Run with a pace of 80-100bpm')
    ];

    List<Text> descriptions = [
      const Text('Choose the right pair of shoes',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20)),
      const Text('How to do stretching',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20)),
      const Text('Run with a pace of 80-100bpm',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20))
    ];

    List<IconData> icon = [
      Icons.lightbulb_outline_rounded,
      Icons.lightbulb_outline_rounded,
      Icons.lightbulb_outline_rounded
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
                icon[i],
                title[i],
                descriptions[i],
              ),
            )),
      },
    );
  } //build
}
