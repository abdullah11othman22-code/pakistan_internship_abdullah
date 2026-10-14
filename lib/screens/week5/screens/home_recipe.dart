
import 'package:flutter/material.dart';
import 'package:project1/screens/week5/screens/recipe_add.dart';

import '../data/recipe_database.dart';
import '../models/model.dart';
import '../wedgit/recipe_card.dart';

class HomeRecipe extends StatefulWidget {
  const HomeRecipe({super.key});

  @override
  State<HomeRecipe> createState() => _HomeRecipeState();
}

class _HomeRecipeState extends State<HomeRecipe> {
  late Future<List<Recipe>> recipesFuture;

  @override
  void initState() {
    super.initState();
    recipesFuture = RecipeDatabase.instance.getRecipes();
  }

  Future<void> loadRecipes() async {
    setState(() {
      recipesFuture = RecipeDatabase.instance.getRecipes();
    });
  }

  Future<void> openAddRecipe() async {
    await Navigator.push<Recipe>(
      context,
      MaterialPageRoute(
        builder: (context) => const AddRecipe(),
      ),
    );

    if (!mounted) return;

    await loadRecipes();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FutureBuilder<List<Recipe>>(
          future: recipesFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (snapshot.hasError) {
              return Center(
                child: Text(
                  'حدث خطأ أثناء تحميل الوصفات:\n${snapshot.error}',
                  textAlign: TextAlign.center,
                ),
              );
            }

            final recipes = snapshot.data ?? [];

            if (recipes.isEmpty) {
              return const Center(
                child: Text('لا توجد وصفات حالياً'),
              );
            }

            return GridView.builder(
              itemCount: recipes.length,
              padding: const EdgeInsets.only(
                bottom: 80,
                left: 8,
                right: 8,
                top: 8,
              ),
              itemBuilder: (context, index) {
                return RecipeCard(
                  recipe: recipes[index],
                );
              },
              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                mainAxisExtent: 225,
              ),
            );
          },
        ),
        Positioned(
          bottom: 20,
          right: 20,
          child: GestureDetector(
            onTap: openAddRecipe,
            child: CircleAvatar(
              radius: 32,
              backgroundColor:
              Colors.deepPurple.withOpacity(0.2),
              child: const Icon(
                Icons.add,
                size: 30,
                color: Colors.deepPurple,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
