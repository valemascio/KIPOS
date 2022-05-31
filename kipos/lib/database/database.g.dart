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
            'CREATE TABLE IF NOT EXISTS `Dati` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `week` INTEGER NOT NULL, `distance` REAL NOT NULL, `steps` REAL NOT NULL, `calories` REAL NOT NULL)');

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
      : _queryAdapter = QueryAdapter(database),
        _datiInsertionAdapter = InsertionAdapter(
            database,
            'Dati',
            (Dati item) => <String, Object?>{
                  'id': item.id,
                  'week': item.week,
                  'distance': item.distance,
                  'steps': item.steps,
                  'calories': item.calories
                }),
        _datiDeletionAdapter = DeletionAdapter(
            database,
            'Dati',
            ['id'],
            (Dati item) => <String, Object?>{
                  'id': item.id,
                  'week': item.week,
                  'distance': item.distance,
                  'steps': item.steps,
                  'calories': item.calories
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Dati> _datiInsertionAdapter;

  final DeletionAdapter<Dati> _datiDeletionAdapter;

  @override
  Future<List<Dati>> findAllDati() async {
    return _queryAdapter.queryList('SELECT * FROM Todo',
        mapper: (Map<String, Object?> row) => Dati(
            row['id'] as int?,
            row['week'] as int,
            row['distance'] as double,
            row['steps'] as double,
            row['calories'] as double));
  }

  @override
  Future<void> insertDati(Dati todo) async {
    await _datiInsertionAdapter.insert(todo, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteDati(Dati task) async {
    await _datiDeletionAdapter.delete(task);
  }
}
