import 'package:flutter/material.dart';
import 'package:intelecto_quiz/models/question.dart';
import 'package:intelecto_quiz/presentation/widgets/quiz/answer_card.dart';

class QuestionCard extends StatefulWidget {
  final int currentQuestionIndex;
  final Question currentQuestion;
  final bool hasAnswered;
  final String? selectedAnswer;
  final Function(String) onAnswerSelected;
  final int score;
  final List<String> shuffledAnswers;

  const QuestionCard({
    super.key,
    required this.currentQuestionIndex,
    required this.currentQuestion,
    required this.hasAnswered,
    required this.selectedAnswer,
    required this.onAnswerSelected,
    required this.score,
    required this.shuffledAnswers,
  });

  @override
  State<QuestionCard> createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {

  
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Question ${widget.currentQuestionIndex + 1}.',
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          widget.currentQuestion.question,
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 16),
        Column(children: [
          ...widget.shuffledAnswers.map((answer) {
            // Verifica se a resposta está selecionada e se correta
            bool isCorrectAnswer =
                answer == widget.currentQuestion.correctAnswer;
            bool isSelectedAnswer = answer == widget.selectedAnswer;


            // inkwell = widget que detecta toques e gestos
           return AnswerCard(
                answer: answer,
                isSelectedAnswer: isSelectedAnswer,
                isCorrectAnswer: isCorrectAnswer,
                hasAnswered: widget.hasAnswered,
                onTap: () => widget.onAnswerSelected(answer), // Passa a função de seleção
              );
            }).toList(),
        ]),
      ],
    );
  }
}
