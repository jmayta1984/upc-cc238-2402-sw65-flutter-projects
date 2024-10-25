import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabase {
  final int version = 1;
  final String databaseName = 'news.db';
  final String tableName = 'news';

  Database? db;

  Future<Database> openDb() async {
    
    db ??= await openDatabase(
      join(await getDatabasesPath(), databaseName),
      version: version,
      onCreate: (db, version) {
        String query =
            'create table $tableName (title text primary key, image text, author text )';
        db.execute(query);
      },
    );
    return db as Database;
  }
}
