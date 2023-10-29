// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todos/provider_model/todo_model.dart';
import 'package:todos/view/home.dart';

void main(){
  runApp( ChangeNotifierProvider(
          create: (BuildContext context)=>TodosProvider(),
          child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        home: Home());
  }
}