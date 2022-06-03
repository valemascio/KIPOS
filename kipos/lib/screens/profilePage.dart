import 'package:flutter/material.dart';
import 'package:kipos/screens/badgePage.dart';
import 'package:kipos/screens/homePage.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:provider/provider.dart';
import 'package:kipos/database/entities/dati.dart';
import 'package:kipos/repository/databaseRepository.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key, String? title}) : super(key: key);

  static const route = '/profile/';
  static const routename = 'profilePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '👤 Profile',
        ),
        backgroundColor: Colors.lightGreen,
      ),
      backgroundColor: Color.fromARGB(255, 246, 246, 246),
      body: Center(
        child: Consumer<DatabaseRepository>(builder: (context, dbr, child) {
          return FutureBuilder(
            initialData: null,
            future: dbr.findAllPerson(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final user_data = snapshot.data as List<Person>;
                return ListView.builder(
                    itemCount: user_data.length,
                    itemBuilder: (context, datiIndex) {
                      final dato = user_data[datiIndex];
                      return ListView(
                        //scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        children: [
                          Stack(
                              clipBehavior: Clip.none,
                              alignment: Alignment.bottomCenter,
                              children: [
                                Image(
                                  height:
                                      MediaQuery.of(context).size.height / 4,
                                  fit: BoxFit.cover,
                                  image: const NetworkImage(
                                      'https://i.pinimg.com/564x/ac/dd/16/acdd160c95fe9edd32017ee83b46d2be.jpg'),
                                ),
                                Positioned(
                                    bottom: -40.0,
                                    child: CircleAvatar(
                                      radius: 70,
                                      backgroundColor: Colors.black,
                                      child: CircleAvatar(
                                        radius: 65,
                                        backgroundImage:
                                            NetworkImage('${dato.avatar}'),
                                      ),
                                    ))
                              ]),
                          SizedBox(
                            height: 40,
                          ),
                          ListTile(
                            title: Center(
                                child: Text(
                              '${dato.name} ${dato.surname}',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )),
                          ),
                          Divider(
                            height: 5,
                            thickness: 2.5,
                            indent: 10,
                            endIndent: 10,
                          ),
                          ListTile(
                            title: const Text(
                              'Age',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text('${dato.age} y.o.'),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          const ListTile(
                            title: Text(
                              'Date of birth',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text('Insert here date of birth'),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          ListTile(
                            title: const Text(
                              'Weight',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text('${dato.weight} kg'),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          ListTile(
                            title: const Text(
                              'Height',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text('${dato.height} cm'),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          ListTile(
                            title: const Text(
                              'Average daily steps',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text('${dato.avgDailySteps}'),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          const ListTile(
                            title: Text(
                              '',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(''),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          const ListTile(
                            title: Text(
                              '',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(''),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          const ListTile(
                            title: Text(
                              '',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(''),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          const ListTile(
                            title: Text(
                              '',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(''),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                        ],
                      );
                    });
              } else {
                //A CircularProgressIndicator is shown while the list of Todo is loading.
                return CircularProgressIndicator();
              } //else
            }, //builder of FutureBuilder
          );
        }),
      ),
    );
  }
}
