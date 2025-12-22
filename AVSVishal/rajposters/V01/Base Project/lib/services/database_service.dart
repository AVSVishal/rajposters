import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseService {
  static final DatabaseService _instance = DatabaseService._internal();
  factory DatabaseService() => _instance;
  DatabaseService._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'notes_to_quiz_ai.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDatabase,
      onUpgrade: _upgradeDatabase,
    );
  }

  Future<void> _createDatabase(Database db, int version) async {
    // Config cache table
    await db.execute('''
      CREATE TABLE config_cache(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        config_type TEXT NOT NULL,
        config_data TEXT NOT NULL,
        last_updated INTEGER NOT NULL,
        created_at INTEGER NOT NULL
      )
    ''');

    // Notes table for future use
    await db.execute('''
      CREATE TABLE notes(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        content TEXT NOT NULL,
        created_at INTEGER NOT NULL,
        updated_at INTEGER NOT NULL
      )
    ''');

    // Quiz questions table for future use
    await db.execute('''
      CREATE TABLE quiz_questions(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        note_id INTEGER NOT NULL,
        question TEXT NOT NULL,
        options TEXT NOT NULL,
        correct_answer INTEGER NOT NULL,
        created_at INTEGER NOT NULL,
        FOREIGN KEY (note_id) REFERENCES notes (id)
      )
    ''');
  }

  Future<void> _upgradeDatabase(Database db, int oldVersion, int newVersion) async {
    // Handle database migrations for future versions
    if (oldVersion < 2) {
      // Example: Add new columns or tables
      // await db.execute('ALTER TABLE notes ADD COLUMN category TEXT DEFAULT ""');
    }
  }

  // Config cache methods (following Trickology pattern)
  Future<void> saveConfigCache(String configType, String configData) async {
    final db = await database;
    final now = DateTime.now().millisecondsSinceEpoch;
    
    await db.insert(
      'config_cache',
      {
        'config_type': configType,
        'config_data': configData,
        'last_updated': now,
        'created_at': now,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<Map<String, dynamic>?> getConfigCache(String configType) async {
    final db = await database;
    final result = await db.query(
      'config_cache',
      where: 'config_type = ?',
      whereArgs: [configType],
      orderBy: 'last_updated DESC',
      limit: 1,
    );
    
    return result.isNotEmpty ? result.first : null;
  }

  Future<bool> isCacheValid(String configType, int cacheHours) async {
    final cached = await getConfigCache(configType);
    if (cached == null) return false;
    
    final lastUpdated = cached['last_updated'] as int;
    final now = DateTime.now().millisecondsSinceEpoch;
    final diffHours = (now - lastUpdated) / (1000 * 60 * 60);
    
    return diffHours < cacheHours;
  }
}