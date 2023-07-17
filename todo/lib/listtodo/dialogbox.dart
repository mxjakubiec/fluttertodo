import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  const DialogBox({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.blueGrey,
      content: Container(
        height: 150,
        child: Column(children: [
          //user input
          TextField(
            decoration: InputDecoration(enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 3, color: Colors.white))),
          ),

        ],),)

    );
  }
}