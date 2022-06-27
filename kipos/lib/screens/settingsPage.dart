import 'package:flutter/material.dart';
import 'package:kipos/screens/deletePage.dart';
import 'package:kipos/screens/preferencePage.dart';
import 'package:kipos/screens/homePage.dart';
import 'package:kipos/screens/alertPage.dart';
import 'package:fitbitter/fitbitter.dart';
import 'package:kipos/screens/prehomePage.dart';
import 'package:kipos/utilities/strings.dart';
import 'package:provider/provider.dart';
import 'package:kipos/database/entities/dati.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:kipos/repository/databaseRepository.dart';
import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';
import 'package:flutter/cupertino.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key? key}) : super(key: key);

  static const route = '/settings/';
  static const routename = 'SettingsPage';

  @override
  State<SettingsPage> createState() => _SettingsPageState();
} //SettingsPage

class _SettingsPageState extends State<SettingsPage> {
  //DateTime _selectedDate = DateTime.now();
  final formKey = GlobalKey<FormState>();

  int x = 7;
  List<double> steps = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  List<double> distance = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  List<double> calories = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  List<double> floors = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  double somma = 0;
//  bool access = true;

  // @override
  // void initState() {
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        //backgroundColor: Colors.white.withOpacity(.94),
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: (const Text(
            '🛠 Settings',
            textAlign: TextAlign.center,
          )),
          backgroundColor: Colors.lightGreen,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              SettingsGroup(settingsGroupTitle: "1. DatePicker", items: [
                SettingsItem(
                  onTap: () async {
                    final access = await SharedPreferences.getInstance();
                    String? auth = access.getString('pass');
                    final clickedbutton = await SharedPreferences.getInstance();
                    bool? verified = clickedbutton.getBool('_isPressed');
                    //mi torna il value 'stop' perché gli passo la chiave 'pass'
                    if (auth != 'stop' /*&& verified != true*/) {
                      Navigator.pushNamed(context, PreferencePage.route);
                      /*final clickedbutton =
                          await SharedPreferences.getInstance();
                      await clickedbutton.setBool('_isPressed', true);*/
                      //access.setString('pass', 'stop');
                    } else {
                      //Navigator.pushNamed(context, AlertPage.route);
                      showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          title: const Text('⚠️ Alert! ⚠️'),
                          content: const Text(
                              '''You already chose a starting date for your training. 

To restart from scratch you have to delete all the data first.'''),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(ctx).pop();
                              },
                              child: Container(
                                padding: const EdgeInsets.all(14),
                                child: const Text("OK"),
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                  icons: CupertinoIcons.calendar,
                  iconStyle: IconStyle(
                    iconsColor: Colors.white,
                    withBackground: true,
                    backgroundColor: Colors.lightGreen,
                  ),
                  title: 'Date',
                  subtitle: "Training starting date",
                ),
              ]),
              SettingsGroup(settingsGroupTitle: "2. Authorization", items: [
                SettingsItem(
                  onTap: () async {
                    //riferito a DatePicker
                    final clickedbutton = await SharedPreferences.getInstance();
                    if (clickedbutton.getBool('_isPressed') == true) {
                      //riferito a HomePage
                      final button = await SharedPreferences.getInstance();
                      await button.setBool('_isPressed', true);

//riferito all'authorize stesso
                      final alreadyauth = await SharedPreferences.getInstance();
                      if (alreadyauth.getBool('_isAuth') != true) {
                        final access = await SharedPreferences.getInstance();
                        //save a String value (i.e. stop) to 'pass' key.
                        //key= pass; value=stop.
                        access.setString('pass', 'stop');
                        final prefs = await SharedPreferences.getInstance();
                        int? timestamp = prefs.getInt('timeStamp');
                        DateTime _selDate =
                            DateTime.fromMillisecondsSinceEpoch(timestamp!);

                        // Authorize the app
                        String? userId = await FitbitConnector.authorize(
                            context: context,
                            clientID: Strings.fitbitClientID,
                            clientSecret: Strings.fitbitClientSecret,
                            redirectUri: Strings.fitbitRedirectUri,
                            callbackUrlScheme: Strings.fitbitCallbackScheme);

                        //Data manager steps
                        FitbitActivityTimeseriesDataManager
                            fitbitActivityTimeseriesDataManager =
                            FitbitActivityTimeseriesDataManager(
                          clientID: Strings.fitbitClientID,
                          clientSecret: Strings.fitbitClientSecret,
                          type: 'steps',
                        );

                        //Fetch steps
                        final stepsData =
                            await fitbitActivityTimeseriesDataManager.fetch(
                                FitbitActivityTimeseriesAPIURL
                                    .dateRangeWithResource(
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
                        FitbitActivityTimeseriesDataManager
                            fitbitActivityTimeseriesDataManager_dist =
                            FitbitActivityTimeseriesDataManager(
                          clientID: Strings.fitbitClientID,
                          clientSecret: Strings.fitbitClientSecret,
                          type: 'distance',
                        );

                        //Fetch distance
                        final distData =
                            await fitbitActivityTimeseriesDataManager_dist
                                .fetch(FitbitActivityTimeseriesAPIURL
                                    .dateRangeWithResource(
                          userID: userId,
                          startDate: _selDate,
                          endDate: _selDate.add(Duration(days: 115)),
                          resource:
                              fitbitActivityTimeseriesDataManager_dist.type,
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
                        FitbitActivityTimeseriesDataManager
                            fitbitActivityTimeseriesDataManager_cal =
                            FitbitActivityTimeseriesDataManager(
                          clientID: Strings.fitbitClientID,
                          clientSecret: Strings.fitbitClientSecret,
                          type: 'calories',
                        );

                        //Fetch calories
                        final calData =
                            await fitbitActivityTimeseriesDataManager_cal.fetch(
                                FitbitActivityTimeseriesAPIURL
                                    .dateRangeWithResource(
                          userID: userId,
                          startDate: _selDate,
                          endDate: _selDate.add(Duration(days: 115)),
                          resource:
                              fitbitActivityTimeseriesDataManager_cal.type,
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
                        final floorsData =
                            await fitbitActivityTimeseriesDataManager_floors
                                .fetch(FitbitActivityTimeseriesAPIURL
                                    .dateRangeWithResource(
                          userID: userId,
                          startDate: _selDate,
                          endDate: _selDate.add(Duration(days: 115)),
                          resource:
                              fitbitActivityTimeseriesDataManager_floors.type,
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

                        //DATABASE INSERT
                        for (int k = 0; k < 16; k++) {
                          await Provider.of<DatabaseRepository>(context,
                                  listen: false)
                              .insertDati(Dati(null, k + 1, distance[k],
                                  steps[k], calories[k], floors[k]));
                        }

                        //User data manager
                        FitbitAccountDataManager fitbitAccountDataManager =
                            FitbitAccountDataManager(
                          clientID: Strings.fitbitClientID,
                          clientSecret: Strings.fitbitClientSecret,
                        );

                        FitbitUserAPIURL fitbitUserApiUrl =
                            FitbitUserAPIURL.withUserID(userID: userId);

                        final fitbitAccountDatas =
                            await fitbitAccountDataManager
                                .fetch(fitbitUserApiUrl);
                        FitbitAccountData fitbitAccountData =
                            fitbitAccountDatas[0] as FitbitAccountData;

                        final date = fitbitAccountData
                            .dateOfBirth?.millisecondsSinceEpoch;
                        final dateConverted =
                            DateTime.fromMillisecondsSinceEpoch(date!);

                        print("data di nascita: ${dateConverted}");

                        //Data manager sleep
                        /*FitbitSleepDataManager fitbitSleepDataManager =
                        FitbitSleepDataManager(
                      clientID: Strings.fitbitClientID,
                      clientSecret: Strings.fitbitClientSecret,
                    );

                    //Fetch sleep
                    final sleepData = await fitbitSleepDataManager.fetch(
                        FitbitSleepAPIURL.withUserIDAndDay(
                            date: DateTime.now(),
                            userID: userId)) as List<FitbitSleepData>;

                    DateTime? start = sleepData[0].entryDateTime;
                    DateTime? end =
                        sleepData[sleepData.length - 1].entryDateTime;
                    int sleepDurHours = end!.difference(start!).inMinutes ~/ 60;*/

                        await Provider.of<DatabaseRepository>(context,
                                listen: false)
                            .insertPerson(
                          Person(
                            null,
                            fitbitAccountData.firstName,
                            fitbitAccountData.lastName,
                            fitbitAccountData.age,
                            fitbitAccountData.avatar,
                            fitbitAccountData.weight,
                            fitbitAccountData.height,
                            fitbitAccountData.averageDailySteps,
                            fitbitAccountData
                                .dateOfBirth?.millisecondsSinceEpoch,
                          ),
                        );

                        //print(
                        //"Yesterday night you went to bed at ${start.hour}:${start.minute}:${start.second} and you woke up this morning at ${end.hour}:${end.minute}:${end.second}, so you slept about ${sleepDurHours} hours.");

                        final snackBar = SnackBar(
                            content: Text(
                                'FitBit data access was authorized successfully.'));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);

                        final alreadyauth =
                            await SharedPreferences.getInstance();
                        await alreadyauth.setBool('_isAuth', true);
                      } else {
                        showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(
                                  title: const Text("Stop!"),
                                  content: const Text(
                                      'You already authorized the data'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(ctx).pop();
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(14),
                                        child: const Text("OK"),
                                      ),
                                    ),
                                  ],
                                ));
                      }
                    } else {
                      showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          title: const Text("Wait!"),
                          content: const Text(
                              'You have to choose a training date first!'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(ctx).pop();
                              },
                              child: Container(
                                padding: const EdgeInsets.all(14),
                                child: const Text("OK"),
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                  icons: CupertinoIcons.check_mark_circled,
                  iconStyle: IconStyle(
                    iconsColor: Colors.white,
                    withBackground: true,
                    backgroundColor: Colors.lightGreen,
                  ),
                  title: 'Authorize',
                  subtitle: "Authorize FitBit data",
                ),
                SettingsItem(
                  onTap: () async {
                    await FitbitConnector.unauthorize(
                      clientID: Strings.fitbitClientID,
                      clientSecret: Strings.fitbitClientSecret,
                    );
                    /*final snackBar = SnackBar(
                        content: Text(
                            'FitBit data access was unauthorized successfully.'));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);*/
                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: const Text("Unauthorized data."),
                        content: const Text(
                            '''FitBit data access was unauthorized successfully. 

You will continue to see the authorized data but no more data will be stored in the database.'''),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(ctx).pop();
                            },
                            child: Container(
                              padding: const EdgeInsets.all(14),
                              child: const Text("OK"),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  icons: CupertinoIcons.clear_circled,
                  iconStyle: IconStyle(
                    iconsColor: Colors.white,
                    withBackground: true,
                    backgroundColor: Colors.lightGreen,
                  ),
                  title: 'Unauthorize',
                  subtitle: "Unauthorize FitBit data",
                ),
              ]),
              SettingsGroup(settingsGroupTitle: "3. HomePage", items: [
                SettingsItem(
                  onTap: () async {
                    final button = await SharedPreferences.getInstance();
                    if (button.getBool('_isPressed') == true) {
                      Navigator.pushNamed(context, HomePage.route);
                    } else {
                      Navigator.pushNamed(context, PreHomePage.route);
                    }
                  },
                  icons: CupertinoIcons.home,
                  iconStyle: IconStyle(
                    iconsColor: Colors.white,
                    withBackground: true,
                    backgroundColor: Colors.lightGreen,
                  ),
                  title: 'HomePage',
                  subtitle: "Go to the HomePage",
                ),
              ]),
              SettingsGroup(settingsGroupTitle: "Delete data", items: [
                SettingsItem(
                  onTap: () {
                    Navigator.pushNamed(context, DeletePage.route);
                  },
                  icons: CupertinoIcons.delete,
                  iconStyle: IconStyle(
                    iconsColor: Colors.white,
                    withBackground: true,
                    backgroundColor: Colors.lightGreen,
                  ),
                  title: 'Delete data',
                  subtitle: "Erase all data",
                ),
              ]),
              // You can add a settings title
            ],
          ),
        ),
      ),
    );
  }
}
