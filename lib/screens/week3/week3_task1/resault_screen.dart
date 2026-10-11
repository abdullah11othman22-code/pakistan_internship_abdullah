import 'package:flutter/material.dart';
import 'package:project1/shared/widgets/custom_app_bar.dart';
import '../../../models/test.dart';
import '../../../shared/widgets/Wedgets/main_button.dart';
import 'answer_view.dart';

class ResaultScreen extends StatelessWidget {
  const ResaultScreen({super.key, required this.test});

  final TestModel test;

  @override
  Widget build(BuildContext context) {
    final totalQuestions = test.questions.length;
    final correctAnswers = test.getScore(); // إذا بيرجع عدد الصحيح

    return Scaffold(
      appBar: CustomAppbar(title: 'Result'),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // 🔴 Badge (bad / good / excellent)
            Container(
              height: 40,
              width: 120,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: getResultColor()),
                  left: BorderSide(color: getResultColor()),
                  right: BorderSide(color: getResultColor()),
                  bottom: BorderSide.none,
                ),                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Center(
                child: Text(
                  test.getLevel(),
                  style:  TextStyle(
                    color: getResultColor(),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            // 📦 Box info
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(12),
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: getResultColor()),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 10),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total Mark '),
                      Text(test.getScore().toString()),
                      //here just correct Answer
                    ],
                  ),

                  const SizedBox(height: 10),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Total Questions:'),
                      Text(test.questions.length.toString()),
                    ],
                  ),                  const SizedBox(height: 10),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Currect Answer: '),
                      Text(test.getCorrectAnswersCount().toString()),
                      //here just correct Answer
                    ],
                  ),

                ],
              ),
            ),
            SizedBox(height: 150,),
            MainButton(onTap: (){

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => AnswerView(
                    test: test,
                  ),
                ),
              );
            }, title: 'Show Answer')
          ],
        ),
      ),
    );
  }
  Color getResultColor() {
    final level = test.getLevel();

    switch (level) {
      case "Excellent":
        return Colors.green;

      case "Good":
        return Colors.orange;

      default:
        return Colors.red;
    }
  }
}
