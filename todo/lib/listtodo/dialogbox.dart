import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:todo/listtodo/button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;



  DialogBox({super.key, required this.controller,  required this.onCancel, required this.onSave, });


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.blueGrey,
      content: Container(
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          //user input
          TextField(
             controller: controller,
            decoration: InputDecoration(enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 3, color: Colors.white)),
            hintText: "Add a new task", hintStyle: TextStyle(color: Colors.white)),
          ),

          //Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //save button
              MyButton(onPressed: onSave, text: "Save"),

              const SizedBox(width: 8),


              //cancel button
              MyButton(onPressed: onCancel, text: "Cancel"),
            ],
          )

        ],),)

    );
  }
}