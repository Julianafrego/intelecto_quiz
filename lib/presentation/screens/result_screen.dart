import 'package:flutter/material.dart';
import 'package:intelecto_quiz/presentation/widgets/result/result_message.dart';
import 'package:intelecto_quiz/presentation/widgets/result/return_home_button.dart';

class ResultScreen extends StatelessWidget {
  final int score;
  final int totalQuestions;

  const ResultScreen({super.key, this.score = 0, this.totalQuestions = 0});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result'),
      ),
      body: Center( 
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ResultMessage(score: score, totalQuestions: totalQuestions),
            const SizedBox(height: 20), 
            const ReturnHomeButton(),
          ],
        ),
      ),
    );
  }
}
