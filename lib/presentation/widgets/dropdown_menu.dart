import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomDropdownMenu extends StatefulWidget{

  CustomDropdownMenu({required this.list}){
    itemSelected = list[0];
  }

  final List<String> list;
  late String itemSelected;

  @override
  State<CustomDropdownMenu> createState() => _CustomDropdownMenuState();
}

class _CustomDropdownMenuState extends State<CustomDropdownMenu> {
  @override
  Widget build(BuildContext context) {
    

    return DropdownButton(
            value: widget.itemSelected,
            items: widget.list.map((String category) {
              return DropdownMenuItem<String>(
                value: category,
                child: Text(category),
              );
            }).toList(), 
            onChanged: (String? value) {
              setState((){
                widget.itemSelected = value ?? "b";
              });
              
            });
  }
}