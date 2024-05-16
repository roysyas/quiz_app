import 'package:flutter/material.dart';
import 'package:quiz_app/ui/home/launcher.dart';
import 'package:quiz_app/ui/quiz/quiz.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/ui/quiz/quiz_result.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomepageState();
  }
}

class _HomepageState extends State<Homepage> {
  List<String> selectedAnswer = [];
  Widget? currentPage;

  void switchScreen() {
    setState(() {
      currentPage = QuizPage(
        onSelectAnswer: chooseAnswer,
      );
    });
  }

  void onRestart() {
    setState(() {
      selectedAnswer = [];
      currentPage = QuizPage(
        onSelectAnswer: chooseAnswer,
      );
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswer.add(answer);

    if (selectedAnswer.length == questions.length) {
      setState(() {
        currentPage = QuizResult(
          selectedAnswer: selectedAnswer,
          onRestart: onRestart,
        );
      });
    }
  }

  @override
  void initState() {
    currentPage = Launcher(switchScreen);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      home: Scaffold(
        backgroundColor: Colors.deepPurple,
        body: currentPage,
      ),
    );
  }
}
