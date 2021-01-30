import 'package:challenge_pokemon/app/models/favorite.model.dart';
import 'package:challenge_pokemon/app/settings.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class FavoriteRepository {
  Future<Database> _getDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), databaseName),
      onConfigure: (db) {
        db.execute('PRAGMA foreign_keys = ON');
      },
      onCreate: (db, version) {
        db.execute(createFavoriteTableScript);
      },
      version: 1,
    );
  }

  Future create(FavoriteModel model) async {
    try {
      final db = await _getDatabase();
      await db.insert(
        favoriteTableName,
        model.toMap(),
      );
    } catch (ex) {
      print(ex);
      return ex;
    }
  }

  Future<FavoriteModel> getFavorite(String name) async {
    try {
      final db = await _getDatabase();
      final maps = await db
          .query(favoriteTableName, where: "name = ?", whereArgs: [name]);
      if (maps.length == 0) {
        return null;
      } else {
        return FavoriteModel.fromMap(maps[0]);
      }
    } catch (ex) {
      print(ex);
      return FavoriteModel();
    }
  }

  Future delete(String name) async {
    try {
      final db = await _getDatabase();
      await db.delete(
        favoriteTableName,
        where: "name = ?",
        whereArgs: [name],
      );
    } catch (ex) {
      print(ex);
      return;
    }
  }

  Future<List<FavoriteModel>> getFavorites() async {
    try {
      final db = await _getDatabase();
      final maps = await db.query(favoriteTableName, orderBy: "name");
      return List.generate(maps.length, (i) {
        return FavoriteModel.fromMap(maps[i]);
      });
    } catch (ex) {
      print(ex);
      return <FavoriteModel>[];
    }
  }
}
