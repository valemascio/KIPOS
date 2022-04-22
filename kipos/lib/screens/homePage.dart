import 'package:flutter/material.dart';
import 'package:kipos/screens/badgePage.dart';
import 'package:kipos/screens/statisticsPage.dart';
import 'package:kipos/screens/logoutPage.dart';
import 'package:kipos/screens/loginPage.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
//import 'package:fitbitter/fitbitter.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const route = '/home/';
  static const routename = 'HomePage';

  @override
  Widget build(BuildContext context) {
    const IconData lightbulb = IconData(0xe37b, fontFamily: 'MaterialIcons');
    List<String> numbers = <String>[
      '1',
      '2',
      '3',
      '4',
      '1',
      '2',
      '3',
      '4',
      '1',
      '2',
      '3',
      '4',
      '1',
      '2',
      '3',
      '4'
    ];
    List<String> pos = <String>[
      '1st',
      '2nd',
      '3rd',
      '4th',
      '5th',
      '6th',
      '7th',
      '8th',
      '9th',
      '10th',
      '11th',
      '12th',
      '13th',
      '14th',
      '15th',
      '16th'
    ];
    return Scaffold(
      appBar: AppBar(
        title: (const Text('KÍPOS',
            style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontFamily: 'GFS Neohellenic'))),
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
      body: ListView(children: [
        const Text(' '),
        const Text('🏃🏻‍♂️ Weekly Schedule 🏋🏻‍♂️',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 20,
                fontWeight: FontWeight.bold)
            //fontStyle: FontStyle.italic,
            //fontFamily: 'Outfit') //TextStyle
            ), // Text
        const Text(' '),
        for (var i = 0; i < pos.length; i++)
          ExpansionTileCard(
            leading: CircleAvatar(
              backgroundColor: Colors.lightGreen,
              foregroundColor: Colors.white,
              child: Text(numbers[i]),
            ),
            title: Text(pos[i] + ' Week',
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
      ]),
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
