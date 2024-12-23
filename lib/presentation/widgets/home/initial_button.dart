import 'package:flutter/material.dart';
import 'package:intelecto_quiz/presentation/screens/quiz_screen.dart';
import 'package:intelecto_quiz/core/system_colors.dart';

class InitialButton extends StatelessWidget {
  final String? selectedCategory;
  final String? selectedDifficulty;

  const InitialButton({super.key, this.selectedCategory, this.selectedDifficulty});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 70, vertical: 16)),
                backgroundColor: MaterialStateProperty.all(SystemColors.rose1),
              ),
              onPressed: () {
                // Navega para a tela de quiz com as seleções do usuário
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuizScreen(
                      category: selectedCategory,
                      difficulty: selectedDifficulty,
                    ),
                  ),
                );
              },
              child: const Text('Iniciar Quiz', style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: SystemColors.white,
              ),),
            );
  }
}