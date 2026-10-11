import 'package:flutter/material.dart';
import 'package:project1/models/test.dart';
import 'package:project1/shared/widgets/custom_app_bar.dart';

import '../../../shared/widgets/Wedgets/main_button.dart';

class AnswerView extends StatelessWidget {
  const AnswerView({super.key, required this.test});

  final TestModel test;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppbar(title: 'Answer View'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsetsGeometry.all(24),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                border: BoxBorder.all(color: Colors.deepPurple)
              ),
              height: 500,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  width: double.infinity,
                  height: 700,
                  child: ListView.separated(
                    shrinkWrap: true,
                    separatorBuilder: (context, index) => Divider(
                      height: 2,
                      color: Colors.deepPurple,
                      thickness: 2.0,
                    ),
                    itemCount: test.questions.length,
                    itemBuilder: (context, index) {
                      final question = test.questions[index];
            
                      return Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
            
                            Text(
                              question.question,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
            
                            const SizedBox(height: 10),
            
                            ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: question.answers.length,
                              separatorBuilder: (_, __) => const SizedBox(height: 10),
            
                              itemBuilder: (context, i) {
                                final answer = question.answers[i];
            
                                final isSelected = question.selectedAnswer == answer;
                                final isCorrect = answer.isTrue;
            
                                Color borderColor;
                                Color? bgColor;
            
                                if (isCorrect) {
                                  borderColor = Colors.green;
                                  bgColor = Colors.green.withOpacity(0.15);
                                } else if (isSelected && !isCorrect) {
                                  borderColor = Colors.red;
                                  bgColor = Colors.red.withOpacity(0.15);
                                } else {
                                  borderColor = Colors.deepPurple;
                                  bgColor = null;
                                }
            
                                return Container(
                                  height: 65,
                                  padding: const EdgeInsets.symmetric(horizontal: 12),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: borderColor),
                                    borderRadius: BorderRadius.circular(12),
                                    color: bgColor,
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        isCorrect
                                            ? Icons.check_circle
                                            : isSelected
                                            ? Icons.cancel
                                            : Icons.radio_button_off,
                                        color: borderColor,
                                      ),
            
                                      const SizedBox(width: 10),
            
                                      Expanded(child: Text(answer.answer)),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      );
                    },              ),
                ),
              ),
            ),
          ),
          SizedBox(height:20 ,),
          MainButton(onTap: (){
            Navigator.pop(context);
            
          }, title: "Back To Quizzes")

        ],
      ),
    );
  }
}
