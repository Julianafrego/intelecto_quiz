import 'package:flutter/material.dart';
import 'package:intelecto_quiz/models/question.dart';

class QuestionCard extends StatelessWidget {
  final Question question;

  const QuestionCard({super.key, required this.question});

  @override
  Widget build(BuildContext context) {
    final answers = question.getShuffledAnswers(); // Respostas decodificadas e embaralhadas
    
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              question.question,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            
            ...answers.map((answer) => RadioListTile(
              title: Text(answer),
              groupValue: null,
              value: null,
              onChanged: null,
            )),
          ],
        ),
      ),
    );
  }
}