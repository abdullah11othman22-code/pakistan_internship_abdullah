
import 'package:flutter/material.dart';

import '../data/mock_data.dart';
import '../wedgit/recipe_card.dart';

class HomeRecipe extends StatelessWidget {
  const HomeRecipe({super.key});



  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GridView.builder(
          itemCount: mockRecipes.length,
          padding: const EdgeInsets.only(
            bottom: 80,
            left: 8,
            right: 8,
            top: 8,
          ),
          itemBuilder: (context, index) {
            return RecipeCard(
              recipe: mockRecipes[index],
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
            onTap: () {},
            child: CircleAvatar(
              radius: 32,
              backgroundColor:
              Colors.deepPurple.withOpacity(0.200),
              child: const Icon(Icons.add,size: 30,color: Colors.deepPurple,),
            ),
          ),
        ),
      ],
    );
  }

  }

