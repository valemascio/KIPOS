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
      'Testo tip 4',
      'Testo tip 5',
      'Testo tip 6',
      'Testo tip 7',
      'Testo tip 8',
      'Testo tip 9',
      'Testo tip 10'
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
              10,
              (i) => Task(
                'Tips $i',
                descriptions[i],
              ),
            )),
      },
    );
  } //build
}//MyApp
