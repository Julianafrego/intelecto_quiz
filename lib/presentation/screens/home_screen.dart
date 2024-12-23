import 'package:flutter/material.dart';
import 'package:intelecto_quiz/presentation/widgets/home/category_selection.dart';
import 'package:intelecto_quiz/presentation/widgets/home/initial_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? selectedCategory;
  String? selectedDifficulty;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Quiz App')),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CategorySelection(
              onSelected: (String? category) {
                setState(() {
                  selectedCategory = category;
                });
              },
            ),
            const SizedBox(height: 20),
            InitialButton(
              selectedCategory: selectedCategory,
              selectedDifficulty: selectedDifficulty,
            ),
          ],
        ),
      ),
    );
  }
}
