import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabase {
  final int version = 1;
  final String databaseName = 'rickandmorty.db';
  final String tableName = 'characters';

  Database? _db;

  Future<Database> openDb() async {
    _db ??= await openDatabase(
      join(await getDatabasesPath(), databaseName),
      version: version,
      onCreate: (db, version) {
        String query =
            'create table $tableName (id integer primary key, name text, species text, status text, image text)';
        db.execute(query);
      },
    );
    return _db as Database;
  }
}
