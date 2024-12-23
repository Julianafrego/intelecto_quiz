import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intelecto_quiz/models/question.dart';
import 'package:intelecto_quiz/providers/quiz_provider.dart';
import 'package:intelecto_quiz/controllers/quiz_controller.dart';
import 'package:intelecto_quiz/presentation/widgets/quiz/question_card.dart';


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
  String? selectedAnswer;
  int score = 0;
  
  late QuizController quizController;

  @override
  void initState() {
     // tela carrega e logo busca-se as perguntas
    super.initState();
    quizController = QuizController(context, score);
    // busca as perguntas
    quizController.fetchQuestions(
      category: widget.category,
      difficulty: widget.difficulty,
    );
  }

  void updateQuestion(int index) {
    setState(() {
      currentQuestionIndex = index; //  aqui atualizamos para uma nova questao e 
    });
  }

  void resetAnswerState() {
    setState(() {
      hasAnswered = true; // Atualizamos a flag de resposta
      selectedAnswer = null; // Limpa a resposta selecionada
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
 final Question currentQuestion = quizProvider.questions[currentQuestionIndex];
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
      ),

      body: quizProvider.isLoading
          ? Center(child: CircularProgressIndicator()) // Loader enquanto busca dados
          : quizProvider.errorMessage != null
              ? Center(child: Text(quizProvider.errorMessage!)) // Mostra erro, se houver
              : ListView.builder( // Mostra as perguntas se tudo ocorrer bem
                  itemCount: quizProvider.questions.length, // Quantidade de perguntas
                  itemBuilder: (ctx, index) { // Cria cada card de pergunta, CTX=Contexto
                    return QuestionCard(question: quizProvider.questions[index]); 
                  },
                ),
    );
  }
}