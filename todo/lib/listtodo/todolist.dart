import 'package:flutter/material.dart';

class ToDolist extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;

  ToDolist({super.key, required this.onChanged, required this.taskCompleted, required this.taskName,});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(left:25.0, right: 25, top: 25),
      child: Container(
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.circular(9)
        ),
        child: Row(
          children: [

            //CHECKBOX
            Checkbox(value: taskCompleted, onChanged: onChanged, activeColor: Colors.green,),


            //TASK NAME
            Text(taskName,
            style: TextStyle(decoration: taskCompleted?  TextDecoration.lineThrough : TextDecoration.none, color: Colors.white),
             ),
          ],
        ),
      ),
    );
  }
}