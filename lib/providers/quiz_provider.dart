import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intelecto_quiz/models/question.dart';

class QuizProvider with ChangeNotifier {
  List<Question> _questions = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<Question> get questions => _questions; 
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  // Função para buscar as questões da API
  Future<void> fetchQuestions({
    int amount = 20,  
    String? category,
    String? difficulty,}) 
    async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    // Construcao dinamica da URL
    String baseUrl = 'https://opentdb.com/api.php?amount=$amount';
    if (category?.isNotEmpty ?? false) {
      baseUrl += '&category=$category';
    }
    if (difficulty?.isNotEmpty ?? false) {
      baseUrl += '&difficulty=$difficulty';
    }

    final url = Uri.parse(baseUrl);
    // // /// 
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body); // Converte o JSON para Map

        if (data['response_code'] == 0) { // Verifica se a resposta foi bem sucedida

          // Converte o json resultado para o modelo Question
          _questions = (data['results'] as List).map((result) => Question.fromJson(result)).toList(); // 
        } else {
          _errorMessage = 'Não foi possível obter as questões!';
        }
      } else {
        _errorMessage = 'Erro ao conectar à API!';
      }
    } catch (error) {
      _errorMessage = 'Erro de conexão: $error';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}