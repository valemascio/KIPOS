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
      const Text('Run with a pace of 80-100bpm')
    ];

    List<Text> descriptions = [
      const Text('Choose the right pair of shoes',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 10)),
      const Text('How to do stretching',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 10)),
      const Text('Run with a pace of 80-100bpm',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 10))
    ];

    List<IconData> icon = [
      MdiIcons.shoeSneaker,
      MdiIcons.karate,
      MdiIcons.music
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
              3,
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
