import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todos/todo_app/view/todo/todowidget.dart';

import '../../provider_model/todo_model.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TodosProvider>(
      builder: (BuildContext context, taskProvider, Widget? child) {
        final tasks = taskProvider.tasks;
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
      },

    );
  }
}
