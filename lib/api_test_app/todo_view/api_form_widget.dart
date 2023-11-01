import 'package:flutter/material.dart';

class ApiFormWidget extends StatelessWidget {
  final int id;
  final String name;
  final ValueChanged<String> onChangedName;
  final VoidCallback onSavedTodo;

  const ApiFormWidget({super.key,
    required this.id,
    required this.name,
    required this.onChangedName,
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
    readOnly: true,
    initialValue: id.toString(),
    // onChanged: onChangedTitle,
    validator: (id){
      if(id!.isEmpty){
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
    initialValue: name,
    onChanged: onChangedName,
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
