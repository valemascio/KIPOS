import 'package:flutter/material.dart';
import 'package:kipos/screens/badgePage.dart';
import 'package:kipos/screens/homePage.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/src/widgets/basic.dart';

class StatisticsPage extends StatelessWidget {
  const StatisticsPage({Key? key}) : super(key: key);

  static const route = '/statistics/';
  static const routename = 'statisticsPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: (const Text('📊 Statistics ')),
          backgroundColor: Colors.lightGreen,
        ),
        body: Center(
          child: ListView(
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text(' '),
              Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                  child: ExpansionTileCard(
                    title: Text('📏 Distance',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color.fromARGB(255, 122, 164, 94),
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        )),
                    subtitle: Text('Tap to see how many km/miles have you run',
                        textAlign: TextAlign.center),
                    children: <Widget>[
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 8.0,
                          ),
                          child: Text('You have run this many km'),
                        ),
                      ),
                    ],
                    trailing: SizedBox(),
                  )),
              Divider(
                height: 5,
                thickness: 1.5,
                indent: 10,
                endIndent: 10,
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                  child: ExpansionTileCard(
                    //leading: Icon(Icons.bar_chart),
                    title: Text('⏱ Pace',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color.fromARGB(255, 154, 0, 205),
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        )),
                    subtitle: Text('Tap to see how fast have you run',
                        textAlign: TextAlign.center),
                    children: <Widget>[
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 8.0,
                          ),
                          child: Text('You have run this fast'),
                        ),
                      ),
                    ],
                    trailing: SizedBox(),
                  )),
              Divider(
                height: 5,
                thickness: 1.5,
                indent: 10,
                endIndent: 10,
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                  child: ExpansionTileCard(
                    title: Text('🔥 Calorie',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color.fromARGB(255, 211, 49, 49),
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        )),
                    subtitle: Text('Tap to see how many kcal have you burn',
                        textAlign: TextAlign.center),
                    children: <Widget>[
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 8.0,
                          ),
                          child: Text('You have burn this many kcal'),
                        ),
                      ),
                    ],
                    trailing: SizedBox(),
                  )),
              Divider(
                height: 5,
                thickness: 1.5,
                indent: 10,
                endIndent: 10,
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                  child: ExpansionTileCard(
                    title: Text('😴 Sleep',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 64, 168),
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        )),
                    subtitle: Text('Tap to see your sleep quality',
                        textAlign: TextAlign.center),
                    children: <Widget>[
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 8.0,
                          ),
                          child: Text('Your sleep'),
                        ),
                      ),
                    ],
                    trailing: SizedBox(),
                  )),
              Divider(
                height: 5,
                thickness: 1.5,
                indent: 10,
                endIndent: 10,
              ),
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
                      Navigator.popAndPushNamed(context, BadgePage.route);
                    },
                    icon: Icon(Icons.shield_rounded, semanticLabel: 'Badges')),
                IconButton(
                    onPressed: () {
                      Navigator.popAndPushNamed(context, HomePage.route);
                    },
                    icon: Icon(Icons.home, semanticLabel: 'Home')),
                IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.bar_chart, semanticLabel: 'Statistics')),
              ],
            )));
  }
}
