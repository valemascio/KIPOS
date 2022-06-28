import 'package:flutter/material.dart';
import 'package:kipos/screens/homePage.dart';
import 'package:kipos/screens/prehomePage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  static const route = '/introduction/';
  static const routename = 'introPage';

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) async {
    final access = await SharedPreferences.getInstance();
    String? auth = access.getString('pass');
    if (auth != 'stop') {
      Navigator.of(context).pushReplacementNamed(PreHomePage.route);
    } else {
      Navigator.of(context).pushReplacementNamed(HomePage.route);
    }
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);

    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return Scaffold(
        appBar: AppBar(
          title: (const Text('Introduction to Kìpos 🌳')),
          backgroundColor: Colors.lightGreen,
        ),
        body: IntroductionScreen(
          key: introKey,
          globalBackgroundColor: Colors.white,
          pages: [
            PageViewModel(
                title: "Welcome to Kìpos!",
                body:
                    '''The aim of this app is to never let you loose interest while you train for a marathon!
You'll find a weekly goal to keep up with and, if you succeed, you'll gain rewards building week after week your own personal garden!
Your gains will also help the environment: after completing the training program, all the trees present in your garden will be planted in their place of origin! 
And now... LET'S GET TO WORK''',
                image: Image.asset('assets/garden.jpg'),
                decoration: pageDecoration),
            PageViewModel(
              title: "First things first",
              body:
                  '''Before starting you'll need to authorize the app to access your FitBit data: Head over to the Homepage and in the 'Settings' tile of the Menu you can decide when you want to start your training.
Once your data is uploaded, you will be able to update your progress using the Refresh button in the centre of the NavigationBar on the Home screen.
Please note that the data update cannot be performed more than 200 times per hour as otherwise the data transmission will be paused for the next 60 minutes.''',
              image: Image.asset('assets/tendina.png'),
              decoration: pageDecoration,
            ),
            PageViewModel(
              title: "Follow the steps",
              body: '''1. Pick a starting date for your training,
2. Authorize Kìpos to process your personal data,
3. Head over to the HomePage! ''',
              image: Image.asset('assets/settingsPage.png'),
              decoration: pageDecoration,
            ),
            PageViewModel(
              title: "Consent for personal data treatment",
              body:
                  '''Please note that in order to use Kìpos your consent to the processing of your personal data is required.
By clicking on "Authorize" you consent to such processing. 
You can withdraw your consent at any time by clicking on "Unauthorize". 
We also inform you that you can exercise your right to delete your data by clicking on "Delete Data".''',
              image: Image.asset('assets/settingsPage_underlined.png'),
              decoration: pageDecoration,
            ),
          ],
          onDone: () => _onIntroEnd(context),
          onSkip: () => _onIntroEnd(context),
          showSkipButton: true,
          showBackButton: false,
          skip:
              const Text("Skip", style: TextStyle(fontWeight: FontWeight.w600)),
          next: const Icon(Icons.arrow_forward),
          done: const Text('Homepage',
              style: TextStyle(fontWeight: FontWeight.w600)),
          curve: Curves.fastLinearToSlowEaseIn,
          controlsMargin: const EdgeInsets.all(16),
          dotsDecorator: const DotsDecorator(
            size: Size(10.0, 10.0),
            color: Color(0xFFBDBDBD),
            activeSize: Size(22.0, 10.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
            ),
          ),
          dotsContainerDecorator: const ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
          ),
        ));
  }
}
