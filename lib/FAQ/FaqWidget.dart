import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FaqWidget extends StatelessWidget {
  const FaqWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  const EdgeInsets.symmetric(horizontal: 24,),
      padding:  const EdgeInsets.symmetric(vertical: 8,),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 0.1,color: Colors.black,)
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Are there apps available for PocketPandit?',
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14
            ),
          ),
           SizedBox(height: 4.h,),
           const Text('Our service is accessible through the web application '
              'and mobile application: Download PocketPandit [on Google Play Store]'
              ' for seamless experience.',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12,color: Color(0xFF6B7376)),),
        ],
      ),
    );
  }
}
