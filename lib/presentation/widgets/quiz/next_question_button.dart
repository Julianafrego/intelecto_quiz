import 'package:flutter/material.dart';
import 'package:intelecto_quiz/controllers/quiz_controller.dart';
import 'package:intelecto_quiz/core/system_colors.dart';

class NextQuestionButton extends StatelessWidget {
  final QuizController quizController;
  final void Function(int) updateQuestion; // Aceita um índice como argumento
  final int index;
  final void Function() resetAnswerState; // Deve ser do tipo void Function()

  const NextQuestionButton({
    super.key,
    required this.quizController,
    required this.updateQuestion,
    required this.index,
    required this.resetAnswerState,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 70, vertical: 10)),
        backgroundColor: MaterialStateProperty.all(SystemColors.blue1),
      ),
      onPressed: () {
        quizController.goToNextQuestion(
          currentQuestion: index,
          updateQuestion: (newIndex) => updateQuestion(newIndex), // Passa a função corretamente
          resetAnswerState: resetAnswerState, // Passa a referência da função
        );
      },
      child: const Text(
        "Next Question",
        style: TextStyle(
          color: SystemColors.white,
          fontSize: 20,
        ),
      ),
    );
  }
}
