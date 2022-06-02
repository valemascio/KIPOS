import 'package:flutter/material.dart';
import 'package:kipos/screens/badgePage.dart';
import 'package:kipos/screens/homePage.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:provider/provider.dart';
import 'package:kipos/database/entities/dati.dart';
import 'package:kipos/repository/databaseRepository.dart';

/*static const route = '/profile/';
  static const routename = 'profilePage';*/

// ignore_for_file: prefer_const_constructors

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
      backgroundColor: Colors.white,
      body: Center(
        child:
            //We will show the todo table with a ListView.
            //To do so, we use a Consumer of DatabaseRepository in order to rebuild the widget tree when
            //entries are deleted or created.
            Consumer<DatabaseRepository>(builder: (context, dbr, child) {
          //The logic is to query the DB for the entire list of Todo using dbr.findAllTodos()
          //and then populate the ListView accordingly.
          //We need to use a FutureBuilder since the result of dbr.findAllTodos() is a Future.
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
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        children: [
                          Stack(
                            clipBehavior: Clip.none,
                            alignment: Alignment.bottomCenter,
                            children: [
                              Image(
                                height: MediaQuery.of(context).size.height / 3,
                                fit: BoxFit.cover,
                                image: const NetworkImage(
                                    'https://i.pinimg.com/564x/85/a3/ad/85a3ada3b8f459e574d9eaf060516744.jpg'),
                              ),
                              Positioned(
                                  bottom: -50.0,
                                  child: CircleAvatar(
                                    radius: 80,
                                    backgroundColor: Colors.black,
                                    child: CircleAvatar(
                                      radius: 75,
                                      backgroundImage:
                                          NetworkImage('${dato.avatar}'),
                                    ),
                                  ))
                            ],
                          ),
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
                          ListTile(
                            title: Text(
                              'Age',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text('${dato.age} y.o.'),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ListTile(
                            title: Text(
                              'Date of birth',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text('Insert here date of birth'),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ListTile(
                            title: Text(
                              'Weight',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text('${dato.weight} kg'),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ListTile(
                            title: Text(
                              'Height',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text('${dato.height} cm'),
                          ),
                          SizedBox(
                            height: 10,
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
