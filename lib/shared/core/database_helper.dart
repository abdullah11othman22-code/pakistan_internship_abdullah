import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../models/to_do_model_draft.dart';

class DatabaseHelper {

  static final DatabaseHelper instance =
  DatabaseHelper._();

  DatabaseHelper._();

  Database? _database;


  Future<Database> get database async {

    if (_database != null) return _database!;

    _database = await _initDatabase();

    return _database!;

  }


  Future<Database> _initDatabase() async {

    final dbPath = await getDatabasesPath();

    final path = join(dbPath, 'todo.db');


    return await openDatabase(

      path,

      version: 1,

      onCreate: (db, version) async {

        await db.execute('''
          CREATE TABLE tasks(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            description TEXT,
            dateTime TEXT,
            state INTEGER
          )
        ''');

      },

    );

  }



  // إضافة مهمة
  Future<void> insertTask(TaskModel task) async {

    final db = await database;

    await db.insert(
      'tasks',
      task.toMap(),
    );

  }
  // جلب كل المهام
  Future<List<TaskModel>> getTasks() async {

    final db = await database;

    final result = await db.query('tasks');

    return result.map((e) {
      return TaskModel.fromMap(e);
    }).toList();

  }


// حذف مهمة
  Future<void> deleteTask(int id) async {

    final db = await database;

    await db.delete(
      'tasks',
      where: 'id = ?',
      whereArgs: [id],
    );

  }


// تعديل مهمة
  Future<void> updateTask(TaskModel task) async {

    final db = await database;

    await db.update(

      'tasks',

      task.toMap(),

      where: 'id = ?',

      whereArgs: [task.id],

    );

  }


}