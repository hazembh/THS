import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ths/Res/AppContextExtension.dart';

Widget PhotoWidget({
  required Function onTap,
  required String title,
  required BuildContext context,
}) {
  var size = MediaQuery.of(context).size;
  return Column(
    children: [
      Row(
        children: [
          IconButton(
            icon: Icon(
              Icons.attach_file,
              size: 30,
            ),
            onPressed: () {
              onTap();
            },
          ),
          Text(
            title,
            style: TextStyle(
                fontSize: context.resources.dimension.defaultMargin,
                fontStyle: FontStyle.italic),
          ),
        ],
      ),
      Container(
        width: size.width * 0.84,
        height: size.height * 0.25,
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(width: 0.5, color: context.resources.color.black),
            bottom:
                BorderSide(width: 0.5, color: context.resources.color.black),
            left: BorderSide(width: 0.5, color: context.resources.color.black),
            right: BorderSide(width: 0.5, color: context.resources.color.black),
          ),
          boxShadow: [
            BoxShadow(color: Colors.black, spreadRadius: 0.2, blurRadius: 4)
          ],
          color: context.resources.color.white,
        ),
//child: Image.asset(''),
      ),
      SizedBox(
        height: size.height * 0.01,
      )
    ],
  );
}

Widget TextTitle({
  required String title,
  required BuildContext context,
}) {
  var size = MediaQuery.of(context).size;

  return Row(
    children: [
      SizedBox(
        width: size.width * 0.06,
      ),
      Text(
        title,
        style: TextStyle(
            fontSize: context.resources.dimension.bigMargin,
            fontStyle: FontStyle.italic,
            color: context.resources.color.bleumarineO),
      ),
    ],
  );
}

Widget Date_time(
    {required BuildContext context,
    required String text,
    required IconData icon}) {
  var size = MediaQuery.of(context).size;
  return Row(
    children: [
      SizedBox(
        width: size.width * 0.01,
      ),
      IconButton(
        icon: Icon(icon),
        onPressed: () {},
      ),
      Text(
        text,
        style: TextStyle(fontWeight: FontWeight.bold),
      )
    ],
  );
}
