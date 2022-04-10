import 'package:flutter/material.dart';
import 'package:kipos/screens/badgePage.dart';
import 'package:kipos/screens/statisticsPage.dart';
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
                fontSize: 26,
                fontWeight: FontWeight.bold))),
        backgroundColor: Color.fromARGB(213, 43, 184, 43),
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
              'Achievements',
              style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic), //TextStyle
            ), // Text

            ListTile(
                title: const Text('1st Week',
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 18,
                    )),
                onTap: () {},
                trailing: const Icon(Icons.info)),
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
                  icon: const Icon(Icons.shield_rounded,
                      semanticLabel: 'Badges')),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.home, semanticLabel: 'Home')),
              IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, StatisticsPage.route);
                  },
                  icon:
                      const Icon(Icons.bar_chart, semanticLabel: 'Statistics')),
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
