import 'package:flutter/material.dart';
//Bisogna importare anche le directories per tip, profile, badges, stats

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const route = '/home/';
  static const routename = 'HomePage';

  @override
  Widget build(BuildContext context) {
    const IconData lightbulb = IconData(0xe37b, fontFamily: 'MaterialIcons');

    return Scaffold(
      appBar: AppBar(
        title: (Text('KÌPOS')),
        backgroundColor: Color.fromARGB(255, 34, 175, 34),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                icon: Icon(
                  lightbulb,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  Icons.account_circle_outlined,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            ],
          )
        ],
      ),
    );
  }
}
