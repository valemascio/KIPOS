import 'package:flutter/material.dart';
import 'package:kipos/screens/badgePage.dart';
import 'package:kipos/screens/homePage.dart';
import 'package:kipos/screens/statisticsPage.dart';
import 'package:kipos/screens/tipsPage.dart';
import 'package:kipos/screens/loginPage.dart';
import 'package:kipos/screens/logoutPage.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:fitbitter/fitbitter.dart';

void main() {
  runApp(const MyApp());
} //main

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    List<Text> title = [
      const Text(
        'Choose the right pair of shoes',
      ),
      const Text(
        'How to do stretching',
      ),
      const Text('Calculate your ideal running heart rate'),
      const Text('Get enough sleep')
    ];

    List<Text> descriptions = [
      const Text('Choose the right pair of shoes',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black, fontSize: 30)),
      const Text('How to do stretching',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black, fontSize: 10)),
      const Text('''When you run, monitoring the heart rate is very important. 
      It is recommended a target heart rate equal to the 70-85% of your maximum heart rate. 
      To compute it, you can start by estimating your maximum heart rate, subtracting your age from 220. 
      Then, multiply the result first with 0.7 (that is the lowest index in the range) and then with 0.85 (that is the highest). 
      For example, if you age is 25, you maximum heart rate will be 195, and the target heart rate range will be [136 - 166].''',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black, fontSize: 20)),
      const Text('Get enough sleep',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black, fontSize: 30))
    ];

    List<IconData> icon = [
      MdiIcons.shoeSneaker,
      MdiIcons.karate,
      MdiIcons.music,
      MdiIcons.sleep,
    ];

    return MaterialApp(
      initialRoute: LoginPage.route,
      routes: {
        LoginPage.route: (context) => LoginPage(),
        HomePage.route: (context) => HomePage(),
        LogoutPage.route: (context) => LogoutPage(),
        BadgePage.route: (context) => BadgePage(),
        StatisticsPage.route: (context) => StatisticsPage(),
        TipsPage.route: (context) => TipsPage(
                tasks: List.generate(
              4,
              (i) => Task(
                icon[i],
                title[i],
                descriptions[i],
              ),
            )),
      },
    );
  } //build

}

/*String? userId = await FitbitConnector.authorize(
       context: context,
       clientID: '<OAuth 2.0 Client ID>',
        clientSecret: '<Client Secret>',
        redirectUri: '<Redirect Uri used during the registration, e.g., example://fitbit/auth>',
        callbackUrlScheme: '<Callback Uri scheme, e.g., example>');
*/
