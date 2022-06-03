import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Tips {
  final Text tips_name;
  final Widget description;
  final IconData icon;
  final Widget wid;
  final Widget box;

  Tips(this.icon, this.tips_name, this.description, this.wid, this.box);
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
          title: const Text('💡 Tips'),
          /*leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },*/
          backgroundColor: Colors.lightGreen),
      // List builder
      body: ListView.builder(
        itemCount: tips.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: tips[index].tips_name,
            leading: Icon(tips[index].icon),
            trailing: const Icon(
              Icons.arrow_right,
              color: Colors.grey,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(tips: tips[index]),
                ),
              );
            },
          );
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
          title: tips.tips_name,
          backgroundColor: Colors.lightGreen,
        ),
        body: ListView(
          children: <Widget>[
            const Align(
              alignment: Alignment.center,
              child: Text(''),
            ),
            Align(
              alignment: Alignment.center,
              child: tips.wid,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: tips.description,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: tips.box,
            ),
          ],
        ));
  }
}
