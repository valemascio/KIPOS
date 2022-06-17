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
import 'package:fitbitter/fitbitter.dart';
import 'package:kipos/utilities/strings.dart';
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
                //dbr.updateDati(data[0]);
                return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, datiIndex) {
                      final dato = data[datiIndex];
                      //dbr.updateDati(dato);
                      String? sentence = '';
                      Color? check = Colors.white;
                      if (dato.distance > double.parse(preview[datiIndex])) {
                        sentence = '''
GREAT WORK!! You accomplished the goal of this week. 

Head over to the 🏅Badge section to see which tree you gained and to the 📊Statistic page to see your performances! 👇🏻''';
                      } else {
                        sentence =
                            'UH OH! It seems you have not accomplished the goal of this week, keep running! ';
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
                                child: Text('''
🏃🏻‍♂️ Ran ${dato.distance.toStringAsFixed(2)} km, 
🚶🏻‍♀️ Walked ${dato.steps.toStringAsFixed(0)} steps,
🔥 Burned ${dato.calories.toStringAsFixed(0)} kcal. 

''' +
                                    sentence)),
                          ),
                          ButtonBar(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, BadgePage.route);
                                  },
                                  icon: const Icon(Icons.shield_rounded,
                                      semanticLabel: 'Badges')),
                              IconButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, StatisticsPage.route);
                                  },
                                  icon: const Icon(Icons.bar_chart,
                                      semanticLabel: 'Statistic page')),
                            ],
                          ),
                        ],
                      );
                    });
              } else {
                //A CircularProgressIndicator is shown while the list of Todo is loading.
                return CircularProgressIndicator();
              } //else
            }, //builder of FutureBuilder
          );
        }),
      ),
      bottomNavigationBar: Container(
        color: Color.fromARGB(255, 254, 254, 254),
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, BadgePage.route);
                },
                icon: const Icon(
                  Icons.shield_rounded,
                  semanticLabel: 'Badges',
                )),
            IconButton(
                onPressed: () {
                  _updatePage(context);
                  print('Refresh');
                },
                icon: const Icon(Icons.refresh, semanticLabel: 'Refresh')),
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

// void _updatePage(BuildContext context) async {
//   final listaDati =
//       Provider.of<DatabaseRepository>(context, listen: false).findAllDati();
//   List<Dati> datoLista = await listaDati;
//   for (int i = 0; i < datoLista.length; i++) {
//     Provider.of<DatabaseRepository>(context, listen: false)
//         .updateDati(datoLista[i]);
//   }
// }

