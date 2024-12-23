import 'package:flutter/material.dart';
import 'package:intelecto_quiz/core/system_colors.dart';

class CategorySelection extends StatefulWidget {
  final Function(String?) onSelected;

  const CategorySelection({Key? key, required this.onSelected})
      : super(key: key);

  @override
  _CategorySelectionState createState() => _CategorySelectionState();
}

class _CategorySelectionState extends State<CategorySelection> {
  String optionSelected = 'select category';

  final categories = const {
    '9': 'General Knowledge',
    '10': 'Books',
    '18': 'Science: Computers',
    '17': 'Science & Nature',
    '19': 'Science: Mathematics',
    '22': 'Geography',
    '23': 'History',
    '25': 'Art',
  };

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      iconDisabledColor: SystemColors.white,
      iconEnabledColor: SystemColors.white,
      style: const TextStyle(
        fontSize: 18,
        color: SystemColors.white,
      ),
      dropdownColor: SystemColors.blue3,
      hint: Text(
        optionSelected,
        style: const TextStyle(
          fontSize: 20,
          color: SystemColors.white,
        ),
      ),
      onChanged: (String? newValue) {
        setState(() {
          optionSelected = categories[newValue] ?? 'select category';
        });
        widget.onSelected(newValue);
      },
      items: categories.entries.map((entry) {
        return DropdownMenuItem<String>(
          value: entry.key,
          child: Text(entry.value),
        );
      }).toList(),
    );
  }
}
