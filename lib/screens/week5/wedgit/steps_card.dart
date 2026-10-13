import 'package:flutter/material.dart';
import 'package:project1/screens/week5/data/mock_data.dart';

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
