import 'package:flutter/material.dart';
import 'package:kipos/main.dart';
import 'package:kipos/screens/settingsPage.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:kipos/utilities/formDateTiles.dart';
import 'package:kipos/utilities/formats.dart';
import 'package:kipos/utilities/formSeparator.dart';
import 'package:kipos/screens/homePage.dart';
import 'package:kipos/screens/settingsPage.dart';
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

  bool _enabled = false;

  @override
  Widget build(BuildContext context) {
    var _choosedDate = null;
    if (_enabled) {
      _choosedDate = () async {
        final clickedbutton = await SharedPreferences.getInstance();
        await clickedbutton.setBool('_isPressed', true);
        Navigator.pushNamed(context, SettingsPage.route);
      };
    }

    return Scaffold(
        appBar: AppBar(
          title: (const Text(
            '📆 Date Picker',
            textAlign: TextAlign.center,
          )),
          backgroundColor: Colors.lightGreen,
        ),
        body: SafeArea(
            child: Stack(children: [
          _buildForm(context),
          Divider(
            height: 5,
            thickness: 1.5,
            indent: 10,
            endIndent: 10,
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(150, 60, 150, 10),
              child: Column(children: [
                const SizedBox(height: 70),
                ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      children: <Widget>[
                        ElevatedButton(
                          onPressed: _choosedDate,
                          child: const Text('Done!'),
                        ),
                      ],
                    ))
              ]))
        ])));
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

    _enabled = true;

    //Navigator.pushNamed(context, SettingsPage.route);
  } //_selectDate

  void _validateAndSave(BuildContext context) {
    if (formKey.currentState!.validate()) {
      Navigator.pop(context);
      Navigator.popAndPushNamed(context, SettingsPage.route);
    }
  } // _validateAndSave

}
