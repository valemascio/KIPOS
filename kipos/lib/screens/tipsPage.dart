import 'package:flutter/material.dart';
import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';

class Tips {
  final String tips_name;
  final String description;
  final IconData icon;
  //final String wid;
  final Widget box;

  Tips(this.icon, this.tips_name, this.description, /*this.wid*/ this.box);
}

// Home screen
class TipsPage extends StatelessWidget {
  final List<Tips> tips;

  const TipsPage({Key? key, required this.tips}) : super(key: key);

  static const route = '/tips/';
  static const routename = 'TipsPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('💡 Tips'), backgroundColor: Colors.lightGreen),
      // List builder
      body: ListView.builder(
        itemCount: tips.length,
        itemBuilder: (context, index) {
          return ListView(shrinkWrap: true, children: [
            SettingsGroup(
              items: [
                SettingsItem(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(tips: tips[index]),
                        ));
                  },
                  icons: tips[index].icon,
                  iconStyle: IconStyle(
                    iconsColor: Colors.white,
                    withBackground: true,
                    backgroundColor: Colors.lightGreen,
                  ),
                  title: '${tips[index].tips_name}'.toString(),
                  subtitle: '${tips[index].description}'.toString(),
                ),
              ],
            ),
          ]);
        },
      ),
    );
  }
}

// detail screen
class DetailScreen extends StatelessWidget {
  final Tips tips;
  const DetailScreen({Key? key, required this.tips}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightGreen,
        ),
        body: ListView(
          children: <Widget>[
            const Align(
              alignment: Alignment.center,
              child: Text(''),
            ),
            Text(
              '${tips.tips_name}',
              style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  height: 1.5),
              textAlign: TextAlign.center,
            ),
            Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(right: 10, left: 10),
                child: Icon(tips.icon)),
            Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                  child: Text(
                    tips.description,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        color: Color.fromARGB(255, 88, 88, 88),
                        fontSize: 17,
                        height: 1.5),
                  ),
                )),
            Align(
              alignment: Alignment.bottomCenter,
              child: tips.box,
            ),
          ],
        ));
  }
}
