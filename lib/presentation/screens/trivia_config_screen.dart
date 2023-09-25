import 'package:flutter/material.dart';
import 'package:trivia/presentation/widgets/dropdown_menu.dart';


class Trivia_config_screen extends StatefulWidget{

  Trivia_config_screen({super.key});

  @override
  State<Trivia_config_screen> createState() => _Trivia_config_screenState();
}

class _Trivia_config_screenState extends State<Trivia_config_screen> {
  late List<String> categories = [""];
  late List<String> difficult;
  late List<String> types;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Trivia"),),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            const Text("Number of questions:"),
            Container(width: 50,
              child: TextField()),
      
            Text("Difficult"),  
            CustomDropdownMenu(list: categories),
      
            Text("Category:"),
            CustomDropdownMenu(list: categories),
      
            const Text("type of Trivia:"),
            CustomDropdownMenu(list: categories),
      
            ElevatedButton(onPressed: (){}, child: Text("Start Trivia"))
          ],),
        ),
      ),
    );
  }
}