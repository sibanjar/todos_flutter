
import 'package:flutter/cupertino.dart';
import 'package:todos/provider_model/task_model.dart';

class TodosProvider extends ChangeNotifier{
   final List<Task> _tasks=[
     Task(
         title: 'dog',
         createdTime: DateTime.now()
     ),
     Task(
         title: 'cat',
         createdTime: DateTime.now(),
       description: 'This is cat description'
     ),
     Task(
         title: 'tigeer',
         createdTime: DateTime.now()
     ),
     Task(
         title: 'lion',
         createdTime: DateTime.now()
     ),
   ];

   List<Task> get tasks=> _tasks.where((task) => task.isDone==false).toList();
   List<Task> get tasksCompleted=> _tasks.where((task) => task.isDone==true).toList();
   void addTask(Task task){
   _tasks.add(task);
   notifyListeners();
   }

   void removeTask(Task task){
     _tasks.remove(task);

     notifyListeners();
   }
   bool toggleTodoStatus(Task task){
     task.isDone=!task.isDone;
     notifyListeners();
     return task.isDone;
   }
}