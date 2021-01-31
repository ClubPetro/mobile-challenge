import 'package:challenge_pokemon/app/models/history.model.dart';
import 'package:challenge_pokemon/app/settings.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class HistoryRepository {
  Future<Database> _getDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), databaseName),
      onConfigure: (db) {
        db.execute('PRAGMA foreign_keys = ON');
      },
      onCreate: (db, version) {
        db.execute(createFavoriteTableScript);
        db.execute(createHistoryTableScript);
      },
      version: 1,
    );
  }

  Future create(HistoryModel model) async {
    try {
      final db = await _getDatabase();
      await db.insert(
        historyTableName,
        model.toMap(),
      );
    } catch (ex) {
      print(ex);
      return ex;
    }
  }

  Future delete(String name) async {
    try {
      final db = await _getDatabase();
      await db.delete(
        historyTableName,
        where: "history = ?",
        whereArgs: [name],
      );
    } catch (ex) {
      print(ex);
      return;
    }
  }

  Future<List<HistoryModel>> getHistories() async {
    try {
      final db = await _getDatabase();
      final maps = await db.query(historyTableName);
      return List.generate(maps.length, (i) {
        return HistoryModel.fromMap(maps[i]);
      });
    } catch (ex) {
      print(ex);
      return <HistoryModel>[];
    }
  }
}
