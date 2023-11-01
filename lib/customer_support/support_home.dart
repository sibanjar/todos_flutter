import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'cs_widget.dart';

class CustomerSupportHome extends StatelessWidget {
  const CustomerSupportHome({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> categories = ['Frequently Asked Question','Customer Support','wallet','wallet','wallet'];
    return Scaffold(
      backgroundColor: const Color(0xFFf2f3f8),
     body: SafeArea(
       child:Padding(
         padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 16),
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
             children: [
               const Text('Select Categories',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),),
               Container(
                 height: 35.h,
                 margin: EdgeInsets.zero,
                 padding: EdgeInsets.zero,
                 decoration: const BoxDecoration(
                   border: Border(
                     bottom: BorderSide(width: 0.1,color: Colors.black,)
                   )
                 ),
                 child: TextButton(
                     onPressed: (){},
                     child: const Text('Frequently Asked Question',
                       style: TextStyle(fontWeight: FontWeight.w500,fontSize: 12,color: Color(0xFF00658E)),
                     ),
                 ),
               ),
             ],
           ),
             const SizedBox(height: 8,),
             Container(
               color: const Color(0xFFF0F1F3),
               padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 16),
               child:   Column(
                 children: [
                  CustomerSupportWidget(faq_catagorie: categories),
                 ],
               ),
             ),
           ],
         ),
       )
     ),
    );
  }
}
