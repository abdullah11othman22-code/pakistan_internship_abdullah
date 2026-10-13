import 'package:flutter/material.dart';
import 'package:project1/screens/week5/data/mock_data.dart';

import '../models/model.dart';

class IngrediantCard extends StatelessWidget {
  const IngrediantCard({super.key, required this.recipe});
final Recipe recipe ;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
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
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: ListView.separated(

          separatorBuilder:(context, index) =>  SizedBox(height: 5,),
          itemCount: recipe.ingredients.length,
          itemBuilder: (context, index) =>

              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '${index + 1}. ',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple.withOpacity(0.4),
                      ),
                    ),
                    TextSpan(
                      text: recipe.ingredients[index],
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),

        ),
      ),
    );
  }
}
