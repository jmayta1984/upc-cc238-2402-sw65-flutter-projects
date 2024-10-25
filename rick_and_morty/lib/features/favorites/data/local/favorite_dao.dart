import 'package:rick_and_morty/features/favorites/data/local/favorite_model.dart';
import 'package:rick_and_morty/shared/data/local/app_database.dart';

class FavoriteDao {
  Future<List<FavoriteModel>> fetchAllFavorites() async {
    final db = await AppDatabase().openDb();
    List favorites = await db.query(AppDatabase().tableName);
    return favorites.map((map) => FavoriteModel.fromMap(map)).toList();
  }

  Future<void> insertFavorite(FavoriteModel favorite) async {
    final db = await AppDatabase().openDb();
    await db.insert(AppDatabase().tableName, favorite.toMap());
  }

  Future<void> deleteFavorite(int id) async {
    final db = await AppDatabase().openDb();
    await db.delete(AppDatabase().tableName, where: 'id = ?', whereArgs: [id]);
  }

  Future<bool> isFavorite(int id) async {
    final db = await AppDatabase().openDb();
    List result = await db
        .query(AppDatabase().tableName, where: 'id = ?', whereArgs: [id]);
    return result.isNotEmpty;
  }
}
