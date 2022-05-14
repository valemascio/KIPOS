import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:kipos/utilities/formDateTiles.dart';
import 'package:kipos/utilities/formats.dart';
import 'package:kipos/utilities/formSeparator.dart';
import 'package:kipos/screens/homePage.dart';
import 'package:fitbitter/fitbitter.dart';
import 'package:kipos/utilities/strings.dart';

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
        title: (const Text('  Preferences ')),
        backgroundColor: Colors.lightGreen,
      ),
      body: Center(
        child: _buildForm(context),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          // Authorize the app
          String? userId = await FitbitConnector.authorize(
              context: context,
              clientID: Strings.fitbitClientID,
              clientSecret: Strings.fitbitClientSecret,
              redirectUri: Strings.fitbitRedirectUri,
              callbackUrlScheme: Strings.fitbitCallbackScheme);

          //Instantiate a proper data manager
          FitbitActivityTimeseriesDataManager
              fitbitActivityTimeseriesDataManager =
              FitbitActivityTimeseriesDataManager(
            clientID: Strings.fitbitClientID,
            clientSecret: Strings.fitbitClientSecret,
            type: 'steps',
          );

          //Fetch data
          final stepsData = await fitbitActivityTimeseriesDataManager
              .fetch(FitbitActivityTimeseriesAPIURL.dateRangeWithResource(
            userID: userId,
            startDate: _selectedDate,
            endDate: _selectedDate.add(Duration(days: 115)),
            resource: fitbitActivityTimeseriesDataManager.type,
          )) as List<FitbitActivityTimeseriesData>;

          // Use them as you want
          final snackBar = SnackBar(
              content: Text('The authorization process was successful!'));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);

          Navigator.pushNamed(context, HomePage.route);
        },
        label: Text('Authorize FitBit & go to HomePage'),
        backgroundColor: Color.fromARGB(255, 122, 164, 94),
      ),
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
  } //_selectDate

  void _validateAndSave(BuildContext context) {
    if (formKey.currentState!.validate()) {
      Navigator.pop(context);
    }
  } // _validateAndSave

}
