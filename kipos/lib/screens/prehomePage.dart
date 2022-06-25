import 'package:flutter/material.dart';
import 'package:kipos/screens/badgePage.dart';
import 'package:kipos/screens/preferencePage.dart';
import 'package:kipos/screens/profilePage.dart';
import 'package:kipos/screens/settingsPage.dart';
import 'package:kipos/screens/statisticsPage.dart';
import 'package:kipos/screens/loginPage.dart';
import 'package:kipos/screens/logoutPage.dart';
import 'package:kipos/screens/deletePage.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:fitbitter/fitbitter.dart';
import 'package:kipos/utilities/strings.dart';
import 'package:kipos/database/entities/dati.dart';
import 'package:kipos/repository/databaseRepository.dart';

class PreHomePage extends StatelessWidget {
  const PreHomePage({Key? key}) : super(key: key);

  static const route = '/preHome/';
  static const routename = 'PreHomePage';

  @override
  Widget build(BuildContext context) {
    const IconData lightbulb = IconData(0xe37b, fontFamily: 'MaterialIcons');
    return Scaffold(
      appBar: AppBar(
        title: (const Text('KÍPOS',
            style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ))),
        backgroundColor: Colors.lightGreen,
        actions: [
          IconButton(
            icon: const Icon(
              lightbulb,
              color: Colors.white,
            ),
            onPressed: () {
              //Navigator.pushNamed(context, '/alertTips/');
              showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: const Text("Wait!"),
                  content: const Text(
                      'You will see the tips once you authorize the FitBit data.'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, SettingsPage.route);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(14),
                        child: const Text("Go to Settings"),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(ctx).pop();
                      },
                      child: Container(
                        padding: const EdgeInsets.all(14),
                        child: const Text("OK"),
                      ),
                    )
                  ],
                ),
              );
            },
          )
        ],
        leading: DropdownButtonHideUnderline(
          child: DropdownButton2(
            customButton: Icon(
              MdiIcons.menu,
              size: 35,
              color: Colors.white,
            ),
            customItemsIndexes: const [2],
            customItemsHeight: 8,
            items: [
              ...MenuItems.firstItems.map(
                (item) => DropdownMenuItem<MenuItem>(
                  value: item,
                  child: MenuItems.buildItem(item),
                ),
              ),
              const DropdownMenuItem<Divider>(enabled: false, child: Divider()),
              ...MenuItems.secondItems.map(
                (item) => DropdownMenuItem<MenuItem>(
                  value: item,
                  child: MenuItems.buildItem(item),
                ),
              ),
            ],
            onChanged: (value) {
              MenuItems.onChanged(context, value as MenuItem);
            },
            itemHeight: 48,
            itemPadding: const EdgeInsets.only(left: 16, right: 16),
            dropdownWidth: 160,
            dropdownPadding: const EdgeInsets.symmetric(vertical: 6),
            dropdownDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Color.fromARGB(255, 139, 195, 74),
            ),
            dropdownElevation: 8,
            offset: const Offset(0, 8),
          ),
        ),
      ),
      body: Center(
        child: Column(children: [
          Text(' '),
          Text(
            "🌱 Let’s get started!",
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
          Text(' '),
          Image(
            image: AssetImage('assets/groot.gif'),
          ),
        ]),
      ),
    );
  }
}

class MenuItem {
  final String text;
  final IconData icon;

  const MenuItem({
    required this.text,
    required this.icon,
  });
}

class MenuItems {
  static const List<MenuItem> firstItems = [profile, settings];
  static const List<MenuItem> secondItems = [logout];

  static const profile =
      MenuItem(text: 'Profile', icon: MdiIcons.accountCircle);
  static const settings = MenuItem(text: 'Settings', icon: Icons.settings);
  static const logout = MenuItem(text: 'Log out', icon: Icons.logout_outlined);
  /*static const delete =
      MenuItem(text: 'Delete Data', icon: Icons.delete_forever_rounded);*/

  static Widget buildItem(MenuItem item) {
    return Row(
      children: [
        Icon(item.icon, color: Colors.white, size: 22),
        const SizedBox(
          width: 10,
        ),
        Text(
          item.text,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  static onChanged(BuildContext context, MenuItem item) {
    switch (item) {
      case MenuItems.profile:
        Navigator.pushNamed(context, ProfilePage.route);
        break;
      case MenuItems.settings:
        Navigator.pushNamed(context, SettingsPage.route);
        break;
      case MenuItems.logout:
        print('logout');
        Navigator.pushNamed(context, LogoutPage.route);
        break;
      /*case MenuItems.delete:
        Navigator.pushNamed(context, DeletePage.route);
        break;*/
    }
  }
}
