import 'package:flutter/material.dart';
import 'package:todos/customer_support/cs_widget.dart';
import 'package:todos/customer_support/support_home.dart';
class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> dataList = [
      'Item 1',
      'Item 2',
      'Item 3',
      'Item 4',
      'Item 5',
      'Item 6',
      'Item 7',
      'Item 8',
      'Item 9',
      'Item 10',
      'Item 11',
      'Item 12',
      'Item 13',
      'Item 14',
      'Item 15',
      'Item 16',
      'Item 17',
      'Item 18',
      'Item 19',
      'Item 20',
      'Item 21',
      'Item 22',
      'Item 23',
      'Item 24',
      'Item 25',
      'Item 26',];

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 16.0),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Colors.red,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0.0, 5.0),
                  blurRadius: 7.0,
                ),
              ],
            ),
            child: ListView(
              children: [
                // ListView.builder(
                //   shrinkWrap: true,
                //   physics: NeverScrollableScrollPhysics(),
                //   itemCount: dataList.length,
                //   itemBuilder: (context, index) {
                //     return ListTile(
                //       title: Text(dataList[index]),
                //     );
                //   },
                // ),
                 CustomerSupportWidget(supportCatagories: dataList)
              ],
            ),
          )
          ,
        )
      ),
    );
  }
}
