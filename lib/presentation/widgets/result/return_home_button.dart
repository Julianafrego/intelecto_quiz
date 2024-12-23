import 'package:flutter/material.dart';
import 'package:intelecto_quiz/core/system_colors.dart';  
import 'package:intelecto_quiz/presentation/screens/home_screen.dart';

class ReturnHomeButton extends StatelessWidget {
  const ReturnHomeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 70, vertical: 10)),
        backgroundColor: MaterialStateProperty.all(SystemColors.blue1),
      ),
      onPressed: () {
        // Navega para a tela inicial
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
      },
      child: const Text(
        'Back to Home',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: SystemColors.white,
        ),
      ),
    );
  }
}
