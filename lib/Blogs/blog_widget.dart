import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
class BlogWidget extends StatelessWidget {
  const BlogWidget({super.key});
  @override
  Widget build(BuildContext context) {
   final DateTime time=DateTime.now().subtract(const Duration(days: 10));
   final String date = DateFormat.yMMMd().format(DateTime.now()).toString();
   // final fifteenAgo = DateTime.now().subtract(time as Duration);
    return Container(
      width: 350,
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          // color: const Color(0xFFD9D9D9),
        color: Colors.blue.withOpacity(0.5),
          borderRadius: BorderRadius.circular(5),
          boxShadow: const [
            BoxShadow(
              color: Colors.black45,
              blurRadius: 2.0,
              offset: Offset(0.0, 3.0),
            )
          ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset('assets/images/Vector.svg',width:290,height: 120,),
          const Text('Khumbha & Meena Lagna (Aquarius & Pisces Ascendant)',
            style: TextStyle(color: Colors.black , fontSize: 14,fontWeight: FontWeight.w400),),
           Row(
            children: [
              Text(date,style: const TextStyle(
                  color: Color(0xFF6B7376) ,
                  fontSize: 12,fontWeight: FontWeight.w400),),
              const SizedBox(width: 6,),
              const Icon(Icons.circle,color: Colors.black,size: 6,),
              const SizedBox(width: 6,),
              Text(timeago.format(DateTime.now()).toString(),style: const TextStyle(
                  color: Color(0xFF6B7376) ,
                  fontSize: 12,fontWeight: FontWeight.w400),),
            ],
          ),
        ],
      ),
    );
  }
}
