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
        leading: IconButton(
          icon: Icon(
            lightbulb,
            color: Colors.white,
          ),
          onPressed: () {
            //Inserire Navigator verso lo screen Tips
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.account_circle_outlined,
              color: Colors.white,
            ),
            onPressed: () {
              //Inserire navigator verso lo screen profilo -> dentro mettere logout
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'Achievements',
              style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }
}
