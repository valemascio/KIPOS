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
    final database = _$KiposDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$KiposDatabase extends AppDatabase {
  _$KiposDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  DatiDao? _datiDaoInstance;

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
            'CREATE TABLE IF NOT EXISTS `Todo` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `name` TEXT NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  DatiDao get datiDao {
    return _datiDaoInstance ??= _$DatiDao(database, changeListener);
  }
}

class _$DatiDao extends DatiDao {
  _$DatiDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _todoInsertionAdapter = InsertionAdapter(
            database,
            'Dati',
            (Dati item) => <String, Object?>{
                  'id': item.id,
                  'week': item.week,
                  'distance': item.distance,
                  'steps': item.steps,
                  'calories': item.calories
                },
            changeListener),
        _todoDeletionAdapter = DeletionAdapter(
            database,
            'Dati',
            ['id'],
            (Dati item) => <String, Object?>{
                  'id': item.id,
                  'week': item.week,
                  'distance': item.distance,
                  'steps': item.steps,
                  'calories': item.calories
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Dati> _todoInsertionAdapter;

  final DeletionAdapter<Dati> _todoDeletionAdapter;

  @override
  Future<List<Dati>> findAllTodos() async {
    return _queryAdapter.queryList('SELECT * FROM Dati',
        mapper: (Map<String, Object?> row) => Dati(
            row['id'] as int?,
            row['week'] as int,
            row['distance'] as double,
            row['steps'] as double,
            row['calories'] as double));
  }

  @override
  Stream<Dati?> findTodoById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM Dati WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Dati(
            row['id'] as int?,
            row['week'] as int,
            row['distance'] as double,
            row['steps'] as double,
            row['calories'] as double),
        arguments: [id],
        queryableName: 'Dati',
        isView: false);
  }

  @override
  Future<void> insertTodo(Dati todo) async {
    await _todoInsertionAdapter.insert(todo, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteTodo(Dati task) async {
    await _todoDeletionAdapter.delete(task);
  }
}
