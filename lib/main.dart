import 'package:flutter/material.dart';
import 'package:trivia/presentation/screens/trivia_config_screen.dart';

void main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TriviaConfigScreen(),
    );
  } 
}