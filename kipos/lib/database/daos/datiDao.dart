import 'package:kipos/database/entities/dati.dart';
import 'package:floor/floor.dart';

//Here, we are saying that the following class defines a dao.

@dao
abstract class DatiDao {
  //Query #1: SELECT -> this allows to obtain all the entries of the Dati table
  @Query('SELECT * FROM Dati')
  Future<List<Dati>> findAllDati();

  @Query('SELECT * FROM Dati WHERE id = :id')
  Stream<Dati?> findDataById(int id);

  //Query #2: INSERT -> this allows to add a Dati in the table
  @insert
  Future<void> insertDati(Dati todo);

  //Query #3: DELETE -> this allows to delete a Dati from the table
  @delete
  Future<void> deleteDati(Dati task);
}//TodoDao