import 'dart:io';

import 'package:flutter/material.dart';
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

  void saveRecipe() {
    final isFormValid = _formKey.currentState!.validate();

    if (!isFormValid) return;

    if (selectedCategory == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('يرجى اختيار نوع الوصفة')));
      return;
    }

    if (selectedImage == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('يرجى اختيار صورة الوصفة')));
      return;
    }

    final recipe = Recipe(
      name: _nameController.text.trim(),
      imageUrlOrPath: selectedImage!.path,
      category: selectedCategory!,
      ingredients: ingredients,
      steps: steps,
    );

    Navigator.pop(context, recipe);
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('إضافة وصفة')),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              const Text(
                'اسم الوصفة',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),

              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  hintText: 'مثلاً: كيك الشوكولاتة',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'يرجى إدخال اسم الوصفة';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 24),

              const Text(
                'المكونات',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),

              IngredientSection(
                onIngredientsChanged: (value) {
                  ingredients = value;
                },
              ),

              const SizedBox(height: 24),

              const Text(
                'خطوات التحضير',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
                child: ElevatedButton(
                  onPressed: saveRecipe,
                  child: const Text(
                    'إضافة الوصفة',
                    style: TextStyle(fontSize: 16),
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
