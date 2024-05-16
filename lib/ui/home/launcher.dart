import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Launcher extends StatelessWidget {
  const Launcher(this.startQuiz, {super.key});
  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(80),
            child: Image.asset(
              'assets/images/quiz-logo.png',
              color: const Color.fromARGB(130, 255, 255, 255),
            ),
          ),
          Text(
            'Learn Flutter the fun way',
            style: GoogleFonts.lato(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: OutlinedButton.icon(
              onPressed: () {
                startQuiz();
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              label: const Text('Start Quiz'),
              icon: const Icon(Icons.arrow_right_alt),
            ),
          )
        ],
      ),
    );
  }
}
