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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text(' '),
              ExpansionTileCard(
                title: Text('Distance',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.lightGreen,
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
              ),
              Divider(
                height: 5,
                thickness: 1.5,
              ),
              ExpansionTileCard(
                //leading: Icon(Icons.bar_chart),
                title: Text('Pace',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromARGB(255, 211, 49, 49),
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
              ),
              Divider(
                height: 5,
                thickness: 1.5,
              ),
              ExpansionTileCard(
                title: Text('Calories',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromARGB(255, 38, 26, 214),
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
              ),
              Divider(
                height: 5,
                thickness: 1.5,
              ),
              ExpansionTileCard(
                title: Text('Sleep',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromARGB(255, 153, 0, 255),
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
              ),
              /*Divider(
                height: 5,
                thickness: 1.5,
              ),*/
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
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.home, semanticLabel: 'Home')),
                IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.bar_chart, semanticLabel: 'Statistics')),
              ],
            )));
  }
}
