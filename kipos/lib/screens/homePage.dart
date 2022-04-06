import 'package:flutter/material.dart';
//Bisogna importare anche le directories per tip, profile, badges, stats

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const route = '/home/';
  static const routename = 'HomePage';

  @override
  Widget build(BuildContext context) {
    const IconData lightbulb = IconData(0xe37b, fontFamily: 'MaterialIcons');
    int _selectedIndex = 0;
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
                  fontStyle: FontStyle.italic), //TextStyle
            ), // Text

            ListTile(
                title: Text('1st Week',
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 18,
                    )),
                onTap: () {},
                trailing: Icon(Icons.info)),
            //Rendere il widget stateful
          ],
        ),
      ),
      bottomNavigationBar: Container(
          height: 90,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.shield_rounded, semanticLabel: 'Badges')),
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.home, semanticLabel: 'Home')),
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.bar_chart, semanticLabel: 'Statistics')),
            ],
          )
          // BottomNavigationBar(
          // items: const [
          //   BottomNavigationBarItem(
          //     icon: Icon(Icons.shield_rounded),
          //     label: 'Badges',
          //   ),
          //   BottomNavigationBarItem(
          //     icon: Icon(Icons.home),
          //     label: 'Home',
          //   ),
          //   BottomNavigationBarItem(
          //     icon: Icon(Icons.bar_chart),
          //     label: 'Statistics',
          //   ),
          // ],
          // ),
          ),
    );
  }
}
