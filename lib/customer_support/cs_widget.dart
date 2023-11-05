import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todos/customer_support/question_widget.dart';

class CustomerSupportWidget extends StatelessWidget {
  final List<String> supportCatagories;
   const CustomerSupportWidget({super.key, required this.supportCatagories});

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: supportCatagories.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          padding: const EdgeInsets.all(4),
          child: ExpansionTile(
            collapsedBackgroundColor: Colors.white,
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            title: Row(
              children: [
                SvgPicture.asset('assets/images/Group.svg',height: 30,width: 30,),
                const SizedBox(width: 10,),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                    decoration: const BoxDecoration(
                      border: Border(
                        left: BorderSide(width: 2,color: Color(0xFF4F616E),)
                      )
                    ),
                    child: Text(supportCatagories[index],
                    style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w500,fontStyle: FontStyle.normal),),
                  ),
                ),
              ],
            ),
            children:[
              Container(
                margin: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                  color: Color(0xFFf2f3f8)
                ),
                padding: EdgeInsets.only(bottom: 15.h),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: TextField(
                        decoration:InputDecoration(
                          border:OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide.none,
                          ),
                          hintText: 'Search Questions',
                          hintStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                          fillColor: const Color(0xFFe3eaf2),
                          filled: true,
                          contentPadding: const EdgeInsets.all(10),
                        ),
                      ),
                    ),
                    QuestionWidget(questionlist: supportCatagories)
                  ],
                ),
              )
            ],),
        );
      },

    );
  }
}
