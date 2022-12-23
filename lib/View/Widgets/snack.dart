import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ths/Res/AppContextExtension.dart';
import 'package:ths/View_Model/validations.dart';
Widget Snack({required String text, required BuildContext context}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(text,
          style: TextStyle(
              color: context.resources.color.white,
              fontWeight: FontWeight.bold))
    ],
  );
}

Widget Alert({required BuildContext context}) {
  var size = MediaQuery.of(context).size;

  return SimpleDialog(
      backgroundColor: context.resources.color.white,
      title: Center(
          child: Column(
            children: [
              Container(width: size.width * 0.4, child: Text(data.wait,textAlign: TextAlign.center,)),
              CircularProgressIndicator(
                color: context.resources.color.RedColor,
              ),
              SizedBox(
                height: size.height * 0.025,
              )
            ],
          )));
}



