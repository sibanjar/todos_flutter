// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todos/provider_model/todo_model.dart';
import 'package:todos/view/home.dart';

void main(){
  runApp( MultiProvider(
    providers: [
    ChangeNotifierProvider(create: (BuildContext context)=>TodosProvider()),
    ],
            child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        primaryColor: Colors.blueGrey,
        backgroundColor: Colors.white,
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),
          subtitle1: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,fontStyle: FontStyle.italic),
        )
      ),
        darkTheme: ThemeData(),
        home: const Home());
  }
}