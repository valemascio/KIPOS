import 'package:flutter/material.dart';
import 'package:kipos/screens/preferencePage.dart';
import 'package:provider/provider.dart';
import 'package:kipos/database/entities/dati.dart';
import 'package:kipos/repository/databaseRepository.dart';

class DeletePage extends StatelessWidget {
  const DeletePage({Key? key}) : super(key: key);

  static const route = '/delete/';
  static const routename = 'deletePage';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('🚮 Delete',
          style: TextStyle(color: Color.fromARGB(255, 122, 164, 94))),
      content: const Text('Are you sure you want to clear all the data?'),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel',
              style: TextStyle(color: Color.fromARGB(255, 122, 164, 94))),
        ),
        TextButton(
          onPressed: () {
            _toPreferencePage(context);
          },
          child: const Text('OK',
              style: TextStyle(color: Color.fromARGB(255, 122, 164, 94))),
        ),
      ],
    );
  }

  void _toPreferencePage(BuildContext context) async {
    final listaDati =
        Provider.of<DatabaseRepository>(context, listen: false).findAllDati();
    List<Dati> datoLista = await listaDati;
    for (int i = 0; i < datoLista.length; i++) {
      Provider.of<DatabaseRepository>(context, listen: false)
          .removeDati(datoLista[i]);
    }

    //Pop the drawer first
    Navigator.pop(context);
    //Then pop the HomePage
    Navigator.of(context).pushReplacementNamed(PreferencePage.route);
  } //_toCalendarPage
}
