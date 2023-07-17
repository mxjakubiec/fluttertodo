import 'package:flutter/material.dart';

class ToDolist extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;

  ToDolist({super.key, required this.onChanged, required this.taskCompleted, required this.taskName,});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(25.0),
      child: Container(
        padding: EdgeInsets.all(24),
        child: Row(
          children: [

            //CHECKBOX
            Checkbox(value: taskCompleted, onChanged: onChanged),


            //TASK NAME
            Text(taskName),
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.circular(9)
        ),
      ),
    );
  }
}