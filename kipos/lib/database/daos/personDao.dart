import 'package:kipos/database/entities/dati.dart';
import 'package:floor/floor.dart';
import 'package:kipos/screens/deletePage.dart';

@dao
abstract class PersonDao {
  //Query #1: SELECT -> this allows to obtain all the entries of the Dati table
  @Query('SELECT * FROM Person')
  Future<List<Person>> findAllPerson();

  @Query('SELECT * FROM Person WHERE id = :id')
  Stream<Person?> findDataById(int id);

  //Query #2: INSERT -> this allows to add a Dati in the table
  @insert
  Future<void> insertPerson(Person todo);

  //Query #3: DELETE -> this allows to delete a Dati from the table
  @delete
  Future<void> deletePerson(Person task);
}//DatiDao