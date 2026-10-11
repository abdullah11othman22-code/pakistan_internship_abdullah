import 'package:flutter/material.dart';
import 'package:project1/screens/week3/week3_task1/resault_screen.dart';
import 'package:project1/shared/widgets/custom_app_bar.dart';
import '../../../models/test.dart';
import '../../../shared/widgets/Wedgets/main_button.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key, required this.test});

  final TestModel test;

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;

  @override
  Widget build(BuildContext context) {
    final currentQuestion =
    widget.test.questions[currentQuestionIndex];

    final isLastQuestion =
        currentQuestionIndex ==
            widget.test.questions.length - 1;

    return PopScope(
      canPop:currentQuestionIndex == 0 ,
      onPopInvokedWithResult: (didPop, result) {
        

        if (currentQuestionIndex != 0){
          setState(() {
            currentQuestionIndex--;

            final previous =
            widget.test.questions[
            currentQuestionIndex];

            selectedAnswerIndex =
            previous.selectedAnswer == null
                ? null
                : previous.answers.indexOf(
              previous.selectedAnswer!,
            );
          });
        }

      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppbar(title: widget.test.nameTest),
      
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
      
            Text(
              "${currentQuestionIndex + 1}"
                  "/"
                  "${widget.test.questions.length}",
            ),
      
            const SizedBox(height: 12),
      
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: LinearProgressIndicator(
                  value: (currentQuestionIndex + (selectedAnswerIndex != null ? 1 : 0)) /
                      widget.test.questions.length,
                  minHeight: 24,
                  backgroundColor:
                  Colors.deepPurple.withOpacity(0.2),
                  valueColor: const AlwaysStoppedAnimation(
                    Colors.deepPurple,
                  ),
                ),
              ),
            ),
      
            const SizedBox(height: 12),
      
            Text(currentQuestion.question),
      
            ListView.separated(
              shrinkWrap: true,
              itemCount: currentQuestion.answers.length,
              separatorBuilder: (_, __) =>
              const SizedBox(height: 0),
              itemBuilder: (context, index) {
                final answer = currentQuestion.answers[index];
      
                final isSelected = selectedAnswerIndex == index;
      
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 10,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedAnswerIndex = index;
                        currentQuestion.selectedAnswer = answer;
                      });
                    },
                    child:
                    Container(
      
                      height: 65,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        
                        border: Border.all(
                          color: Colors.deepPurple,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          SizedBox(width: 10,),
                          Icon(
                            isSelected
                                ? Icons.radio_button_checked
                                : Icons.radio_button_off,
                            color: Colors.deepPurple,
                          ),
                          const SizedBox(width: 16),
                          Text(answer.answer),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
      
            const SizedBox(height: 20),
      
            MainButton(
              title: isLastQuestion ? "Finish" : "Next",
              color: Colors.deepPurple,
              onTap: () {
                if (selectedAnswerIndex == null) return;
      
                if (!isLastQuestion) {setState(() {
                  currentQuestionIndex++;

                  final nextQuestion =
                  widget.test.questions[currentQuestionIndex];

                  selectedAnswerIndex =
                  nextQuestion.selectedAnswer == null
                      ? null
                      : nextQuestion.answers.indexOf(
                    nextQuestion.selectedAnswer!,
                  );
                });
                } else {
                  print(widget.test.getScore());
      
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ResaultScreen(
                        test: widget.test,
                      ),
                    ),
                  );
                }
              },
            ),
      

      
          ],
        ),
      ),
    );
  }


}