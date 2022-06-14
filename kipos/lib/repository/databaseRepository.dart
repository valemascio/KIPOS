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
  } //findAllDati

  //This method wraps the insertTodo() method of the DAO.
  //Then, it notifies the listeners that something changed.
  Future<void> insertDati(Dati todo) async {
    await database.datiDao.insertDati(todo);
    notifyListeners();
  } //insertDati

  //This method wraps the deleteTodo() method of the DAO.
  //Then, it notifies the listeners that something changed.
  Future<void> removeDati(Dati todo) async {
    await database.datiDao.deleteDati(todo);
    notifyListeners();
  } //removeDati

  /////

  //This method wraps the findAllTodos() method of the DAO
  Future<List<Person>> findAllPerson() async {
    final results = await database.personDao.findAllPerson();
    return results;
  } //findAllPerson

  //This method wraps the insertTodo() method of the DAO.
  //Then, it notifies the listeners that something changed.
  Future<void> insertPerson(Person todo) async {
    await database.personDao.insertPerson(todo);
    notifyListeners();
  } //insertPerson

  //This method wraps the deleteTodo() method of the DAO.
  //Then, it notifies the listeners that something changed.
  Future<void> removePerson(Person todo) async {
    await database.personDao.deletePerson(todo);
    notifyListeners();
  } //removePerson

  Future<void> updateDati(Dati todo) async {
    await database.datiDao.updateDati(todo);
    notifyListeners();
  } //updateMeal

} //DatabaseRepository