void _updatePage(BuildContext context) async {
  int x = 7;
  List<double> steps = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  List<double> distance = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  List<double> calories = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  List<double> floors = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  final prefs = await SharedPreferences.getInstance();
  int? timestamp = prefs.getInt('timeStamp');
  DateTime _selDate = DateTime.fromMillisecondsSinceEpoch(timestamp!);
  double somma = 0;

  String? userId = await FitbitConnector.authorize(
      context: context,
      clientID: Strings.fitbitClientID,
      clientSecret: Strings.fitbitClientSecret,
      redirectUri: Strings.fitbitRedirectUri,
      callbackUrlScheme: Strings.fitbitCallbackScheme);

  FitbitActivityTimeseriesDataManager fitbitActivityTimeseriesDataManager =
      FitbitActivityTimeseriesDataManager(
    clientID: Strings.fitbitClientID,
    clientSecret: Strings.fitbitClientSecret,
    type: 'steps',
  );

  //Fetch steps
  final stepsData = await fitbitActivityTimeseriesDataManager
      .fetch(FitbitActivityTimeseriesAPIURL.dateRangeWithResource(
    userID: userId,
    startDate: _selDate,
    endDate: _selDate.add(Duration(days: 115)),
    resource: fitbitActivityTimeseriesDataManager.type,
  )) as List<FitbitActivityTimeseriesData>;

  // Creo lista di steps
  for (int i = 0; i < 16; i++) {
    int inizio = x * i;
    int fine = x * (i + 1);
    for (int j = inizio; j < fine; j++) {
      somma = (stepsData[j].value as double) + somma;
    }
    steps[i] = somma;
    somma = 0;
  }

  print('$steps');

  //Data manager distance
  FitbitActivityTimeseriesDataManager fitbitActivityTimeseriesDataManager_dist =
      FitbitActivityTimeseriesDataManager(
    clientID: Strings.fitbitClientID,
    clientSecret: Strings.fitbitClientSecret,
    type: 'distance',
  );

  //Fetch distance
  final distData = await fitbitActivityTimeseriesDataManager_dist
      .fetch(FitbitActivityTimeseriesAPIURL.dateRangeWithResource(
    userID: userId,
    startDate: _selDate,
    endDate: _selDate.add(Duration(days: 115)),
    resource: fitbitActivityTimeseriesDataManager_dist.type,
  )) as List<FitbitActivityTimeseriesData>;

  // Creo lista di distance
  for (int i = 0; i < 16; i++) {
    int inizio = x * i;
    int fine = x * (i + 1);
    for (int j = inizio; j < fine; j++) {
      somma = (distData[j].value as double) + somma;
    }
    distance[i] = somma;
    somma = 0;
  }
  print('$distance');

  //Data manager calories
  FitbitActivityTimeseriesDataManager fitbitActivityTimeseriesDataManager_cal =
      FitbitActivityTimeseriesDataManager(
    clientID: Strings.fitbitClientID,
    clientSecret: Strings.fitbitClientSecret,
    type: 'calories',
  );

  //Fetch calories
  final calData = await fitbitActivityTimeseriesDataManager_cal
      .fetch(FitbitActivityTimeseriesAPIURL.dateRangeWithResource(
    userID: userId,
    startDate: _selDate,
    endDate: _selDate.add(Duration(days: 115)),
    resource: fitbitActivityTimeseriesDataManager_cal.type,
  )) as List<FitbitActivityTimeseriesData>;

  // Creo lista di calories
  for (int i = 0; i < 16; i++) {
    int inizio = x * i;
    int fine = x * (i + 1);
    for (int j = inizio; j < fine; j++) {
      somma = (calData[j].value as double) + somma;
    }
    calories[i] = somma;
    somma = 0;
  }
  print('$calories');

  //Data manager floors
  FitbitActivityTimeseriesDataManager
      fitbitActivityTimeseriesDataManager_floors =
      FitbitActivityTimeseriesDataManager(
    clientID: Strings.fitbitClientID,
    clientSecret: Strings.fitbitClientSecret,
    type: 'floors',
  );

  //Fetch duration
  final floorsData = await fitbitActivityTimeseriesDataManager_floors
      .fetch(FitbitActivityTimeseriesAPIURL.dateRangeWithResource(
    userID: userId,
    startDate: _selDate,
    endDate: _selDate.add(Duration(days: 115)),
    resource: fitbitActivityTimeseriesDataManager_floors.type,
  )) as List<FitbitActivityTimeseriesData>;

  // Creo lista di floors
  for (int i = 0; i < 16; i++) {
    int inizio = x * i;
    int fine = x * (i + 1);
    for (int j = inizio; j < fine; j++) {
      somma = (floorsData[j].value as double) + somma;
    }
    floors[i] = somma;
    somma = 0;
  }
  print('$floors');

  //Fetch sleep
  //Data manager sleep
  FitbitSleepDataManager fitbitSleepDataManager = FitbitSleepDataManager(
    clientID: Strings.fitbitClientID,
    clientSecret: Strings.fitbitClientSecret,
  );

  final sleepData = await fitbitSleepDataManager.fetch(
      FitbitSleepAPIURL.withUserIDAndDay(
          date: DateTime.now(), userID: userId)) as List<FitbitSleepData>;

  DateTime? start = sleepData[0].entryDateTime;
  DateTime? end = sleepData[sleepData.length - 1].entryDateTime;
  int sleepDurHours = end!.difference(start!).inMinutes ~/ 60;

  //DATABASE UPDATE
  final listaDati_old =
      Provider.of<DatabaseRepository>(context, listen: false).findAllDati();
  List<Dati> datoLista_old = await listaDati_old;
  for (int k = 0; k < 16; k++) {
    await Provider.of<DatabaseRepository>(context, listen: false).updateDati(
        Dati(datoLista_old[k].id, datoLista_old[k].week, distance[k], steps[k],
            calories[k]));
  }

  final person_old =
      Provider.of<DatabaseRepository>(context, listen: false).findAllPerson();
  List<Person> datiPerson_old = await person_old;
  for (int k = 0; k < datiPerson_old.length; k++) {
    await Provider.of<DatabaseRepository>(context, listen: false).updatePerson(
        Person(
            datiPerson_old[k].id,
            datiPerson_old[k].name,
            datiPerson_old[k].surname,
            datiPerson_old[k].age,
            datiPerson_old[k].avatar,
            datiPerson_old[k].weight,
            datiPerson_old[k].height,
            datiPerson_old[k].avgDailySteps,
            datiPerson_old[k].dateOfBirth,
            sleepDurHours));
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
