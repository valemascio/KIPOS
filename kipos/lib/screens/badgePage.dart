import 'package:flutter/material.dart';
import 'package:kipos/screens/statisticsPage.dart';

class BadgePage extends StatelessWidget {
  const BadgePage({Key? key}) : super(key: key);

  static const route = '/badge/';
  static const routename = 'badgePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: (const Text('Bages')),
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
                  onPressed: () {},
                  icon: Icon(Icons.shield_rounded, semanticLabel: 'Badges')),
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.home, semanticLabel: 'Home')),
              IconButton(
                  onPressed: () {
                    Navigator.popAndPushNamed(context, StatisticsPage.route);
                  },
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
