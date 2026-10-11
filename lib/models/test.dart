class TestModel {
  final String nameTest;
  final List<QuestionModel> questions;

  TestModel({
    required this.questions,
    required this.nameTest,
  });

  // 🟢 مجموع العلامات الكلي
  int getTotalMarks() {
    return questions.fold(0, (sum, q) => sum + q.mark);
  }
  int getCorrectAnswersCount() {
    int count = 0;

    for (var q in questions) {
      if (q.selectedAnswer?.isTrue == true) {
        count++;
      }
    }

    return count;
  }

  // 🟢 العلامات المحققة
  int getScore() {
    int score = 0;

    for (var q in questions) {
      if (q.selectedAnswer?.isTrue == true) {
        score += q.mark;
      }
    }

    return score;
  }

  // 🟢 النسبة المئوية
  double getPercentage() {
    final total = getTotalMarks();
    if (total == 0) return 0;

    return (getScore() / total) * 100;
  }

  // 🟢 مستوى النتيجة
  String getLevel() {
    final p = getPercentage();

    if (p >= 80) return "Excellent";
    if (p >= 50) return "Good";
    return "Bad";
  }

}class QuestionModel {
  final String question;
  final List<AnswerModel> answers;
  final int mark;

  AnswerModel? selectedAnswer;

  QuestionModel({
    required this.answers,
    required this.question,
    required this.mark,
    this.selectedAnswer,
  });

  // هل الجواب صحيح؟
  bool checkAnswer() {
    return selectedAnswer?.isTrue == true;
  }
}class AnswerModel {
  final String answer;
  final bool isTrue;

  AnswerModel({
    required this.answer,
    this.isTrue = false,
  });
}
