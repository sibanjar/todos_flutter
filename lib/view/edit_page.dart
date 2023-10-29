import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todos/provider_model/task_model.dart';
import 'package:todos/view/todoformwidget.dart';
import 'package:todos/provider_model/todo_model.dart';


class EditPage extends StatefulWidget {
  final Task todo;
  const EditPage({super.key, required this.todo});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final _formKey=GlobalKey<FormState>();

    late String title;
    late String description;

  @override
  void initState() {
    title = widget.todo.title;
    description = widget.todo.description;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit this task'),),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Form(
            key: _formKey,
            child: TodoFormWidget(
                title: title,
                description: description,
                onChangedTitle: (title)=>setState(()=>this.title=title),
                onChangedDescription: (description)=>setState(()=>this.description=description),
                onSavedTodo: saveTodo,
            ),
          ),
        ),
      ),
    );
  }
  void saveTodo(){
    final isValid = _formKey.currentState?.validate();
    if (!isValid!) {
      return;
    }
    else {
      final provider = Provider.of<TodosProvider>(context, listen: false);
      provider.editTask(widget.todo, title, description);
      Navigator.of(context).pop();}
  }

}