import 'package:flutter/material.dart';
import 'package:kipos/screens/homePage.dart';
import 'package:kipos/main.dart';
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

  void _onIntroEnd(context) {
    Navigator.of(context).pushReplacementNamed(HomePage.route);
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
                    "The aim of this app is to never let you loose interest while you train for a marathon! You'll find a weekly goal to keep up with and, if you succeed, you'll gain rewards building week after week your own personal garden! Your gains will also help the environment: after completing the training program, all the trees present in your garden will be planted in their place of origin! And now... LET'S GET TO WORK",
                image: Image.asset('assets/Littlefield_Garden_Trees.jpg'),
                decoration: pageDecoration),
            PageViewModel(
              title: "First things first",
              body:
                  "Before starting you'll need to authorize the app to access your FitBit data: Head over to the Homepage and in the 'Settings' tile of the Menu you can decide when you want to start your training.",
              image: Image.asset(
                  'assets/simulator_screenshot_154FF569-1E6D-4290-B1E4-987D33C4BE2F.png'),
              decoration: pageDecoration,
            ),
          ],
          onDone: () => _onIntroEnd(context),
          showSkipButton: false,
          skipOrBackFlex: 0,
          nextFlex: 0,
          showBackButton: true,
          //rtl: true, // Display as right-to-left
          back: const Icon(Icons.arrow_back),
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
            //color: Colors.black87,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
          ),
        ));
  }
}
