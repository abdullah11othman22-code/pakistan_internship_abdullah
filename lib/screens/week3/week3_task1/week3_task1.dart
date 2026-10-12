import 'package:flutter/material.dart';
import 'package:project1/models/test.dart';
import 'package:project1/screens/week3/week3_task1/quiz_screen.dart';

import '../../../shared/widgets/Wedgets/week_card.dart';

class Week3Task1 extends StatelessWidget {
  const Week3Task1({super.key, required this.tests});

  final List<TestModel> tests;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GridView.builder(
          itemCount: tests.length,
          gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 5,childAspectRatio: 1,mainAxisExtent: 150


          ),
          itemBuilder: (context, index) =>
              GestureDetector(
                onTap:() {Navigator.push(context,MaterialPageRoute(builder: (_){
                  return QuizScreen(test: tests[index],);
                }));},
                  child: MainCard(title: tests[index].nameTest)),
        ),
      ),
    );
  }
}
