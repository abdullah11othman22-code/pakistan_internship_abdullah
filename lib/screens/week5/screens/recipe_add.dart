
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:project1/screens/week5/data/recipe_database.dart';
import 'package:project1/screens/week5/models/model.dart';
import 'package:project1/screens/week5/wedgit/ingredient_section.dart';
import 'package:project1/screens/week5/wedgit/step_section.dart';
import 'package:project1/screens/week5/wedgit/recipe_category_selector.dart';
import 'package:project1/screens/week5/wedgit/recipe_image_picker.dart';

class AddRecipe extends StatefulWidget {
  const AddRecipe({super.key});

  @override
  State<AddRecipe> createState() => _AddRecipeState();
}

class _AddRecipeState extends State<AddRecipe> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();

  List<String> ingredients = [];
  List<RecipeStep> steps = [];

  RecipeCategory? selectedCategory;
  File? selectedImage;

  Future<void> saveRecipe() async {
    // 1. Validate the recipe name.
    final isFormValid = _formKey.currentState!.validate();

    if (!isFormValid) return;

    // 2. Check whether a category and image have been selected.
    if (selectedCategory == null || selectedImage == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select a category and an image.'),
        ),
      );
      return;
    }

    // 3. Create a recipe object from the entered data.
    final recipe = Recipe(
      name: _nameController.text.trim(),
      imageUrlOrPath: selectedImage!.path,
      category: selectedCategory!,
      ingredients: List<String>.from(ingredients),
      steps: List<RecipeStep>.from(steps),
    );

    // 4. Save the recipe to the database.
    try {
      await RecipeDatabase.instance.insertRecipe(recipe);

      if (!mounted) return;

      // 5. Return to the previous screen after saving successfully.
      Navigator.pop(context);
    } catch (error) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to save recipe: $error'),
        ),
      );
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Recipe'),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
            Text(
                'Recipe Name',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,                  color: Colors.deepPurple.withOpacity(0.8)

                ),
              ),
              const SizedBox(height: 8),

              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  hintText: 'e.g., Chocolate Cake',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter a recipe name.';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 24),

        Text(
                'Ingredients',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,                  color: Colors.deepPurple.withOpacity(0.8)

                ),
              ),
              const SizedBox(height: 8),

              IngredientSection(
                onIngredientsChanged: (value) {
                  ingredients = value;
                },
              ),

              const SizedBox(height: 24),

              Text(
                'Preparation Steps',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple.withOpacity(0.8)
                ),
              ),
              const SizedBox(height: 8),

              StepSection(
                onStepsChanged: (value) {
                  steps = value;
                },
              ),

              const SizedBox(height: 24),

              RecipeCategorySelector(
                selectedCategory: selectedCategory,
                onChanged: (category) {
                  setState(() {
                    selectedCategory = category;
                  });
                },
              ),

              const SizedBox(height: 24),

              RecipeImagePicker(
                onImageSelected: (image) {
                  selectedImage = image;
                },
              ),

              const SizedBox(height: 32),

              SizedBox(
                height: 50,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.deepPurple.withOpacity(0.4),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.deepPurple,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: saveRecipe,
                    child: const Text(
                      'Add Recipe',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
