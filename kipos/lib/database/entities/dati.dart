import 'dart:ffi';

import 'package:floor/floor.dart';

//Here, we are saying to floor that this is a class that defines an entity
@entity
class Dati {
  //id will be the primary key of the table. Moreover, it will be autogenerated.
  //id is nullable since it is autogenerated.
  @PrimaryKey(autoGenerate: true)
  final int? id;

  final int week;

  final double distance;

  final double steps;

  final double calories;

  //Default constructor
  Dati(this.id, this.week, this.distance, this.steps, this.calories);
}//Dati