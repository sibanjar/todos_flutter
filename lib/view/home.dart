import 'package:flutter/material.dart';
import 'package:todos/view/todopopup.dart';
import 'package:todos/view/todosCompleted.dart';
import 'package:todos/view/Todolist.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex=0;
  @override
  Widget build(BuildContext context) {
    final tabs=[
      const TodoList(),
      const CompletedTodos(),
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('Todos Lists'),),
      body: tabs[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index)=>setState(() {
          selectedIndex =index;
        }),
        items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.fact_check),
            label: 'Todos'
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.done),
            label: 'Completed'
        ),
      ],),
      floatingActionButton: FloatingActionButton(
        onPressed: () { showDialog(
            context: context,
            builder: (_) => const TodoPopUp(),
          barrierDismissible: false,
        ); },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        backgroundColor: Colors.blueGrey,
        child: const Icon(Icons.add),
      ),

    );
  }
}
