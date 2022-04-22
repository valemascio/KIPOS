import 'package:flutter/material.dart';
import 'package:kipos/screens/badgePage.dart';
import 'package:kipos/screens/statisticsPage.dart';
import 'package:kipos/screens/logoutPage.dart';
import 'package:kipos/screens/loginPage.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:fitbitter/fitbitter.dart';

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
        title: (const Text('KÍPOS',
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
          /*IconButton(
            icon: Icon(lightbulb),
            onPressed: () async {
              // Authorize the app
              String? userId = await FitbitConnector.authorize(
                  context: context,
                  clientID: '2389XV',
                  clientSecret: '2f7d318cd16701abc91d6e609f6b5215',
                  redirectUri: 'example://fitbit/auth',
                  callbackUrlScheme: 'example://fitbit/auth');
            },
            //print(userId)
          ),*/
          IconButton(
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pushNamed(context, LogoutPage.route);
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            const Text(' '),
            const Text('🏃🏻‍♂️ Weekly Schedule 🏋🏻‍♂️',
                style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 20,
                    fontWeight: FontWeight.bold)
                //fontStyle: FontStyle.italic,
                //fontFamily: 'Outfit') //TextStyle
                ), // Text
            const Text(' '),

            ExpansionTileCard(
              leading: const CircleAvatar(
                backgroundColor: Colors.lightGreen,
                foregroundColor: Colors.white,
                child: Text('1'),
              ),
              title: const Text('1st Week',
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  )),
              subtitle:
                  const Text('Expand to see the recap of this week training'),
              children: <Widget>[
                const Divider(
                  thickness: 1.0,
                  height: 1.0,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
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
                      icon: const Icon(Icons.bar_chart),
                    )
                  ],
                ),
              ],
            ),
            ExpansionTileCard(
              leading: const CircleAvatar(
                backgroundColor: Colors.lightGreen,
                foregroundColor: Colors.white,
                child: Text('2'),
              ),
              title: const Text('2nd Week',
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  )),
              subtitle:
                  const Text('Expand to see the recap of this week training'),
              children: <Widget>[
                const Divider(
                  thickness: 1.0,
                  height: 1.0,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
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
                      icon: const Icon(Icons.bar_chart),
                    )
                  ],
                ),
              ],
            ),
            ExpansionTileCard(
              leading: const CircleAvatar(
                backgroundColor: Colors.lightGreen,
                foregroundColor: Colors.white,
                child: Text('3'),
              ),
              title: const Text('3rd Week',
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  )),
              subtitle:
                  const Text('Expand to see the recap of this week training'),
              children: <Widget>[
                const Divider(
                  thickness: 1.0,
                  height: 1.0,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
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
                      icon: const Icon(Icons.bar_chart),
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
