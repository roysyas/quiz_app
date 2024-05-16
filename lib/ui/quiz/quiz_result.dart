import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/ui/quiz/quiz_summary.dart';

class QuizResult extends StatelessWidget {
  const QuizResult({
    super.key,
    required this.selectedAnswer,
    required this.onRestart,
  });
  final List<String> selectedAnswer;
  final void Function() onRestart;

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < selectedAnswer.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answers[0],
          'user_answer': selectedAnswer[i],
        },
      );
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final numTotalQuestion = questions.length;
    final numCorrectAnswer = summaryData
        .where((data) => data['user_answer'] == data['correct_answer'])
        .length;

    return Center(
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'You answered $numCorrectAnswer out of $numTotalQuestion questions correctly!',
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            QuizSummary(summaryData: summaryData),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
              onPressed: onRestart,
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              icon: const Icon(Icons.refresh),
              label: const Text('Refresh Data'),
            ),
          ],
        ),
      ),
    );
  }
}
