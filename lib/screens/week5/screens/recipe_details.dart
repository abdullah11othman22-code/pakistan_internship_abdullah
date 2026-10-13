import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:project1/screens/week5/data/mock_data.dart';
import 'package:project1/screens/week5/models/model.dart';

import '../wedgit/ingrediant_card.dart';
import '../wedgit/steps_card.dart';

class RecipeDetails extends StatelessWidget {
  const RecipeDetails({super.key, required this.recipe});

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: 250,
                width: double.infinity,
                child: Image.network(recipe.imageUrlOrPath, fit: BoxFit.cover),
              ),
              const Expanded(child: SizedBox()),
            ],
          ),

          Positioned(
            top: 228,
            // تداخل بمقدار 30 بكسل
            bottom: 0,
            left: 0,
            right: 0,
            child:
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.deepPurple.withValues(alpha: 1),
                    blurRadius: 12,
                    spreadRadius: 2,
                    offset: const Offset(10, 10),
                  ),
                ],
              ),
              child:
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18,),
      child: Column(

        mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),


                    Container(
                      height: 40,
                      width: 115,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          left: BorderSide(
                            color: Colors.deepPurple.withValues(alpha: 0.4), width: 2
                          ),
                          right: BorderSide(
                            color: Colors.deepPurple.withValues(alpha: 0.4), width: 2
                          ),
                          top: BorderSide(
                            color: Colors.deepPurple.withValues(alpha: 0.4),
                            width: 2.5
                          ),
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(18),
                          topRight: Radius.circular(18),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.deepPurple.withValues(alpha: 0.12),
                            blurRadius: 8,
                            spreadRadius: 0,
                            offset: const Offset(0, -2),
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Text(
                          "Ingredient",
                          style: TextStyle(
                            color: Colors.deepPurple,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 2),
                    IngrediantCard(recipe: recipe,),
                    SizedBox(height: 8,),
                    Container(
                      height: 40,
                      width: 115,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          left: BorderSide(
                              color: Colors.deepPurple.withValues(alpha: 0.4), width: 2
                          ),
                          right: BorderSide(
                              color: Colors.deepPurple.withValues(alpha: 0.4), width: 2
                          ),
                          top: BorderSide(
                              color: Colors.deepPurple.withValues(alpha: 0.4),
                              width: 2.5
                          ),
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(18),
                          topRight: Radius.circular(18),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.deepPurple.withValues(alpha: 0.12),
                            blurRadius: 8,
                            spreadRadius: 0,
                            offset: const Offset(0, -2),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text("Steps",style: TextStyle(
                          color: Colors.deepPurple,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,

                        ),),
                      ),
                    ), SizedBox(height: 2),
                    StepsCard(recipe: recipe,)
                  ],
                ),
    ),
            ),
          ),
        ],
      ),
    );
  }
}
