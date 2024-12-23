import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intelecto_quiz/providers/quiz_provider.dart';
import 'package:intelecto_quiz/presentation/screens/home_screen.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => QuizProvider()),
      ],
      child: MaterialApp(
        title: 'Quiz App',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: HomeScreen(),
      ),
    );
  }
}