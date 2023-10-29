import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todos/provider_model/task_model.dart';
import '../provider_model/todo_model.dart';
import 'Utils.dart';

class TodoWidget extends StatelessWidget {
  final Task todo;
  const TodoWidget({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.tealAccent,

      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Checkbox(
            activeColor: Colors.blueAccent,
              checkColor: Colors.white,
              value: todo.isDone,
              onChanged: (_){
              final provider = Provider.of<TodosProvider>(context,listen: false);
              final bool isDone = provider.toggleTodoStatus(todo);
              Utils.showSnackBar(context, isDone?'task completed':'task incomplete');
              }),
          Expanded(child: Column(
            children: [
              Text(todo.title,style: const TextStyle(color: Colors.black),),
              Text(todo.description),
            ],
          )),
          TextButton(
              onPressed:()=>deleteTodo(context,todo)
              , child: const Text('Delete'))
        ],
      ),
    );
  }
  void deleteTodo(BuildContext context,Task todo){
    final provider = Provider.of<TodosProvider>(context,listen: false);
    provider.removeTask(todo);
    Utils.showSnackBar(context,'Deleted the task');
  }
}
