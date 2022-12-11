import 'package:flutter/material.dart';
import 'package:ths/Res/AppContextExtension.dart';

Widget NotifciationWidget(
    {required String date,
    required String client,
    required BuildContext context}) {
  var size = MediaQuery.of(context).size;
  return Container(
    child: Column(
      children: [
        SizedBox(
          height: size.height * 0.0075,
        ),
        Container(
          color: context.resources.color.bleuciel,
          width: size.width,
          height: size.height * 0.1,
          child: Padding(
            padding: EdgeInsets.only(
                left: size.width * 0.05, right: size.width * 0.05),
            child: Center(
                child: Text("L'administrateur a affecté une intervention le " +
                    date +
                    " pour le compte du " +
                    client)),
          ),
        ),
      ],
    ),
  );
}

Widget NotifciationTitleWidget(
    {required BuildContext context, required String title}) {
  var size = MediaQuery.of(context).size;
  return Column(
    children: [
      SizedBox(
        height: size.height * 0.01,
      ),
      Row(
        children: [
          SizedBox(
            width: size.width * 0.05,
          ),
          Text(
            title,
            style: TextStyle(
                color: context.resources.color.black,
                fontSize: context.resources.dimension.mediumText,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ],
  );
}
