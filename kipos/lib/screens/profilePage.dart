import 'package:flutter/material.dart';
import 'package:kipos/screens/badgePage.dart';
import 'package:kipos/screens/homePage.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/src/widgets/basic.dart';

/*static const route = '/profile/';
  static const routename = 'profilePage';*/

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key, String? title}) : super(key: key);

  static const route = '/profile/';
  static const routename = 'profilePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '👤 Profile',
        ),
        backgroundColor: Colors.lightGreen,
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.bottomCenter,
              children: [
                Image(
                  height: MediaQuery.of(context).size.height / 3,
                  fit: BoxFit.cover,
                  image: const NetworkImage(
                      'https://i.pinimg.com/564x/85/a3/ad/85a3ada3b8f459e574d9eaf060516744.jpg'),
                ),
                Positioned(
                    bottom: -50.0,
                    child: CircleAvatar(
                      radius: 80,
                      backgroundColor: Colors.black,
                      child: CircleAvatar(
                        radius: 75,
                        backgroundImage: NetworkImage(
                            'https://thumbs.dreamstime.com/b/female-user-avatar-profile-picture-icon-isolated-vector-illustration-flat-design-people-character-white-background-woman-146472409.jpg'),
                      ),
                    ))
              ]),
          SizedBox(
            height: 40,
          ),
          ListTile(
            title: Center(
                child: Text(
              'Name Surname',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
          ),
          ListTile(
            title: Text(
              'Age',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text('Insert here age'),
          ),
          SizedBox(
            height: 10,
          ),
          ListTile(
            title: Text(
              'Date of birth',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text('Insert here date of birth'),
          ),
          SizedBox(
            height: 10,
          ),
          ListTile(
            title: Text(
              'Weight',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text('Insert here weight'),
          ),
          SizedBox(
            height: 10,
          ),
          ListTile(
            title: Text(
              'Height',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text('Insert here height'),
          ),
          SizedBox(
            height: 10,
          ),
          ListTile(
            title: Text(
              'Average daily steps',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text('Insert here avg daily steps'),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
