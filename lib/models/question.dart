import 'dart:convert';
import 'package:html/parser.dart' show parse;

class Question {
  final String category;
  final String type;
  final String difficulty;
  final String question;
  final String correctAnswer;
  final List<String> incorrectAnswers;

  Question({
    required this.category,
    required this.type,
    required this.difficulty,
    required this.question,
    required this.correctAnswer,
    required this.incorrectAnswers,
  });

  // função para processar o json retornado
  // alguns campos estao codificados, precisam ser decodificandos
  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      category: parse(json['category']).documentElement!.text,
      type: json['type'],
      difficulty: json['difficulty'],
      question: parse(json['question']).documentElement!.text,
      correctAnswer: parse(json['correct_answer']).documentElement!.text,
      incorrectAnswers: (json['incorrect_answers'] as List)
          .map((answer) => parse(answer).documentElement!.text)
          .toList(),
    );
  }

  // função para embaralhar as respostas
  List<String> getShuffledAnswers() {
    final answers = [correctAnswer, ...incorrectAnswers];
    answers.shuffle();
    return answers;
  }
}