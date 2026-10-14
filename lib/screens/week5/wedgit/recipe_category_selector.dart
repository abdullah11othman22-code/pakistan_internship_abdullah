import 'package:flutter/material.dart';
import '../models/model.dart';

class RecipeCategorySelector extends StatelessWidget {
  const RecipeCategorySelector({
    super.key,
    required this.selectedCategory,
    required this.onChanged,
  });

  final RecipeCategory? selectedCategory;
  final ValueChanged<RecipeCategory> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.deepPurple.withOpacity(0.5)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text(
          'Type',
          style: TextStyle(fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple.withOpacity(0.8)

      ),
    ),
    const SizedBox(height: 12),
    RadioGroup<RecipeCategory>(
    groupValue: selectedCategory,
    onChanged: (value) {
    if (value != null) {
    onChanged(value);
    }
    },
    child: const Column(
    children: [
    RadioListTile<RecipeCategory>(
    value: RecipeCategory.food,
    title: Text('Food'),

    ),
    RadioListTile<RecipeCategory>(
    value: RecipeCategory.dessert,
    title: Text('dessert'),

    ),
    ],
    ),
    ),
    ],
    )
    ,
    );
  }
}
