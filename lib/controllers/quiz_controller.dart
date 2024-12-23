import 'package:flutter/material.dart';
import 'package:intelecto_quiz/providers/quiz_provider.dart';
import 'package:provider/provider.dart';
import 'package:intelecto_quiz/presentation/screens/result_screen.dart';
class QuizController {
  BuildContext context;
  int score;

  QuizController(this.context, this.score);

  void fetchQuestions({
    int amount = 20,
    String? category,
    String? difficulty,
  }) {
    Provider.of<QuizProvider>(context, listen: false).fetchQuestions(
      amount: amount,
      category: category,
      difficulty: difficulty,
    );
  }

  void goToNextQuestion({
    required int currentQuestion, // indice da questao atual
    required void Function(int)
        updateQuestion, // callback para atualizar a questao
    required void Function() resetAnswerState,
  }) {
    final quizProvider = Provider.of<QuizProvider>(context, listen: false);

    if (currentQuestion < quizProvider.questions.length - 1) {
      updateQuestion(currentQuestion + 1);
      resetAnswerState();
    } // se nao for a ultima questao, atualiza o indice da questao
    else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(
            score: score,
            totalQuestions: quizProvider.questions.length,
          ),
        ),
      );
    }
  }

  // Método para verificar e retornar o widget apropriado para o estado atual
  Widget checkQuizState() {
    final quizProvider = Provider.of<QuizProvider>(context);

    if (quizProvider.isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (quizProvider.errorMessage != null) {
      return Center(
        child: Text(quizProvider.errorMessage!),
      );
    }

    if (quizProvider.questions.isEmpty) {
      return const Center(
        child: Text("Nenhuma pergunta disponível."),
      );
    }
    return Container();
  }
}
