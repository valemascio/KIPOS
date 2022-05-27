import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:kipos/utilities/formDateTiles.dart';
import 'package:kipos/utilities/formats.dart';
import 'package:kipos/utilities/formSeparator.dart';
import 'package:kipos/screens/homePage.dart';
import 'package:fitbitter/fitbitter.dart';
import 'package:kipos/utilities/strings.dart';
import 'package:provider/provider.dart';
import 'package:kipos/repository/databaseRepository.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  static const route = '/profile/';
  static const routename = 'profilePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('💡 Tips')));
  }
}
