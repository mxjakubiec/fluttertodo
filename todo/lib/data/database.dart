import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase{
  List toDoList = [];


  //reference box
  final _myBox = Hive.box('mybox');

  //first time ever open this app, defult task for user
  void createInitialData() {
    toDoList = [
      ["Fitness Lessons",false],
      ["Go for a run", false],
     
    ];
  }

  //load the data from DB
  void loadData() {
    toDoList = _myBox.get("TODOLIST");
  }

  //update the database
  void updateData () {
    _myBox.put("TODOLIST", toDoList);

  }
}