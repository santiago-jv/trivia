import 'package:flutter/material.dart';
import 'package:trivia/presentation/widgets/dropdown_menu.dart';

class TriviaConfigScreen extends StatefulWidget {
  TriviaConfigScreen({super.key});

  @override
  State<TriviaConfigScreen> createState() => _TriviaConfigScreenState();
}

class _TriviaConfigScreenState extends State<TriviaConfigScreen> {
  late List<String> categories = [""];
  late List<String> difficult;
  late List<String> types;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Trivia"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Number of questions:"),
              const SizedBox(width: 50, child: TextField()),
              const Text("Difficult"),
              CustomDropdownMenu(list: categories),
              const Text("Category:"),
              CustomDropdownMenu(list: categories),
              const Text("type of Trivia:"),
              CustomDropdownMenu(list: categories),
              ElevatedButton(onPressed: () {}, child: const Text("Start Trivia"))
            ],
          ),
        ),
      ),
    );
  }
}
