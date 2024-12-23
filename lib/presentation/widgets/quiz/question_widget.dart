import 'package:flutter/material.dart';
import 'package:intelecto_quiz/models/question.dart';

class QuestionWidget extends StatefulWidget {
  final int currentQuestionIndex;
  final Question currentQuestion;
  final bool hasAnswered;
  final String? selectedAnswer;
  final Function(String) onAnswerSelected;
  final int score;

  const QuestionWidget({
    super.key,
    required this.currentQuestionIndex,
    required this.currentQuestion,
    required this.hasAnswered,
    required this.selectedAnswer,
    required this.onAnswerSelected,
    required this.score,
    });

  @override
  State<QuestionWidget> createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
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
        Column(
            children: [
              ...widget.currentQuestion.getShuffledAnswers().map((answer) {
                return RadioListTile(
                  title: Text(answer),
                  value: answer,
                  groupValue: widget.selectedAnswer,
                  onChanged: (value) {
                    widget.onAnswerSelected(value.toString());
                  },
                );
              }).toList(),
            ],
        ),
      ],
    );
  }
}