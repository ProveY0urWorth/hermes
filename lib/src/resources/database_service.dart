import 'package:hermes/src/core/constants/database_constants.dart';
import 'package:hermes/src/models/stock_db_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, databaseName),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE stocks(id INTEGER PRIMARY KEY, symbol TEXT, displaySymbol TEXT, description TEXT, type TEXT )',
        );
      },
      version: 1,
    );
  }

  Future<void> insertStock(Stock stock) async {
    final Database db = await initializeDB();
    await db.insert('stocks', stock.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Stock>> getAllStocks() async {
    final Database db = await initializeDB();
    final List<Map<String, dynamic>> maps = await db.query('stocks');
    return List.generate(
        maps.length,
        (i) => Stock(
            id: maps[i]['id'],
            symbol: maps[i]['symbol'],
            displaySymbol: maps[i]['displaySymbol'],
            description: maps[i]['description'],
            type: maps[i]['type']));
  }

  Future<List<String>> getAllStocksSymbols() async {
    final Database db = await initializeDB();
    final List<Map<String, dynamic>> maps = await db.query('stocks');
    return List.generate(maps.length, (index) => maps[index]['symbol']);
  }

  Future<int> getLastItemId() async {
    final Database db = await initializeDB();
    final List<Map<String, dynamic>> maps = await db.query('stocks');
    if (maps.isNotEmpty) {
      return maps.last['id'];
    } else {
      return 0;
    }
  }

  Future<void> updateStock(Stock stock) async {
    final Database db = await initializeDB();
    await db.update('stocks', stock.toMap(),
        where: 'id = ?', whereArgs: [stock.id]);
  }

  Future<void> deleteStock(String symbol) async {
    final Database db = await initializeDB();
    await db.delete('stocks', where: 'symbol =?', whereArgs: [symbol]);
  }
}
