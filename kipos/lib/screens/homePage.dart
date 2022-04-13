import 'package:flutter/material.dart';
import 'package:kipos/screens/badgePage.dart';
import 'package:kipos/screens/statisticsPage.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
//Bisogna importare anche le directories per tip, profile, badges, stats

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const route = '/home/';
  static const routename = 'HomePage';

  @override
  Widget build(BuildContext context) {
    const IconData lightbulb = IconData(0xe37b, fontFamily: 'MaterialIcons');
    int _selectedIndex = 0;
    return Scaffold(
      appBar: AppBar(
        title: (const Text('KÌPOS',
            style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontSize: 30,
                fontWeight: FontWeight.bold))),
        backgroundColor: Color.fromARGB(213, 34, 175, 34),
        leading: IconButton(
          icon: const Icon(
            lightbulb,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/tips/');
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.account_circle_outlined,
              color: Colors.white,
            ),
            onPressed: () {
              //Inserire navigator verso lo screen profilo -> dentro mettere logout
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            const Text(
              'Progress',
              style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic), //TextStyle
            ), // Text

            ExpansionTileCard(
              leading: CircleAvatar(
                backgroundColor: Colors.lightGreen,
                foregroundColor: Colors.white,
                child: Text('1st'),
              ),
              title: Text('1st Week',
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  )),
              subtitle: Text('Expand to see the recap of this week training'),
              children: <Widget>[
                Divider(
                  thickness: 1.0,
                  height: 1.0,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                    child: Text(
                        'You have run this many km, burned this many cal and done this many steps'),
                  ),
                ),
                ButtonBar(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, StatisticsPage.route);
                      },
                      icon: Icon(Icons.bar_chart),
                    )
                  ],
                ),
              ],
            ),
            //Rendere il widget stateful
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 90,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, BadgePage.route);
                },
                icon:
                    const Icon(Icons.shield_rounded, semanticLabel: 'Badges')),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.home, semanticLabel: 'Home')),
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, StatisticsPage.route);
                },
                icon: const Icon(Icons.bar_chart, semanticLabel: 'Statistics')),
          ],
        ),
      ),
    );
  }
}
