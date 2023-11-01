import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class Utils{
  static void showSnackBar(BuildContext context, String text){

    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }

}