import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intelecto_quiz/models/question.dart';
import 'package:intelecto_quiz/providers/quiz_provider.dart';
import 'package:intelecto_quiz/controllers/quiz_controller.dart';
import 'package:intelecto_quiz/presentation/widgets/quiz/question_card.dart';
import 'package:intelecto_quiz/presentation/widgets/quiz/next_question_button.dart';

// para quizscreen deseja-se que
//1. se exiba uma questao por vez
//1.2 para isso add indicie para rastreio de questao

//2. se exiba as respostas embaralhadas
//3. se exiba um loader enquanto as perguntas carregam
//4. se exiba uma mensagem de erro se algo der errado
//5. se exiba os botoes para cada alternativa da questao
//6. se exiba a resposta certa ao final da questao
//7. se exiba o resultado final ao final do quiz

class QuizScreen extends StatefulWidget {
  final String? category;
  final String? difficulty;

  const QuizScreen({super.key, this.category, this.difficulty});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestionIndex = 0;
  bool hasAnswered = false;
  String? selectedAnswer; // resposta selecionada
  int score = 0;
  List<String> shuffledAnswers = []; // respostas embaralhadas

  late QuizController quizController;

  @override
  void initState() {
    // tela carrega e logo busca-se as perguntas
    super.initState();
    quizController = QuizController(context, score);
    score = 0;
    // busca as perguntas
    WidgetsBinding.instance.addPostFrameCallback((_) {
      quizController.fetchQuestions(
        category: widget.category,
        difficulty: widget.difficulty,
      );
    });
  }

  void updateQuestion(int index) {
    setState(() {
      currentQuestionIndex = index; //  aqui atualizamos para uma nova questao e
      hasAnswered = false; // marcamos como nao respondida
      selectedAnswer = null; // limpa a resposta selecionada
      shuffledAnswers = Provider.of<QuizProvider>(context, listen: false).questions[index].getShuffledAnswers();
    });
  }

  void resetAnswerState() {
    setState(() {
      hasAnswered = true; // Atualizamos a flag de resposta
      selectedAnswer = null; // Limpa a resposta selecionada
    });
  }

  void onAnswerSelected(String answer) {
    setState(() {
      selectedAnswer = answer; // Marca a resposta selecionada
      hasAnswered = true; // Marca como respondida
      if (answer == Provider.of<QuizProvider>(context, listen: false).questions[currentQuestionIndex].correctAnswer) {
             quizController.updateScore(); // Atualiza o score no QuizController
          // Incrementa a pontuação se a resposta estiver correta
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final quizProvider = Provider.of<QuizProvider>(context);

    // Verifica o estado do quiz e retorna o widget apropriado
    Widget stateWidget = quizController.checkQuizState();
    if (stateWidget is! Container) {
      return stateWidget;
    }

// abaixo, a questao atual é obtida
    final Question currentQuestion =
        quizProvider.questions[currentQuestionIndex];

    // para 1° questao, embaralha
    if (shuffledAnswers.isEmpty) {
      shuffledAnswers = currentQuestion.getShuffledAnswers();
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('Intelecto Quiz'),
        ),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Usa o QuestionWidget para exibir a pergunta e as alternativas
                  QuestionCard(
                    currentQuestionIndex: currentQuestionIndex,
                    currentQuestion: currentQuestion,
                    hasAnswered: hasAnswered,
                    selectedAnswer: selectedAnswer,
                    onAnswerSelected: onAnswerSelected,
                    score: score,
                    shuffledAnswers:
                        shuffledAnswers, // Passa as respostas embaralhadas
                  ),
                  const SizedBox(height: 20),

                  if (hasAnswered)
                    NextQuestionButton(
                      quizController: quizController,
                      updateQuestion: updateQuestion,
                      index: currentQuestionIndex,
                      resetAnswerState: resetAnswerState,
                    ),
                ])));
  }
}
