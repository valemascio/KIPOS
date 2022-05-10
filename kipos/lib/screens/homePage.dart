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
  static const user_id = "7TVBB5";

  @override
  Widget build(BuildContext context) {
    const IconData lightbulb = IconData(0xe37b, fontFamily: 'MaterialIcons');
    List<String> numbers = <String>[
      '1',
      '2',
      '3',
      '4',
      '5',
      '6',
      '7',
      '8',
      '9',
      '10',
      '11',
      '12',
      '13',
      '14',
      '15',
      '16'
    ];
    List<String> pos = <String>['1st', '2nd', '3rd', '4th'];

    List<String> preview = <String>[
      '16',
      '23',
      '34',
      '31',
      '39.5',
      '48',
      '37.5',
      '43',
      '46',
      '56',
      '54.5',
      '78',
      '49',
      '43',
      '39',
      '21'
    ];

    return Scaffold(
      appBar: AppBar(
        title: (const Text('KÍPOS',
            style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ))),
        backgroundColor: Colors.lightGreen,
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
            icon: Icon(Icons.download),
            onPressed: () async {
              // Authorize the app
              String? userId = await FitbitConnector.authorize(
                  context: context,
                  clientID: '2389XV',
                  clientSecret: '2f7d318cd16701abc91d6e609f6b5215',
                  redirectUri: 'example://fitbit/auth',
                  callbackUrlScheme: 'example');

              //Instantiate a proper data manager
              FitbitActivityTimeseriesDataManager
                  fitbitActivityTimeseriesDataManager =
                  FitbitActivityTimeseriesDataManager(
                clientID: '2389XV',
                clientSecret: '2f7d318cd16701abc91d6e609f6b5215',
                type: 'steps',
              );

              //Fetch data
              final stepsData = await fitbitActivityTimeseriesDataManager
                  .fetch(FitbitActivityTimeseriesAPIURL.weekWithResource(
                baseDate: DateTime.utc(2022, 5, 10),
                userID: userId,
                resource: fitbitActivityTimeseriesDataManager.type,
              )) as List<FitbitActivityTimeseriesData>;

              // Use them as you want
              final snackBar = SnackBar(
                  content: Text(
                      'Yesterday you walked ${stepsData[6].value} steps!'));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
          ),
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
        const Text('🏃🏻‍♂️ Training Schedule 🏋🏻‍♂️',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 20,
                fontWeight: FontWeight.bold)
            //fontStyle: FontStyle.italic,
            //fontFamily: 'Outfit') //TextStyle
            ), // Text
        const Text(' '),
        const Text('  First Month',
            style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 18,
                fontWeight: FontWeight.bold)),
        for (var i = 0; i < pos.length; i++)
          ExpansionTileCard(
            leading: CircleAvatar(
              backgroundColor: Colors.yellow[700],
              foregroundColor: Colors.white,
              child: Text(
                numbers[i] + '/16',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
            title: Text(pos[i] + ' Week',
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                )),
            subtitle: Text('Weekly goal: ' + preview[i] + 'km'),
            children: <Widget>[
              const Divider(
                thickness: 1.0,
                height: 1.0,
              ),
              Align(
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
        //End first month
        const Text(' '),
        const Divider(
          height: 5,
          thickness: 1.5,
        ),
        const Text(' '),
        const Text('  Second Month',
            style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 18,
                fontWeight: FontWeight.bold)),
        for (var i = 0; i < pos.length; i++)
          ExpansionTileCard(
            leading: CircleAvatar(
              backgroundColor: Colors.red[400],
              foregroundColor: Colors.white,
              child: Text(
                numbers[i + 4] + '/16',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
            title: Text(pos[i] + ' Week',
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                )),
            subtitle: Text('Weekly goal: ' + preview[i + 4] + 'km'),
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
        //End second month
        const Text(' '),
        const Divider(
          height: 5,
          thickness: 1.5,
        ),
        const Text(' '),
        const Text('  Third Month',
            style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 18,
                fontWeight: FontWeight.bold)),
        for (var i = 0; i < pos.length; i++)
          ExpansionTileCard(
            leading: CircleAvatar(
              backgroundColor: Colors.purple[400],
              foregroundColor: Colors.white,
              child: Text(
                numbers[i + 8] + '/16',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
            title: Text(pos[i] + ' Week',
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                )),
            subtitle: Text('Weekly goal: ' + preview[i + 8] + 'km'),
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
        //End third month
        const Text(' '),
        const Divider(
          height: 5,
          thickness: 1.5,
        ),
        const Text(' '),
        const Text('  Fourth Month',
            style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 18,
                fontWeight: FontWeight.bold)),
        for (var i = 0; i < pos.length; i++)
          ExpansionTileCard(
            leading: CircleAvatar(
              backgroundColor: Colors.lightGreen,
              foregroundColor: Colors.white,
              child: Text(
                numbers[i + 12] + '/16',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
            title: Text(pos[i] + ' Week',
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                )),
            subtitle: Text('Weekly goal: ' + preview[i + 12] + 'km'),
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
