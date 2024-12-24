import 'package:flutter/material.dart';
import 'package:intelecto_quiz/core/system_colors.dart';

class AnswerCard extends StatelessWidget {
  final String answer;
  final bool isSelectedAnswer;
  final bool isCorrectAnswer;
  final bool hasAnswered;
  final Function() onTap;

  const AnswerCard({
    Key? key,
    required this.answer,
    required this.isSelectedAnswer,
    required this.isCorrectAnswer,
    required this.hasAnswered,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Definir cor do card
    Color cardColor;

    if (hasAnswered) {
      if (isSelectedAnswer && isCorrectAnswer) {
        cardColor = SystemColors.green;
      } else if (isCorrectAnswer) {
        cardColor = SystemColors.green2;
      } else {
        cardColor = SystemColors.rose0;
      }
    } else {
      cardColor = SystemColors.rose0;
    }

    // Definir cor do texto
    Color textColor;
    if (hasAnswered) {
      textColor = (isCorrectAnswer) ? SystemColors.white : SystemColors.black;
    } else {
      textColor = SystemColors.black;
    }

    double widthScreen = MediaQuery.of(context).size.width;
    double width = widthScreen * 0.9;
    return InkWell(
      onTap: hasAnswered ? null : onTap,
      child: Card(
        color: cardColor,
        child: Container(
          width: (width),
          padding: const EdgeInsets.all(16),
          child: Text(
            answer,
            style: TextStyle(
              fontSize: 18,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
