import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ths/Res/AppContextExtension.dart';
import 'package:ths/View/Widgets/Textfield.dart';
import 'package:ths/View/Widgets/photosWidget.dart';
import 'package:ths/View_Model/Prise_RDV_View_Model.dart';

import 'button.dart';

Widget Prise_RDV({
  required BuildContext context,
  required Function ontap1,
  required Function ontap2,
}) {
  var size = MediaQuery.of(context).size;
  var data = PriseRDViewModel();
  return Padding(
    padding: EdgeInsets.all(size.width * 0.05),
    child: Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(size.width * 0.02),
              child: Column(
                children: [
                  TextFieldRec(
                      hinttext: data.cont1,
                      context: context,
                      ligne: 1,
                      icon: Icons.account_circle,
                      bool: true),
                  TextFieldRec(
                      hinttext: data.cont2,
                      context: context,
                      ligne: 1,
                      icon: Icons.account_circle,
                      bool: true),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Date_time(
                      icon: Icons.date_range,
                      context: context,
                      text: '12/12/2022'),
                  Date_time(
                      icon: Icons.access_time_outlined,
                      context: context,
                      text: '10:30'),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  bottom: size.width * 0.05, top: size.width * 0.05),
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
                      val: 'Valider',
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
      ),
      width: size.width * 0.9,
      height: 330,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black, spreadRadius: 0.2, blurRadius: 4)
        ],
        color: context.resources.color.white,
      ),
    ),
  );
}
