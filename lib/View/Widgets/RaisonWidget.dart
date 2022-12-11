import 'package:flutter/material.dart';
import 'package:ths/Res/AppContextExtension.dart';

import 'button.dart';

Widget raison({
  required BuildContext context,
  required String hinttext,
  required Function ontap1,
  required Function ontap2,
}) {
  var size = MediaQuery.of(context).size;
  return Container(
    child: Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
              top: size.height * 0.01,
              left: size.height * 0.01,
              right: size.height * 0.01),
          child: TextField(
            decoration: InputDecoration(
              hintText: hinttext,
            ),
            maxLines: 10,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              bottom: size.width * 0.017, top: size.width * 0.017),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buttonValiderAnuller(
                  val: 'Annuler',
                  color1: Colors.white,
                  color2: Colors.red,
                  onTap: () {
                    ontap1();
                  }),
              buttonValiderAnuller(
                  val: 'Générer',
                  color1: Colors.white,
                  color2: Colors.green,
                  onTap: () {
                    ontap2();
                  })
            ],
          ),
        ),
      ],
    ),
    width: size.width * 0.9,
    //height: size.height * 0.8,
    decoration: BoxDecoration(
      border: Border(
        top: BorderSide(width: 0.5, color: context.resources.color.black),
        bottom: BorderSide(width: 0.5, color: context.resources.color.black),
        left: BorderSide(width: 0.5, color: context.resources.color.black),
        right: BorderSide(width: 0.5, color: context.resources.color.black),
      ),
      boxShadow: [
        BoxShadow(color: Colors.black, spreadRadius: 0.2, blurRadius: 4)
      ],
      color: context.resources.color.white,
    ),
  );
}
