import 'package:flutter/material.dart';

class Quote extends StatelessWidget {

  final String author;
  final String text;

  const Quote({super.key, required this.author, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          author,
          style: const TextStyle(
            fontSize: 14,
          ),
        ),
      ],
    ));
  }
}