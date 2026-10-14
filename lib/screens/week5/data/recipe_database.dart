
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/model.dart';
import 'mock_data.dart';

class RecipeDatabase {
  RecipeDatabase._();

  static final RecipeDatabase instance = RecipeDatabase._();

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'recipes.db');

    return openDatabase(
      path,
      version: 1,
      onConfigure: (db) async {
        await db.execute('PRAGMA foreign_keys = ON');
      },
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE recipes (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            imageUrlOrPath TEXT NOT NULL,
            category TEXT NOT NULL
          )
        ''');

        await db.execute('''
          CREATE TABLE ingredients (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            recipe_id INTEGER NOT NULL,
            name TEXT NOT NULL,
            FOREIGN KEY (recipe_id)
              REFERENCES recipes(id)
              ON DELETE CASCADE
          )
        ''');

        await db.execute('''
          CREATE TABLE recipe_steps (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            recipe_id INTEGER NOT NULL,
            title TEXT NOT NULL,
            description TEXT NOT NULL,
            step_order INTEGER NOT NULL,
            FOREIGN KEY (recipe_id)
              REFERENCES recipes(id)
              ON DELETE CASCADE
          )
        ''');

        // إدخال الوصفات التجريبية عند إنشاء القاعدة أول مرة.
        for (final recipe in mockRecipes) {
          await _insertRecipe(db, recipe);
        }
      },
    );
  }

  // حفظ وصفة مع مكوناتها وخطواتها.
  Future<int> insertRecipe(Recipe recipe) async {
    final db = await database;

    return db.transaction((txn) async {
      return _insertRecipe(txn, recipe);
    });
  }

  Future<int> _insertRecipe(
      DatabaseExecutor db,
      Recipe recipe,
      ) async {
    final recipeData = <String, Object?>{
      'name': recipe.name,
      'imageUrlOrPath': recipe.imageUrlOrPath,
      'category': recipe.category.name,
    };

    // الاحتفاظ بمعرفات الوصفات التجريبية الأصلية.
    if (recipe.id != null) {
      recipeData['id'] = recipe.id;
    }

    final recipeId = await db.insert('recipes', recipeData);

    for (final ingredient in recipe.ingredients) {
      await db.insert('ingredients', {
        'recipe_id': recipeId,
        'name': ingredient,
      });
    }

    for (var i = 0; i < recipe.steps.length; i++) {
      final step = recipe.steps[i];

      await db.insert('recipe_steps', {
        'recipe_id': recipeId,
        'title': step.title,
        'description': step.description,
        'step_order': i,
      });
    }

    return recipeId;
  }

  // جلب جميع الوصفات مع مكوناتها وخطواتها.
  Future<List<Recipe>> getRecipes() async {
    final db = await database;

    final recipeRows = await db.query(
      'recipes',
      orderBy: 'id DESC',
    );

    final recipes = <Recipe>[];

    for (final row in recipeRows) {
      final recipeId = row['id'] as int;

      final ingredientRows = await db.query(
        'ingredients',
        where: 'recipe_id = ?',
        whereArgs: [recipeId],
        orderBy: 'id ASC',
      );

      final stepRows = await db.query(
        'recipe_steps',
        where: 'recipe_id = ?',
        whereArgs: [recipeId],
        orderBy: 'step_order ASC',
      );

      recipes.add(
        Recipe(
          id: recipeId,
          name: row['name'] as String,
          imageUrlOrPath: row['imageUrlOrPath'] as String,
          category: RecipeCategory.values.firstWhere(
                (category) => category.name == row['category'],
          ),
          ingredients: ingredientRows
              .map((item) => item['name'] as String)
              .toList(),
          steps: stepRows
              .map(
                (item) => RecipeStep(
              title: item['title'] as String,
              description: item['description'] as String,
            ),
          )
              .toList(),
        ),
      );
    }

    return recipes;
  }
}
