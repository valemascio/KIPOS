import 'package:kipos/database/database.dart';
import 'package:kipos/database/entities/dati.dart';
import 'package:flutter/material.dart';

class DatabaseRepository extends ChangeNotifier {
  //The state of the database is just the AppDatabase
  final AppDatabase database;

  //Default constructor
  DatabaseRepository({required this.database});

  //This method wraps the findAllTodos() method of the DAO
  Future<List<Dati>> findAllDati() async {
    final results = await database.datiDao.findAllDati();
    return results;
  } //findAllTodos

  //This method wraps the insertTodo() method of the DAO.
  //Then, it notifies the listeners that something changed.
  Future<void> insertDati(Dati todo) async {
    await database.datiDao.insertDati(todo);
    notifyListeners();
  } //insertTodo

  //This method wraps the deleteTodo() method of the DAO.
  //Then, it notifies the listeners that something changed.
  Future<void> removeDati(Dati todo) async {
    await database.datiDao.deleteDati(todo);
    notifyListeners();
  } //removeTodo

} //DatabaseRepository
