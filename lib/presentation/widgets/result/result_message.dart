import 'package:flutter/material.dart';
import 'package:intelecto_quiz/core/system_colors.dart';

class ResultMessage extends StatelessWidget {
  final int score;
  final int totalQuestions;

  const ResultMessage({super.key, this.score = 0, this.totalQuestions = 0});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text('you got it right',  style: const TextStyle(
          color: SystemColors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),),
      Text(
        ' $score of $totalQuestions questions!',
        style: const TextStyle(
          color: SystemColors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    ]);
  }
}
