import 'package:flutter/material.dart';
import 'FaqWidget.dart';

class FaqPage extends StatelessWidget {
  const FaqPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(onPressed: ()=>Navigator.of(context).pop(), icon: Icon(Icons.arrow_back,color: Colors.black,)),
        title: const Text('FAQ',style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
        titleSpacing: 0,
        elevation: 0,
      ),
      body: const SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            FaqWidget(),
            FaqWidget(),
            FaqWidget(),
            FaqWidget(),

          ],
        ),
      )
    );
  }
}
