import 'package:flutter/material.dart';
import 'package:kipos/screens/badgePage.dart';
import 'package:kipos/screens/preferencePage.dart';
import 'package:kipos/screens/profilePage.dart';
import 'package:kipos/screens/statisticsPage.dart';
import 'package:kipos/screens/loginPage.dart';
import 'package:kipos/screens/logoutPage.dart';
import 'package:kipos/screens/deletePage.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:kipos/database/entities/dati.dart';
import 'package:kipos/repository/databaseRepository.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const route = '/home/';
  static const routename = 'HomePage';
  //static const user_id = "7TVBB5";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    const IconData lightbulb = IconData(0xe37b, fontFamily: 'MaterialIcons');
    List<String> numbers = <String>[
      '1',
      '2',
      '3',
      '4',
      '5',
      '6',
      '7',
      '8',
      '9',
      '10',
      '11',
      '12',
      '13',
      '14',
      '15',
      '16'
    ];
    List<String> pos = <String>['1st', '2nd', '3rd', '4th'];

    List<String> preview = <String>[
      '16',
      '23',
      '34',
      '31',
      '39.5',
      '48',
      '37.5',
      '43',
      '46',
      '56',
      '54.5',
      '78',
      '49',
      '43',
      '39',
      '21'
    ];

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
              Navigator.pushNamed(context, '/tips/');
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
            customItemsIndexes: const [3],
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
        child:
            //We will show the todo table with a ListView.
            //To do so, we use a Consumer of DatabaseRepository in order to rebuild the widget tree when
            //entries are deleted or created.
            Consumer<DatabaseRepository>(builder: (context, dbr, child) {
          //The logic is to query the DB for the entire list of Todo using dbr.findAllTodos()
          //and then populate the ListView accordingly.
          //We need to use a FutureBuilder since the result of dbr.findAllTodos() is a Future.
          return FutureBuilder(
            initialData: null,
            future: dbr.findAllDati(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final data = snapshot.data as List<Dati>;
                return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, datiIndex) {
                      final dato = data[datiIndex];
                      String? sentence = '';
                      Color? check = Colors.white;
                      if (dato.distance > double.parse(preview[datiIndex])) {
                        sentence =
                            'GREAT WORK!! You accomplished the task of this week. Head over to the Badge section to see what you gained.';
                      } else {
                        sentence =
                            'UH OH! It seems you have not accomplished the task of this week, keep running!';
                      }
                      if (dato.distance > double.parse(preview[datiIndex])) {
                        check = Colors.lightGreen;
                      } else {
                        check = Colors.grey;
                      }

                      return ExpansionTileCard(
                        leading: CircleAvatar(
                          backgroundColor: check,
                          foregroundColor: Colors.white,
                          child: Text(
                            numbers[datiIndex] + '/16',
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ),
                        title: Text('${dato.week} Week',
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            )),
                        subtitle:
                            Text('Weekly goal: ' + preview[datiIndex] + 'km'),
                        children: <Widget>[
                          const Divider(
                            thickness: 1.0,
                            height: 1.0,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 16.0,
                                  vertical: 8.0,
                                ),
                                child: Text(
                                    'You have run ${dato.distance}, burned ${dato.calories} cal and done ${dato.steps} steps. ' +
                                        sentence)),
                          ),
                          ButtonBar(
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, StatisticsPage.route);
                                },
                                icon: const Icon(Icons.bar_chart),
                              )
                            ],
                          ),
                        ],
                      );
                    });

                /*Card(
                        elevation: 5,
                        //Here we use a Dismissible widget to create a nicer UI.
                        child: Dismissible(
                          //Just create a dummy unique key
                          key: UniqueKey(),
                          //This is the background to show when the ListTile is swiped
                          background: Container(color: Colors.red),
                          //The ListTile is used to show the Todo entry
                          child: ListTile(
                            leading: Icon(MdiIcons.note),
                            title: Text('${dato.distance}'),
                            subtitle: Text('ID: ${dato.id}'),
                            //If the ListTile is tapped, it is deleted
                          ),
                          //This method is called when the ListTile is dismissed
                          onDismissed: (direction) async {
                            //No need to use a Consumer, we are just using a method of the DatabaseRepository
                            await Provider.of<DatabaseRepository>(context,
                                    listen: false)
                                .removeDati(dato);
                          },
                        ),
                      );
                    });*/
              } else {
                //A CircularProgressIndicator is shown while the list of Todo is loading.
                return CircularProgressIndicator();
              } //else
            }, //builder of FutureBuilder
          );
        }),
      ),
      /* ListView(children: [
        const Text(' '),
        const Text('🏃🏻‍♂️ Training Schedule 🏋🏻‍♂️',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 20,
                fontWeight: FontWeight.bold)
            //fontStyle: FontStyle.italic,
            //fontFamily: 'Outfit') //TextStyle
            ), // Text
        const Text(' '),
        const Text('  First Month',
            style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 18,
                fontWeight: FontWeight.bold)),
        for (var i = 0; i < pos.length; i++)
          ExpansionTileCard(
            leading: CircleAvatar(
              backgroundColor: Colors.yellow[700],
              foregroundColor: Colors.white,
              child: Text(
                numbers[i] + '/16',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
            title: Text(pos[i] + ' Week',
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                )),
            subtitle: Text('Weekly goal: ' + preview[i] + 'km'),
            children: <Widget>[
              const Divider(
                thickness: 1.0,
                height: 1.0,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: Text(
                      'You have run this many km, burned this many cal and done this many steps'),
                ),
              ),
              ButtonBar(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, StatisticsPage.route);
                    },
                    icon: const Icon(Icons.bar_chart),
                  )
                ],
              ),
            ],
          ),
        //End first month
        const Text(' '),
        const Divider(
          height: 5,
          thickness: 1.5,
        ),
        const Text(' '),
        const Text('  Second Month',
            style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 18,
                fontWeight: FontWeight.bold)),
        for (var i = 0; i < pos.length; i++)
          ExpansionTileCard(
            leading: CircleAvatar(
              backgroundColor: Colors.lightGreen,
              foregroundColor: Colors.white,
              child: Text(
                numbers[i + 4] + '/16',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
            title: Text(pos[i] + ' Week',
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                )),
            subtitle: Text('Weekly goal: ' + preview[i + 4] + 'km'),
            children: <Widget>[
              const Divider(
                thickness: 1.0,
                height: 1.0,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: Text(
                      'You have run this many km, burned this many cal and done this many steps'),
                ),
              ),
              ButtonBar(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, StatisticsPage.route);
                    },
                    icon: const Icon(Icons.bar_chart),
                  )
                ],
              ),
            ],
          ),
        //End second month
        const Text(' '),
        const Divider(
          height: 5,
          thickness: 1.5,
        ),
        const Text(' '),
        const Text('  Third Month',
            style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 18,
                fontWeight: FontWeight.bold)),
        for (var i = 0; i < pos.length; i++)
          ExpansionTileCard(
            leading: CircleAvatar(
              backgroundColor: Colors.purple[400],
              foregroundColor: Colors.white,
              child: Text(
                numbers[i + 8] + '/16',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
            title: Text(pos[i] + ' Week',
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                )),
            subtitle: Text('Weekly goal: ' + preview[i + 8] + 'km'),
            children: <Widget>[
              const Divider(
                thickness: 1.0,
                height: 1.0,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: Text(
                      'You have run this many km, burned this many cal and done this many steps'),
                ),
              ),
              ButtonBar(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, StatisticsPage.route);
                    },
                    icon: const Icon(Icons.bar_chart),
                  )
                ],
              ),
            ],
          ),
        //End third month
        const Text(' '),
        const Divider(
          height: 5,
          thickness: 1.5,
        ),
        const Text(' '),
        const Text('  Fourth Month',
            style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 18,
                fontWeight: FontWeight.bold)),
        for (var i = 0; i < pos.length; i++)
          ExpansionTileCard(
            leading: CircleAvatar(
              backgroundColor: Colors.lightGreen,
              foregroundColor: Colors.white,
              child: Text(
                numbers[i + 12] + '/16',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
            title: Text(pos[i] + ' Week',
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                )),
            subtitle: Text('Weekly goal: ' + preview[i + 12] + 'km'),
            children: <Widget>[
              const Divider(
                thickness: 1.0,
                height: 1.0,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: Text(
                      'You have run this many km, burned this many cal and done this many steps'),
                ),
              ),
              ButtonBar(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, StatisticsPage.route);
                    },
                    icon: const Icon(Icons.bar_chart),
                  )
                ],
              ),
            ],
          ),
      ]),*/

      bottomNavigationBar: Container(
        height: 90,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, BadgePage.route);
                },
                icon:
                    const Icon(Icons.shield_rounded, semanticLabel: 'Badges')),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.home, semanticLabel: 'Home')),
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, StatisticsPage.route);
                },
                icon: const Icon(Icons.bar_chart, semanticLabel: 'Statistics')),
          ],
        ),
      ),
    );
  }
}

