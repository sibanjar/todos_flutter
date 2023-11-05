import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'cs_widget.dart';

class CustomerSupportHome extends StatelessWidget {
  const CustomerSupportHome({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> supportcategories = ['Frequently Asked Question','Customer Support','wallet','wallet','wallet','wallet'];
    return Scaffold(
      backgroundColor: const Color(0xFFf2f3f8),
     body: SafeArea(
       child:Padding(
         padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 16.0),
         child: Column(
           children: [
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 const Text('Customer Support',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                 ElevatedButton(onPressed: (){}, child: const Text('submit')),
               ],
             ),
             const SizedBox(height: 16,),
             Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
               const Padding(
                 padding: EdgeInsets.only(bottom: 5.0),
                 child: Text('Select Categories',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),),
               ),
               const SizedBox(width: 48,),
               TextButton(
                 style: TextButton.styleFrom(
                   padding: const EdgeInsets.all(0),
                 ),
                   onPressed: (){},
                   child: const Text('Frequently Asked Question',
                     style: TextStyle(
                         fontWeight: FontWeight.w500,
                         fontSize: 12,
                         shadows: [
                           Shadow(
                               color: Color(0xFF00658E),
                               offset: Offset(0, -5))
                         ],
                         color: Colors.transparent,
                         decoration: TextDecoration.underline,
                         decorationColor: Colors.black, // optional
                         decorationThickness: 2, // optional

                     ),
                   ),
               ),
             ],
           ),
             // const SizedBox(height: 8,),
             Container(
               height: 400.h,
               padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 16),
               decoration: const BoxDecoration(
                   color: Color(0xFFF0F1F3),
                 boxShadow:  [
                   BoxShadow(
                     color: Colors.black12,
                     offset: Offset(0.0, 5.0),
                     blurRadius: 7.0,
                   )
                 ]
               ),
               child:   ListView(
                 shrinkWrap: true,
                 children: [
                  CustomerSupportWidget(supportCatagories: supportcategories,),
                 ],
               ),
             ),
             Row(
               mainAxisAlignment: MainAxisAlignment.end,
               children: [
                 TextButton(
                     onPressed: (){},
                     child: const Text('see more',
                       style: TextStyle(
                         shadows: [
                           Shadow(
                               color: Color(0xFF00658E),
                               offset: Offset(0, -5))
                         ],
                         color: Colors.transparent,
                       decoration: TextDecoration.underline,
                       decorationColor: Colors.black, // optional
                       decorationThickness: 2, // optional
                     ),),
                 ),

               ],
             )
           ],
         ),
       )
     ),
    );
  }
}
