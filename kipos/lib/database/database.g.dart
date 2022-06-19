// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  DatiDao? _datiDaoInstance;

  PersonDao? _personDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Dati` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `week` INTEGER NOT NULL, `distance` REAL NOT NULL, `steps` REAL NOT NULL, `calories` REAL NOT NULL, `floors` REAL NOT NULL)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Person` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `name` TEXT, `surname` TEXT, `age` INTEGER, `avatar` TEXT, `weight` REAL, `height` REAL, `avgDailySteps` INTEGER, `dateOfBirth` INTEGER, `durationOfSleep` INTEGER)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  DatiDao get datiDao {
    return _datiDaoInstance ??= _$DatiDao(database, changeListener);
  }

  @override
  PersonDao get personDao {
    return _personDaoInstance ??= _$PersonDao(database, changeListener);
  }
}

class _$DatiDao extends DatiDao {
  _$DatiDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _datiInsertionAdapter = InsertionAdapter(
            database,
            'Dati',
            (Dati item) => <String, Object?>{
                  'id': item.id,
                  'week': item.week,
                  'distance': item.distance,
                  'steps': item.steps,
                  'calories': item.calories,
                  'floors': item.floors
                },
            changeListener),
        _datiUpdateAdapter = UpdateAdapter(
            database,
            'Dati',
            ['id'],
            (Dati item) => <String, Object?>{
                  'id': item.id,
                  'week': item.week,
                  'distance': item.distance,
                  'steps': item.steps,
                  'calories': item.calories,
                  'floors': item.floors
                },
            changeListener),
        _datiDeletionAdapter = DeletionAdapter(
            database,
            'Dati',
            ['id'],
            (Dati item) => <String, Object?>{
                  'id': item.id,
                  'week': item.week,
                  'distance': item.distance,
                  'steps': item.steps,
                  'calories': item.calories,
                  'floors': item.floors
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Dati> _datiInsertionAdapter;

  final UpdateAdapter<Dati> _datiUpdateAdapter;

  final DeletionAdapter<Dati> _datiDeletionAdapter;

  @override
  Future<List<Dati>> findAllDati() async {
    return _queryAdapter.queryList('SELECT * FROM Dati',
        mapper: (Map<String, Object?> row) => Dati(
            row['id'] as int?,
            row['week'] as int,
            row['distance'] as double,
            row['steps'] as double,
            row['calories'] as double,
            row['floors'] as double));
  }

  @override
  Stream<Dati?> findDataById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM Dati WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Dati(
            row['id'] as int?,
            row['week'] as int,
            row['distance'] as double,
            row['steps'] as double,
            row['calories'] as double,
            row['floors'] as double),
        arguments: [id],
        queryableName: 'Dati',
        isView: false);
  }

  @override
  Stream<Dati?> findDataByWeek(double week) {
    return _queryAdapter.queryStream('SELECT * FROM Dati WHERE week = ?1',
        mapper: (Map<String, Object?> row) => Dati(
            row['id'] as int?,
            row['week'] as int,
            row['distance'] as double,
            row['steps'] as double,
            row['calories'] as double,
            row['floors'] as double),
        arguments: [week],
        queryableName: 'Dati',
        isView: false);
  }

  @override
  Future<void> insertDati(Dati todo) async {
    await _datiInsertionAdapter.insert(todo, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateDati(Dati todo) async {
    await _datiUpdateAdapter.update(todo, OnConflictStrategy.replace);
  }

  @override
  Future<void> deleteDati(Dati task) async {
    await _datiDeletionAdapter.delete(task);
  }
}

class _$PersonDao extends PersonDao {
  _$PersonDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _personInsertionAdapter = InsertionAdapter(
            database,
            'Person',
            (Person item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'surname': item.surname,
                  'age': item.age,
                  'avatar': item.avatar,
                  'weight': item.weight,
                  'height': item.height,
                  'avgDailySteps': item.avgDailySteps,
                  'dateOfBirth': item.dateOfBirth,
                  'durationOfSleep': item.durationOfSleep
                },
            changeListener),
        _personUpdateAdapter = UpdateAdapter(
            database,
            'Person',
            ['id'],
            (Person item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'surname': item.surname,
                  'age': item.age,
                  'avatar': item.avatar,
                  'weight': item.weight,
                  'height': item.height,
                  'avgDailySteps': item.avgDailySteps,
                  'dateOfBirth': item.dateOfBirth,
                  'durationOfSleep': item.durationOfSleep
                },
            changeListener),
        _personDeletionAdapter = DeletionAdapter(
            database,
            'Person',
            ['id'],
            (Person item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'surname': item.surname,
                  'age': item.age,
                  'avatar': item.avatar,
                  'weight': item.weight,
                  'height': item.height,
                  'avgDailySteps': item.avgDailySteps,
                  'dateOfBirth': item.dateOfBirth,
                  'durationOfSleep': item.durationOfSleep
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Person> _personInsertionAdapter;

  final UpdateAdapter<Person> _personUpdateAdapter;

  final DeletionAdapter<Person> _personDeletionAdapter;

  @override
  Future<List<Person>> findAllPerson() async {
    return _queryAdapter.queryList('SELECT * FROM Person',
        mapper: (Map<String, Object?> row) => Person(
            row['id'] as int?,
            row['name'] as String?,
            row['surname'] as String?,
            row['age'] as int?,
            row['avatar'] as String?,
            row['weight'] as double?,
            row['height'] as double?,
            row['avgDailySteps'] as int?,
            row['dateOfBirth'] as int?,
            row['durationOfSleep'] as int?));
  }

  @override
  Stream<Person?> findDataById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM Person WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Person(
            row['id'] as int?,
            row['name'] as String?,
            row['surname'] as String?,
            row['age'] as int?,
            row['avatar'] as String?,
            row['weight'] as double?,
            row['height'] as double?,
            row['avgDailySteps'] as int?,
            row['dateOfBirth'] as int?,
            row['durationOfSleep'] as int?),
        arguments: [id],
        queryableName: 'Person',
        isView: false);
  }

  @override
  Future<void> insertPerson(Person todo) async {
    await _personInsertionAdapter.insert(todo, OnConflictStrategy.abort);
  }

  @override
  Future<void> updatePerson(Person todo) async {
    await _personUpdateAdapter.update(todo, OnConflictStrategy.replace);
  }

  @override
  Future<void> deletePerson(Person task) async {
    await _personDeletionAdapter.delete(task);
  }
}
