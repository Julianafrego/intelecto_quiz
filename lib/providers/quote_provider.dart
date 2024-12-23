import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/quote.dart';

class QuoteProvider with ChangeNotifier {
  Quote? _quote;
  bool _isLoading = false;
  String? _errorMessage;

  Quote? get quote => _quote;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

 Future<void> fetchQuote() async {
  _isLoading = true;
  _errorMessage = null;
  notifyListeners();

  final url = Uri.parse('https://zenquotes.io/api/random');
  try {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);

      // Pega o primeiro item do array e transforma em um Quote
      if (data.isNotEmpty) {
        _quote = Quote.fromJson(data[0]);
      } else {
        _errorMessage = 'Nenhuma citação encontrada!';
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
