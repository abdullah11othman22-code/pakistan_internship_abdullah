
import 'package:flutter/material.dart';
import '../models/model.dart';
import '../screens/recipe_details.dart';

class RecipeCard extends StatelessWidget {
  final Recipe recipe;

  const RecipeCard({
    super.key,
    required this.recipe,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RecipeDetails(recipe: recipe),
          ),
        );
      },      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 10,vertical: 10
      
        ),
        height:300,
      
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.deepPurple.withOpacity(0.35),
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.deepPurple.withOpacity(0.35),
              blurRadius:1,
              spreadRadius: 2,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            // الجزء الأول: الصورة
      
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10.5),
                topRight: Radius.circular(10.5),
              ),
              child: SizedBox(
                width: double.infinity,
                height: 125,
                child: Image.network(
                  recipe.imageUrlOrPath,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(
                      child: Icon(Icons.broken_image),
                    );
                  },
                ),
              ),
            ),
      
      
            // الجزء الثاني: النصوص
      
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10.5),
                  bottomRight: Radius.circular (10.5),
                ),
                child: Container(
                  width: double.infinity,
                  color: Colors.white,
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          recipe.name,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: Colors.deepPurple
                          ),
                        ),
                      ),
      const Spacer(),
                      Align(
                        alignment: AlignmentGeometry.bottomRight,
                          child: Text(recipe.category.name,style: TextStyle(color: Colors.grey),)),//this text in the end
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
