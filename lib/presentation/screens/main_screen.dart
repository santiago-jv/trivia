import 'package:flutter/material.dart';

class Main_Screen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title: Text("Trivia"),),
      body: Center(child: ElevatedButton(onPressed: (){}, child: Text("New Trivia")))
    );
  }

}