import 'package:flutter/material.dart';
class QuestionWidget extends StatelessWidget {
  final List questionlist;
  const QuestionWidget({super.key, required this.questionlist});

  @override
  Widget build(BuildContext context) {
    final ScrollController _scrollController = ScrollController();
    return  ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        controller: _scrollController,
        itemCount: questionlist.length,
        itemBuilder: (BuildContext context, int index){
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical:10),
              child: Text( '${index+1}.${questionlist[index]}'));
        }
    );
  }
}
