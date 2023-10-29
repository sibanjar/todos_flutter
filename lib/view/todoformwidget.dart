import 'package:flutter/material.dart';

class TodoFormWidget extends StatelessWidget {
  final String title;
  final String description;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDescription;
  final VoidCallback onSavedTodo;


   const TodoFormWidget({super.key,
    required this.title,
    required this.description,
    required this.onChangedTitle,
    required this.onChangedDescription,
    required this.onSavedTodo, });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          buildTitle(),
          buildDescription(),
          const SizedBox(height: 10,),
          buildButton(),
        ],
      ),
    );
  }

 Widget buildTitle()=>TextFormField(
       initialValue: title,
       onChanged: onChangedTitle,
       validator: (title){
         if(title!.isEmpty){
           return 'Title cannot be empty.';
         }
         return null;
       },
      decoration: const InputDecoration(
        border: UnderlineInputBorder(),
        labelText: 'Title'
      ),
 );
  Widget buildDescription()=>TextFormField(
    maxLines: 3,
    initialValue: description,
    onChanged: onChangedDescription,
    validator: (description){
      if(description!.isEmpty){
        return 'Description is empty';
      }
      return null;
    },
    decoration: const InputDecoration(
      border: UnderlineInputBorder(),
      labelText: 'Description',
    ),
  );

  Widget buildButton()=>SizedBox(
    width: double.infinity,
    child: ElevatedButton(
        onPressed: onSavedTodo,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black
        ),
        child: const Text('save')),
  );

}
