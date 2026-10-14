
import 'dart:io';

import 'package:flutter/material.dart';
import '../models/model.dart';
import '../screens/recipe_details.dart';
import 'package:flutter/material.dart';
import 'package:project1/screens/week5/data/mock_data.dart';
import 'package:project1/screens/week5/wedgit/recipe_image.dart';
import '../models/model.dart';

class StepsCard extends StatelessWidget {
  const StepsCard({super.key, required this.recipe});
  final Recipe recipe ;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 275,
      width: double.infinity,
      decoration: BoxDecoration(

          color: Colors.white,
          border: Border(
            right: BorderSide(
              color: Colors.deepPurple.withValues(alpha: 0.25),
              width: 2,

            ),
            left: BorderSide(
              color: Colors.deepPurple.withValues(alpha: 0.25),
              width: 2,
            ),
            bottom: BorderSide(
              color: Colors.deepPurple.withValues(alpha: 0.25),
              width: 2,
            ),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.deepPurple.withValues(alpha: 0.10),
              blurRadius: 12,
              spreadRadius:1,
              offset: const Offset(0, 4),
            ),

          ],
          borderRadius: BorderRadius.only(bottomRight:Radius.circular(12) ,
              bottomLeft:Radius.circular(12)
          )
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView.separated(
            padding: const EdgeInsets.all(12),
            itemCount: recipe.steps.length,
            separatorBuilder: (context, index) =>
            const SizedBox(height: 12),
            itemBuilder: (context, index) {


              final step = recipe.steps[index];

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${index + 1}. ${step.title}',
                    style:  TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.deepPurple.withOpacity(0.4)
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    step.description,
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              );

            }


        ),
      ),
    );
  }
}

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
                child:
                RecipeImage(
                  source: recipe.imageUrlOrPath,
                  width: double.infinity,
                  height: 130,
                  borderRadius: BorderRadius.circular(12),
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
