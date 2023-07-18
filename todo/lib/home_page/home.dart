import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/data/database.dart';
import 'package:todo/listtodo/dialogbox.dart';
import '../listtodo/todolist.dart';

class HomePage extends StatefulWidget {
   const HomePage ({super.key});
   

  @override 
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //reference the box
  final _myBox = Hive.box('mybox');
  ToDoDataBase db = ToDoDataBase();

  @override
  void initState() {

    //first time ever open the app, them create defult data
    if(_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    }else{
      // next time open
      db.loadData();
    }

    super.initState();
  }

  //text controller
  final  _controller = TextEditingController();


  //Check box was clicted
  void checkBoxChanged(bool? value,int index){
    setState(() {
       db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateData();
  }

  // save new task
  void saveNewTask() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateData();
  }

  // new task add
  void newTaskAdd(){
    showDialog(context: context, builder: (context){
     return DialogBox(controller: _controller,
     onSave: saveNewTask, onCancel: () => Navigator.of(context).pop(),);

    },);
  }
  // delete task
  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateData(); 

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
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return ToDolist(onChanged:(value) => checkBoxChanged(value, index) , taskCompleted: db.toDoList[index][1], taskName: db.toDoList[index][0], deleteFunction: (context) => deleteTask(index),);
        }, 
       ),

    );
  }
}