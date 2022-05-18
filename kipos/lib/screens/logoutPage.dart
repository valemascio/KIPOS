import 'package:flutter/material.dart';
import 'package:kipos/screens/loginPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogoutPage extends StatelessWidget {
  const LogoutPage({Key? key}) : super(key: key);

  static const route = '/logout/';
  static const routename = 'logoutPage';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Logout',
          style: TextStyle(color: Color.fromARGB(255, 122, 164, 94))),
      content: const Text('Are you sure you want to logout?'),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel',
              style: TextStyle(color: Color.fromARGB(255, 122, 164, 94))),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            Navigator.popAndPushNamed(context, LoginPage.route);
          },
          child: const Text('OK',
              style: TextStyle(color: Color.fromARGB(255, 122, 164, 94))),
        ),
      ],
    );
  }
}
