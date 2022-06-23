import 'package:flutter/material.dart';
import 'package:kipos/screens/settingsPage.dart';

class AlertPage extends StatelessWidget {
  const AlertPage({Key? key}) : super(key: key);

  static const route = '/alertTips/';
  static const routename = 'alertTipsPage';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('⚠️ Alert! ⚠️',
          style: TextStyle(color: Color.fromARGB(255, 122, 164, 94))),
      content: const Text(
          'You will see the tips once you authorize the FitBit data.'),
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
