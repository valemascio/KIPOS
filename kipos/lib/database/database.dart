//Imports that are necessary to the code generator of floor
import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'daos/personDao.dart';

//Here, we are importing the entities and the daos of the database
import 'daos/datiDao.dart';
import 'entities/dati.dart';

//The generated code will be in database.g.dart
part 'database.g.dart';

//Here we are saying that this is the first version of the Database and it has just 1 entity, i.e., Todo
@Database(version: 1, entities: [Dati, Person])
abstract class AppDatabase extends FloorDatabase {
  //Add all the daos as getters here
  DatiDao get datiDao;
  PersonDao get personDao;
}//AppDatabase

