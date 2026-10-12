
import 'package:flutter/material.dart';

import '../data/mock_data.dart';
import '../wedgit/recipe_card.dart';

class HomeRecipe extends StatelessWidget {
  const HomeRecipe({super.key});

  @override
  Widget build(BuildContext context) {
    return

      Center(
        child:
        GridView.builder(
          itemCount: mockRecipes.length,
          itemBuilder: (BuildContext context, int index) {
            return RecipeCard(
              recipe: mockRecipes[index],




            );
          },
          gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 2,childAspectRatio: 1,mainAxisExtent: 225


          ),
        ),
      );}

  }

