import 'package:newsly/shared/data/local/app_database.dart';
import 'package:newsly/shared/data/local/favorite_news_model.dart';

class FavoriteNewsDao {
  final AppDatabase appDatabase;
  FavoriteNewsDao({required this.appDatabase});

  Future<List<FavoriteNewsModel>> fetchAllFavoriteNews() async {
    final db = await appDatabase.openDb();
    final maps = await db.query(appDatabase.tableName);
    return maps.map((json) => FavoriteNewsModel.fromMap(json)).toList();
  }

  Future<void> insertFavoriteNews(FavoriteNewsModel news) async {
    final db = await appDatabase.openDb();
    await db.insert(appDatabase.tableName,news.toMap());
  }

  Future<void> deleteFavoriteNews(String title) async {
    final db = await appDatabase.openDb();
    await db.delete(
      appDatabase.tableName,
      where: 'title = ?',
      whereArgs: [title],
    );
  }

  Future<bool> isFavorite(String title) async {
    final db = await appDatabase.openDb();
    List maps = await db.query(appDatabase.tableName, where: 'title = ?', whereArgs: [title]);
    return maps.isNotEmpty;
  }
  
}