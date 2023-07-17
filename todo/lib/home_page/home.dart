import 'package:flutter/material.dart';
import 'package:todo/listtodo/dialogbox.dart';
import '../listtodo/todolist.dart';

class HomePage extends StatefulWidget {
   const HomePage ({super.key});

  @override 
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //list
  List toDoList = [
  ["Silownia", false],
  ["Posprzatac", false],
  ];

  //Check box was clicted
  void checkBoxChanged(bool? value,int index){
    setState(() {
       toDoList[index][1] = !toDoList[index][1];
    });
   

  }

  // new task add
  void newTaskAdd(){
    showDialog(context: context, builder: (context){
      return DialogBox();

    },);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        centerTitle: true,
        title: Text('TO DO'),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(onPressed: newTaskAdd,child: Icon(Icons.add),),
      body: ListView.builder( 
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return ToDolist(onChanged:(value) => checkBoxChanged(value, index) , taskCompleted: toDoList[index][1], taskName: toDoList[index][0]);
        }, 
       ),

    );
  }
}