import 'package:flutter/material.dart';
import 'package:kipos/screens/settingsPage.dart';

class AlertPage extends StatelessWidget {
  const AlertPage({Key? key}) : super(key: key);

  static const route = '/alertUnauth/';
  static const routename = 'alertUnauthPage';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Unauthorized data',
          style: TextStyle(color: Color.fromARGB(255, 122, 164, 94))),
      content: const Text(
          'FitBit data access was unauthorized successfully. You will continue to see the authorized data but no more data will be stored in the database.'),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            _toSettingsPage(context);
          },
          child: const Text('OK',
              style: TextStyle(color: Color.fromARGB(255, 122, 164, 94))),
        ),
      ],
    );
  }

  void _toSettingsPage(BuildContext context) async {
    //Pop back to settings
    Navigator.pop(context);
  } //_toSettingsPage
}
