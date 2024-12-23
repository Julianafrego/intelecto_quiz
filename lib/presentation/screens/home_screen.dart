import 'package:flutter/material.dart';
import 'package:intelecto_quiz/presentation/widgets/home/category_selection.dart';
import 'package:intelecto_quiz/presentation/widgets/home/initial_button.dart';
import 'package:intelecto_quiz/providers/quote_provider.dart';
import 'package:provider/provider.dart';
import 'package:intelecto_quiz/presentation/widgets/home/quote.dart';

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
  void initState() {
    super.initState();
    Provider.of<QuoteProvider>(context, listen: false).fetchQuote();
  }

  @override
  Widget build(BuildContext context) {
    final quoteProvider = Provider.of<QuoteProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Intelecto Quiz')),
      
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Exibe a citação do dia
            if (quoteProvider.isLoading) CircularProgressIndicator(),
            if (quoteProvider.errorMessage != null)
              Text(quoteProvider.errorMessage!),
            if (quoteProvider.quote != null)
              Quote(
                text: quoteProvider.quote!.text,
                author: quoteProvider.quote!.author,
              ),

            const SizedBox(height: 90),

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
