import 'package:flutter/material.dart';
import 'package:kipos/screens/badgePage.dart';
import 'package:kipos/screens/homePage.dart';

class StatisticsPage extends StatelessWidget {
  const StatisticsPage({Key? key}) : super(key: key);

  static const route = '/statistics/';
  static const routename = 'statisticsPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: (const Text('Statistics')),
        backgroundColor: const Color.fromARGB(255, 34, 175, 34),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      bottomNavigationBar: Container(
          height: 90,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.popAndPushNamed(context, BadgePage.route);
                  },
                  icon: Icon(Icons.shield_rounded, semanticLabel: 'Badges')),
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.home, semanticLabel: 'Home')),
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.bar_chart, semanticLabel: 'Statistics')),
            ],
          )
          // BottomNavigationBar(
          // items: const [
          //   BottomNavigationBarItem(
          //     icon: Icon(Icons.shield_rounded),
          //     label: 'Badges',
          //   ),
          //   BottomNavigationBarItem(
          //     icon: Icon(Icons.home),
          //     label: 'Home',
          //   ),
          //   BottomNavigationBarItem(
          //     icon: Icon(Icons.bar_chart),
          //     label: 'Statistics',
          //   ),
          // ],
          // ),
          ),
    );
  }
}
