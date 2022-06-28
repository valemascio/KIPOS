import 'package:flutter/material.dart';
import 'package:kipos/database/entities/dati.dart';
import 'package:kipos/screens/alertPage.dart';
import 'package:kipos/screens/badgePage.dart';
import 'package:kipos/screens/deletePage.dart';
import 'package:kipos/screens/preferencePage.dart';
import 'package:kipos/screens/homePage.dart';
import 'package:kipos/screens/prehomePage.dart';
import 'package:kipos/screens/profilePage.dart';
import 'package:kipos/screens/settingsPage.dart';
import 'package:kipos/screens/statisticsPage.dart';
import 'package:kipos/screens/tipsPage.dart';
import 'package:kipos/screens/loginPage.dart';
import 'package:kipos/screens/logoutPage.dart';
import 'package:kipos/screens/introPage.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:kipos/database/database.dart';
import 'package:kipos/repository/databaseRepository.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final AppDatabase database =
      await $FloorAppDatabase.databaseBuilder('database_kipos_app.db').build();
  final databaseRepository = DatabaseRepository(database: database);

  runApp(ChangeNotifierProvider<DatabaseRepository>(
    create: (context) => databaseRepository,
    child: MyApp(),
  ));
} //main

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    List<String> title = [
      'Choose the right pair of shoes',
      'How to do stretching',
      'Which your ideal running heart rate?',
      'Get enough sleep',
      'Keep hydrated',
      'Some numbers',
      'Optimize your training diet'
    ];

    List<String> descriptions = [
      '''
Choose the right pair of shoes is important to prevent injuries. When looking for a pair of shoes you need to look for the following elements: 

- the upper side should shape just like your foot and that should be smooth and should not scratch you foot. 

- the back side should not irritates the Achilles tendon + the heel should allows you to have a comfortable ankle motion.

- pay attention that the laces and the padded tongue hold the foot firmly and do not let it slip inside the shoe.

- you need to look for materials in the outsole that gives you traction but without adding excess weight while running.

- it is important that the shoe has the so called ‘toe spring’ in order to help you roll your foot through the stride.

- the material used in the midsole need to minimise the impact shock of the heel strike. 
''',
      '''Before each run it is extremely important to stretch your muscles. You can do it following these three steps:

1. Mobilise you joints (ankles, knees and hips). 

2. Warm up encouraging the blood flow to the muscles. You can try a 5 minutes jog or a fast walk.

3. Finally, you can stretch your muscle. Focus on your quadriceps, hamstrings, inner thighs and glutes.
 ''',
      '''When you run, monitoring the heart rate is very important. 
It is recommended a target heart rate equal to the 70-85% of your maximum heart rate. 
To compute it, you can start by estimating your maximum heart rate, subtracting your age from 220. 
Then, multiply the result first with 0.7 (that is the lowest index in the range) and then with 0.85 (that is the highest). 

''',
      '''Running without enough amount of sleep can leads to injury, poor performances and overtraining syndrome. 

This is because not getting enough sleep doesn’t allow time for your body to do what it need to repair itself and it doesn’t have so much fuel/energy. 
''',
      '''
Did you know?

- A runner can easily lose 2-3+ pints of fluid an hour in warm conditions.

- A 2% decrease in hydration, leads to a 10-20% decrease in aerobic capacity.

- A carbohydrate-electrolyte drink is absorbed faster than water.''',
      '''
- Only the top 5 per cent of runners complete marathons in under three hours.

- The world record for marathon times are 2:01:39 for men and 2:15:25 for women. 

- The global average time for a marathon stands at around 4 hours 21 minutes – with men’s average times at 4 hours 13 minutes, and women at 4 hours 42 minutes.''',
      '''
Meals should be balanced and include whole grains, protein, fat, fruits and vegetables. 

Meal timing matters as well! You should eat a full meal about three to four hours before your run. 

It's also wise to consume a small snack of carbohydrates and protein one to two hours before your workout.'''
    ];

    List<IconData> icon = [
      MdiIcons.shoeSneaker,
      MdiIcons.karate,
      MdiIcons.heartPulse,
      MdiIcons.sleep,
      MdiIcons.water,
      MdiIcons.numeric,
      MdiIcons.food
    ];

    List<Widget> box = [
      SizedBox(), //shoes
      SizedBox(), //stretching
      Container(
        child: Center(
          child: Padding(
            padding: EdgeInsets.fromLTRB(5, 10, 10, 5),
            child: Consumer<DatabaseRepository>(
              builder: (context, value, child) {
                return FutureBuilder(
                    initialData: null,
                    future: value.findAllPerson(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final userDati = snapshot.data as List<Person>;
                        String? userName = userDati[0].name;
                        int? userAge = userDati[0].age;
                        return Text(
                          'Hello $userName! Since your age is $userAge, your maximum heart rate will be ${220 - (userAge as int)}, and the target heart rate range will be [${(0.7 * (220 - (userAge))).toInt()} - ${(0.85 * (220 - (userAge))).toInt()}].',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        );
                      } else {
                        //A CircularProgressIndicator is shown while the list of Todo is loading.
                        return CircularProgressIndicator();
                      }
                    });
              },
            ),
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color.fromARGB(255, 255, 255, 255),
          boxShadow: const [
            BoxShadow(
                color: Color.fromARGB(255, 122, 164, 94), spreadRadius: 3),
          ],
        ),
        height: 100,
        width: 250,
      ),
      SizedBox(), //music
      SizedBox(), //keep hydrated
      SizedBox(),
      SizedBox() //numbers
    ];

    return MaterialApp(
      initialRoute: LoginPage.route,
      routes: {
        LoginPage.route: (context) => LoginPage(),
        PreferencePage.route: (context) => PreferencePage(),
        DeletePage.route: (context) => DeletePage(),
        HomePage.route: (context) => HomePage(),
        LogoutPage.route: (context) => LogoutPage(),
        BadgePage.route: (context) => BadgePage(),
        StatisticsPage.route: (context) => StatisticsPage(),
        SettingsPage.route: (context) => SettingsPage(),
        PreHomePage.route: (context) => PreHomePage(),
        AlertPage.route: (context) => AlertPage(),
        ProfilePage.route: (context) => ProfilePage(),
        IntroPage.route: (context) => IntroPage(),
        TipsPage.route: (context) => TipsPage(
                tips: List.generate(
              7,
              (i) => Tips(
                icon[i],
                title[i],
                descriptions[i],
                box[i],
              ),
            )),
      },
    );
  }
}
