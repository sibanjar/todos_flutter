import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'blog_widget.dart';
class Blogs extends StatelessWidget {
  const Blogs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BLOGS'),),
      body:Container(
        width: double.infinity,
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Blogs',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                Text('View all',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400),),
              ],
            ),
            SizedBox(
              height: 200,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: const [
                  BlogWidget(),
                  BlogWidget(),
                  BlogWidget(),
                  BlogWidget(),
                  BlogWidget(),
                ],),
            ),
          ],
        ),

      ),
    );
  }
}
