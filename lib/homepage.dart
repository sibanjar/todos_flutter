import 'package:flutter/material.dart';
import 'package:todos/FAQ/faq_page.dart';
import 'package:todos/todo_app/view/todo/todo_home.dart';
import 'package:todos/api_test_app/todo_view/test_json.dart';

import 'customer_support/support_home.dart';

class HOME extends StatelessWidget {
  const HOME({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: (){
                 Navigator.of(context).push(MaterialPageRoute(builder: (_)=>const TODO_HOME())
                );
              }, child: const Text('todo')),
              ElevatedButton(
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (_)=>const TestApi())
                    );
                  }, child: const Text('json api')),
              ElevatedButton(
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (_)=>const FaqPage())
                    );
                  }, child: const Text('FAQ')),
              ElevatedButton(
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (_)=>const CustomerSupportHome())
                    );
                  }, child: const Text('Customer Support')),
            ],
          ),
        ),
      ),
    );
  }
}
