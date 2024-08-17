import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  DatabaseHelper._internal();

  factory DatabaseHelper() => _instance;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDb();
    return _database!;
  }

  Future<Database> _initDb() async {
    String path = join(await getDatabasesPath(), 'counter.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE Counter(id INTEGER PRIMARY KEY, count INTEGER)',
        );
        // Insert initial values for each button
        await db.insert('Counter', {'id': 1, 'count': 123}); // Maple Heart Icon
        await db.insert('Counter', {'id': 2, 'count': 456}); // Maple Eye Icon
        await db.insert('Counter', {'id': 3, 'count': 321}); // Oak Heart Icon
        await db.insert('Counter', {'id': 4, 'count': 654}); // Oak Eye Icon
        await db.insert('Counter', {'id': 5, 'count': 123}); // Mango Heart Icon
        await db.insert('Counter', {'id': 6, 'count': 456}); // Mango Eye Icon
      },
    );
  }

  Future<int> getCount(int buttonId) async {
    final db = await database;
    final result =
        await db.query('Counter', where: 'id = ?', whereArgs: [buttonId]);
    return result.isNotEmpty ? result.first['count'] as int : 0;
  }

  Future<void> incrementCount(int buttonId) async {
    final db = await database;
    int currentCount = await getCount(buttonId);
    await db.update(
      'Counter',
      {'count': currentCount + 1},
      where: 'id = ?',
      whereArgs: [buttonId],
    );
  }
}
