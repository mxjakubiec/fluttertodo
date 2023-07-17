import 'package:flutter/material.dart';
import '../listtodo/todolist.dart';

class HomePage extends StatefulWidget {
   const HomePage ({super.key});

  @override 
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        title: Text('TO DO'),
        elevation: 0,
      ),
      body: ListView(
        children: [
        ToDolist(
          taskName: "xxx",
          taskCompleted: true,
          onChanged: (p0) {},
        ),
         ToDolist(
          taskName: "xxx",
          taskCompleted: false,
          onChanged: (p0) {},
        ),
        
        ]
       ),

    );
  }
}