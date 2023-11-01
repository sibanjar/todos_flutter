import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todos/todo_app/view/todo/todoformwidget.dart';

import '../../provider_model/task_model.dart';
import '../../provider_model/todo_model.dart';

class TodoPopUp extends StatefulWidget {
  const TodoPopUp({super.key});

  @override
  State<TodoPopUp> createState() => _TodoPopUpState();
}

class _TodoPopUpState extends State<TodoPopUp> {
  final _formKey=GlobalKey<FormState>();
  String title='';
  String description='';
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Add todo',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
            TodoFormWidget(
                title: title,
                description: description,
                onChangedTitle: (title){
                  setState((){
                  this.title=title;
                  });
                  },
                onChangedDescription: (description)=>setState(()=>this.description=description),
                onSavedTodo:addtodo,
    )
          ],
        ),
      ),
    );
  }
  void addtodo(){
  final isValid= _formKey.currentState?.validate();
  if(!isValid!){
    return;
  }else{
    final task= Task(
        title: title,
        createdTime: DateTime.now(),
        description: description,
    );
    final provider = Provider.of<TodosProvider>(context,listen: false);
    provider.addTask(task);
    Navigator.of(context).pop();
  }
}
}
