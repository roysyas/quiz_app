import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/ui/customwidget/answer_button.dart';
import 'package:quiz_app/data/questions.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key, required this.onSelectAnswer});
  final void Function(String answer) onSelectAnswer;

  @override
  State<StatefulWidget> createState() {
    return _QuizPage();
  }
}

class _QuizPage extends State<QuizPage> {
  var currentIndexQuestion = 0;

  void answerQuestion(String answer) {
    widget.onSelectAnswer(answer);
    setState(() {
      currentIndexQuestion++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentIndexQuestion];

    return Center(
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
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
            ...currentQuestion.shuffled.map((item) {
              return AnswerButton(
                answerText: item,
                onTap: () {
                  answerQuestion(item);
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