void _toLoginPage(BuildContext context) async {
  //Unset the 'username' filed in SharedPreference
  final sp = await SharedPreferences.getInstance();
  sp.remove('username');

  //Pop the drawer first
  Navigator.pop(context);
  //Then pop the HomePage
  Navigator.of(context).pushReplacementNamed(LoginPage.route);
} //_toCalendarPage

class MenuItem {
  final String text;
  final IconData icon;

  const MenuItem({
    required this.text,
    required this.icon,
  });
}

class MenuItems {
  static const List<MenuItem> firstItems = [profile, settings, logout];
  static const List<MenuItem> secondItems = [delete];

  static const profile =
      MenuItem(text: 'Profile', icon: MdiIcons.accountCircle);
  static const settings = MenuItem(text: 'Settings', icon: Icons.settings);
  static const logout = MenuItem(text: 'Log out', icon: Icons.logout_outlined);
  static const delete =
      MenuItem(text: 'Delete Data', icon: Icons.delete_forever_rounded);

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
        Navigator.push(context,
            new MaterialPageRoute(builder: (context) => new ProfilePage()));
        break;
      case MenuItems.logout:
        print('logout');
        Navigator.pushNamed(context, LogoutPage.route);
        break;
      case MenuItems.settings:
        Navigator.pushNamed(context, PreferencePage.route);
        break;
      case MenuItems.delete:
        Navigator.pushNamed(context, DeletePage.route);
        break;
    }
  }
}
