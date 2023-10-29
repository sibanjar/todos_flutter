import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todos/view/todowidget.dart';
import 'package:todos/provider_model/todo_model.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TodosProvider>(context);
    final tasks =taskProvider.tasks;
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(8),
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(height: 8);
        },
        itemCount: tasks.length,
        itemBuilder: (context,index){
          final todo= tasks[index];
          return TodoWidget(todo: todo);
      },
    );
  }
}
