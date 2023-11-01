
import 'package:flutter/cupertino.dart';
import 'package:todos/todo_app/provider_model/task_model.dart';

import 'package:todos/utilities/Utils.dart';

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
        title: 'fish',
      createdTime: DateTime.now(),
    ),
     Task(
         title: 'bird',
         createdTime: DateTime.now(),
     )
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

   void editTask(Task task, String title, String description,){
     task.title=title;
     task.description=description;

     notifyListeners();
   }

   void toggleTodoStatus(BuildContext context,Task task){
     task.isDone=!task.isDone;
     notifyListeners();
     Utils.showSnackBar(context, task.isDone?'task completed':'task incomplete');

   }
}