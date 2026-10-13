
import 'package:flutter/material.dart';
import 'package:project1/screens/week5/screens/recipe_add.dart';

import '../data/mock_data.dart';
import '../models/model.dart';
import '../wedgit/recipe_card.dart';

class HomeRecipe extends StatefulWidget {
const HomeRecipe({super.key});

@override
State<HomeRecipe> createState() => _HomeRecipeState();
}

class _HomeRecipeState extends State<HomeRecipe> {
late List<Recipe> recipes;

@override
void initState() {
super.initState();
recipes = mockRecipes;
}

Future<void> openAddRecipe() async {
final Recipe? newRecipe = await Navigator.push<Recipe>(
context,
MaterialPageRoute(
builder: (context) => const AddRecipe(),
),
);

if (newRecipe != null) {
setState(() {
recipes.insert(0, newRecipe);
});
}
}

@override
Widget build(BuildContext context) {
return Stack(
children: [
GridView.builder(
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
