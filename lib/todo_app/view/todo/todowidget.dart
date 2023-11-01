import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todos/utilities/Utils.dart';
import '../../provider_model/task_model.dart';
import '../../provider_model/todo_model.dart';
import 'edit_page.dart';

class TodoWidget extends StatelessWidget {
  final Task todo;
  const TodoWidget({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => editTodo(context, todo),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
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
                provider.toggleTodoStatus(context, todo);
                }),
            Expanded(child: Column(
              children: [
                Text(todo.title,style: Theme.of(context).textTheme.headline5),
                Text(todo.description,style: Theme.of(context).textTheme.subtitle1),
              ],
            )),
            Wrap(
              children: [
                TextButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.zero),
                  ),
                    onPressed:()=>editTodo(context,todo)
                    , child: const Text('Edit')),

                IconButton(onPressed: ()=>deleteTodo(context,todo),
                    icon: const Icon(Icons.delete_forever,color: Colors.red,)),
              ],
            )
          ],
        ),
      ),
    );
  }

  void deleteTodo(BuildContext context,Task todo){
    final provider = Provider.of<TodosProvider>(context,listen: false);
    provider.removeTask(todo);
    Utils.showSnackBar(context,'Deleted the task');
  }

  void editTodo(BuildContext context,Task todo){
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => EditPage(todo: todo))
    );
  }
}
