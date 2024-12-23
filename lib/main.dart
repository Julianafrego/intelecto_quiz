import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intelecto_quiz/providers/quiz_provider.dart';
import 'package:intelecto_quiz/presentation/screens/home_screen.dart';
import 'package:intelecto_quiz/core/app_theme.dart';
import 'package:intelecto_quiz/providers/quote_provider.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => QuizProvider()),
        ChangeNotifierProvider(create: (_) => QuoteProvider()),
      ],
      child: MaterialApp(
        title: 'Intelecto Quiz',
        theme: AppTheme.theme,
        home: const HomeScreen(),
      ),
    );
  }
}
