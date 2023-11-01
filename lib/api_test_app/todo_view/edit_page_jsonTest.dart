import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/data_fetcher.dart';
import '../provider/post_provider.dart';
import 'api_form_widget.dart';


class EditUser extends StatefulWidget {
  final DataFetcher data;
  const EditUser({super.key, required this.data});

  @override
  State<EditUser> createState() => _EditUserState();
}

class _EditUserState extends State<EditUser> {

  final  _formKey = GlobalKey<FormState>();
  late int id;
  late String name;

  initState() {
    super.initState();
    id = widget.data.id!;
    name = widget.data.name!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit this task'),),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: ApiFormWidget(
                  id: id,
                  name: name,
                    onChangedName: (name)=>setState(()=>this.name=name),
                  onSavedTodo: saveUser,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void saveUser(){
    final isValid = _formKey.currentState?.validate();
    if (!isValid!) {
      return;
    }
    else {
      final provider = Provider.of<PostProvider>(context, listen: false);
      provider.updateData(widget.data,id, name);
      Navigator.of(context).pop();
    }
  }
}
