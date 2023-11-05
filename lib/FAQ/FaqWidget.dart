import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FaqWidget extends StatelessWidget {
  const FaqWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  EdgeInsets.symmetric(horizontal: 16.w,),
      padding:  EdgeInsets.symmetric(vertical: 8.h,),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1,color: Colors.black,)
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text('Are there apps available for PocketPandit?',
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14.sp
            ),
          ),
           SizedBox(height: 4.h,),
            Text('Our service is accessible through the web application '
              'and mobile application: Download PocketPandit [on Google Play Store]'
              ' for seamless experience.',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12.sp,color: Color(0xFF6B7376)),),
        ],
      ),
    );
  }
}
