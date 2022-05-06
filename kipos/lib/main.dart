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
      const Text('Choose the right pair of shoes'),
      const Text('How to do stretching'),
      const Text('Which is your ideal running heart rate?'),
      const Text('Get enough sleep'),
      const Text('Keep hydrated'),
      const Text('Some numbers')
    ];

    List<Widget> descriptions = [
      const Padding(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Text('''
Choose the right pair of shoes is important to prevent injuries. When looking for a pair oh shoes you need to look for the following elements: 
- the upper side should shape just like your foot and that should be smooth and should not scratch you foot. 
- the back side should not irritates the Achilles tendon + the heel should allows you to have a comfortable ankle motion.
- pay attention that the laces and the padded tongue hold the foot firmly and do not let it slip inside the shoe.
- you need to look for materials in the outsole that gives you traction but without adding excess weight while running.
- it is important that the shoe has the so called ‘toe spring’ in order to help you roll your foot through the stride.
- the material used in the midsole need to minimise the impact shock of the heel strike. 
''',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black, fontSize: 15))),
      //
      const Padding(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Text('''
Before each run it is extremely important to stretch your muscles. You can do it following these three steps:
1. Mobilise you joints (ankles, knees and hips). 
2. Warm up encouraging the blood flow to the muscles. You can try a 5 minutes jog or a fast walk.
3. Finally, you can stretch your muscle. Focus on your quadriceps, hamstrings, inner thighs and glutes. ''',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black, fontSize: 15))),
      //
      const Padding(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Text('''
When you run, monitoring the heart rate is very important. 
It is recommended a target heart rate equal to the 70-85% of your maximum heart rate. 
To compute it, you can start by estimating your maximum heart rate, subtracting your age from 220. 
Then, multiply the result first with 0.7 (that is the lowest index in the range) and then with 0.85 (that is the highest). 

For example, if you age is 25, you maximum heart rate will be 195, and the target heart rate range will be [136 - 166].''',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black, fontSize: 15))),
      //
      const Padding(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Text('''
Running without enough amount of sleep can leads to injury, poor performances and overtraining syndrome. This is because not getting enough sleep doesn’t allow time for your body to do what it need to repair itself and it doesn’t have so much fuel/energy. 
Are you getting enough sleep? Let’s check the statistics 👇🏻''',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black, fontSize: 15))),
      //
      const Padding(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Text('''
Did you know?
- A runner can easily lose 2-3+ pints of fluid an hour in warm conditions.
- A 2% decrease in hydration, leads to a 10-20% decrease in aerobic capacity.
- A carbohydrate-electrolyte drink is absorbed faster than water.''',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black, fontSize: 15))),
      //
      const Padding(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Text('''
- Only the top 5 per cent of runners complete marathons in under three hours.
- The world record for marathon times are 2:01:39 for men and 2:15:25 for women. 
- The global average time for a marathon stands at around 4 hours 21 minutes – with men’s average times at 4 hours 13 minutes, and women at 4 hours 42 minutes.''',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black, fontSize: 15))),
    ];

    List<IconData> icon = [
      MdiIcons.shoeSneaker,
      MdiIcons.karate,
      MdiIcons.heartPulse,
      MdiIcons.sleep,
      MdiIcons.water,
      MdiIcons.numeric
    ];

    List<Widget> wid = [
      ClipRRect(
        borderRadius: BorderRadius.circular(20), // Image border
        child: SizedBox.fromSize(
          size: Size.fromRadius(100), // Image radius
          child: Image.network(
              'https://images.ctfassets.net/628ldvrkioqn/3t81mQfOKRBUA4JvZFfflv/2e377613c15f7c3fd41fcf6f6d08a050/Road_Running_Shoes_Article_Update_2020_Thumb.jpg?w=1200&fit=thumb',
              fit: BoxFit.cover),
        ),
      ),
      ClipRRect(
        borderRadius: BorderRadius.circular(20), // Image border
        child: SizedBox.fromSize(
          size: Size.fromRadius(100), // Image radius
          child: Image.network(
              'https://www.corebosport.com/wp-content/uploads/2020/04/lo-stretching-durante-il-riscaldamento.jpg',
              fit: BoxFit.cover),
        ),
      ),
      ClipRRect(
        borderRadius: BorderRadius.circular(20), // Image border
        child: SizedBox.fromSize(
          size: Size.fromRadius(100), // Image radius
          child: Image.network(
              'https://www.bhf.org.uk/-/media/new-site-images/informationsupport/heart-matters/2021/september-2021/medical/ate/pulse-rate-watch-300x196.jpg?rev=a02e628c8bd8456bb37f364fbf445943&h=196&w=300&la=en&hash=13A9335CBF4D42A48F11B4D9C63EEDD87CF9CE7C',
              fit: BoxFit.cover),
        ),
      ),
      ClipRRect(
        borderRadius: BorderRadius.circular(20), // Image border
        child: SizedBox.fromSize(
          size: Size.fromRadius(100), // Image radius
          child: Image.network(
              'https://cdn-prod.medicalnewstoday.com/content/images/articles/322/322945/person-sleeping-in-bed-with-eye-mask-on.jpg',
              fit: BoxFit.cover),
        ),
      ),
      ClipRRect(
        borderRadius: BorderRadius.circular(20), // Image border
        child: SizedBox.fromSize(
          size: Size.fromRadius(100), // Image radius
          child: Image.network(
              'https://www.eatthis.com/wp-content/uploads/sites/4/2020/08/black-woman-drinking-bottled-water.jpg?quality=82&strip=1',
              fit: BoxFit.cover),
        ),
      ),
      ClipRRect(
        borderRadius: BorderRadius.circular(20), // Image border
        child: SizedBox.fromSize(
          size: Size.fromRadius(100), // Image radius
          child: Image.network(
              'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/apple-watch-5-1584723939.png?resize=480:*',
              fit: BoxFit.cover),
        ),
      ),
    ];

    List<Widget> box = [
      SizedBox(), //shoes
      SizedBox(), //stretching
      SizedBox(), //music
      Builder(
        builder: (context) => ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, StatisticsPage.route);
          },
          child: Text('Statistics'),
          style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(255, 122, 164, 94),
              fixedSize: const Size(100, 50),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50))),
        ),
      ), //sleep
      SizedBox(), //keep hydrated
      SizedBox() //numbers
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
                tips: List.generate(
              6,
              (i) => Tips(
                icon[i],
                title[i],
                descriptions[i],
                wid[i],
                box[i],
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
