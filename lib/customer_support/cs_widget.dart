import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomerSupportWidget extends StatelessWidget {
  final List<String> faq_catagorie;
   const CustomerSupportWidget({super.key, required this.faq_catagorie});

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: faq_catagorie.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          clipBehavior: Clip.antiAlias,
          child: ExpansionTile(
            collapsedBackgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
              side: const BorderSide(color: Colors.black, width: 1.0), // Add a border
            ),
            title: Row(
              children: [
                Stack(
                  children: [
                    SvgPicture.asset('assets/images/Ellipse 691.svg',height: 30,width: 30,),
                    SvgPicture.asset('assets/images/Vector.svg',height: 20,width: 20,),
                  ],
                ),
                Text(faq_catagorie[index],
                style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w500,fontStyle: FontStyle.normal),),
              ],
            ),
            children: const [
              Text('FAQ'),
            ],),
        );
      },

    );
  }
}
