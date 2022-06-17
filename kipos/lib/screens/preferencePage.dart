import 'package:flutter/material.dart';
import 'package:kipos/main.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:kipos/utilities/formDateTiles.dart';
import 'package:kipos/utilities/formats.dart';
import 'package:kipos/utilities/formSeparator.dart';
import 'package:kipos/screens/homePage.dart';
import 'package:fitbitter/fitbitter.dart';
import 'package:kipos/utilities/strings.dart';
import 'package:provider/provider.dart';
import 'package:kipos/database/entities/dati.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:kipos/repository/databaseRepository.dart';

class PreferencePage extends StatefulWidget {
  PreferencePage({Key? key}) : super(key: key);

  static const route = '/preferences/';
  static const routename = 'PreferencePage';

  @override
  State<PreferencePage> createState() => _PreferencePageState();
} //PreferencePage

class _PreferencePageState extends State<PreferencePage> {
  final formKey = GlobalKey<FormState>();

  TextEditingController _choController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  int x = 7;
  List<double> steps = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  List<double> distance = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  List<double> calories = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  List<double> floors = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  double somma = 0;

  @override
  void initState() {
    super.initState();
  } // initState

  //Remember that form controllers need to be manually disposed. So, here we need also to override the dispose() method.
  @override
  void dispose() {
    _choController.dispose();
    super.dispose();
  } // dispose

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: (const Text(
          '🛠 Settings',
          textAlign: TextAlign.center,
        )),
        backgroundColor: Colors.lightGreen,
      ),
      body: SafeArea(
          child: Stack(
        children: [
          _buildForm(context),
          Padding(
            padding: const EdgeInsets.fromLTRB(80, 230, 10, 10),
            child: Column(
              children: [
                const SizedBox(height: 80),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Stack(
                    children: <Widget>[
                      Positioned.fill(
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.lightGreen,
                          ),
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.all(16.0),
                          primary: Colors.white,
                          textStyle: const TextStyle(fontSize: 18),
                        ),
                        onPressed: () async {
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
                            startDate: _selectedDate,
                            endDate: _selectedDate.add(Duration(days: 115)),
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
                            startDate: _selectedDate,
                            endDate: _selectedDate.add(Duration(days: 115)),
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
                              await fitbitActivityTimeseriesDataManager_cal
                                  .fetch(FitbitActivityTimeseriesAPIURL
                                      .dateRangeWithResource(
                            userID: userId,
                            startDate: _selectedDate,
                            endDate: _selectedDate.add(Duration(days: 115)),
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
                            startDate: _selectedDate,
                            endDate: _selectedDate.add(Duration(days: 115)),
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
                                    steps[k], calories[k]));
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
                          FitbitSleepDataManager fitbitSleepDataManager =
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
                          int sleepDurHours =
                              end!.difference(start!).inMinutes ~/ 60;

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
                              sleepDurHours,
                            ),
                          );

                          print(
                              "Yesterday night you went to bed at ${start.hour}:${start.minute}:${start.second} and you woke up this morning at ${end.hour}:${end.minute}:${end.second}, so you slept about ${sleepDurHours} hours.");

                          final snackBar = SnackBar(
                              content: Text(
                                  'FitBit data access was authorized successfully.'));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        },
                        child: const Text('Authorize FitBit data'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Stack(
                    children: <Widget>[
                      Positioned.fill(
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.lightGreen,
                          ),
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.all(16.0),
                          primary: Colors.white,
                          textStyle: const TextStyle(fontSize: 18),
                        ),
                        onPressed: () async {
                          await FitbitConnector.unauthorize(
                            clientID: Strings.fitbitClientID,
                            clientSecret: Strings.fitbitClientSecret,
                          );
                          final snackBar = SnackBar(
                              content: Text(
                                  'FitBit data access was unauthorized successfully.'));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        },
                        child: const Text('Unauthorize FitBit data'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Stack(
                    children: <Widget>[
                      Positioned.fill(
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.lightGreen,
                          ),
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.all(16.0),
                          primary: Colors.white,
                          textStyle: const TextStyle(fontSize: 18),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, HomePage.route);
                        },
                        child: const Text('Go to Homepage'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  } //build

  Widget _buildForm(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 8, left: 20, right: 20),
        child: ListView(
          children: <Widget>[
            FormSeparator(label: 'Start training date'),
            FormDateTile(
              labelText: 'Start training date',
              date: _selectedDate,
              icon: MdiIcons.clockTimeFourOutline,
              onPressed: () {
                _selectDate(context);
              },
              dateFormat: Formats.fullDateFormatNoSeconds,
            ),
          ],
        ),
      ),
    );
  } // _buildForm

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _selectedDate,
        firstDate: DateTime(2010),
        lastDate: DateTime(2101));
    if (picked != null && picked != _selectedDate)
      setState(() {
        _selectedDate = picked;
      });
    int timeStamp = _selectedDate.millisecondsSinceEpoch;
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('timeStamp', timeStamp);
  } //_selectDate

  void _validateAndSave(BuildContext context) {
    if (formKey.currentState!.validate()) {
      Navigator.pop(context);
    }
  } // _validateAndSave

}
