import 'package:kipos/database/entities/dati.dart';
import 'package:floor/floor.dart';

//Here, we are saying that the following class defines a dao.

@dao
abstract class DatiDao {
  //Query #1: SELECT -> this allows to obtain all the entries of the Todo table
  @Query('SELECT * FROM Todo')
  Future<List<Dati>> findAllDati();

  //Query #2: INSERT -> this allows to add a Todo in the table
  @insert
  Future<void> insertDati(Dati todo);

  //Query #3: DELETE -> this allows to delete a Todo from the table
  @delete
  Future<void> deleteDati(Dati task);
}//TodoDao