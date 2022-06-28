import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  const AlertPage({Key? key}) : super(key: key);

  static const route = '/alert/';
  static const routename = 'alertPage';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('⚠️ Alert! ⚠️',
          style: TextStyle(color: Color.fromARGB(255, 122, 164, 94))),
      content: const Text(
          'You already chose a starting date for your training. To restart from scratch you have to delete all the data first.'),
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
