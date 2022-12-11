import 'package:flutter/material.dart';

Widget button(
    {required String val,
    required Function onTap,
    required Color color1,
    required Color color2,
    required}) {
  return Container(
    width: 170,
    height: 35,
    child: RaisedButton(
      onPressed: () {
        onTap();
      },
      color: color1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Text(
        val,
        style:
            TextStyle(fontSize: 18, color: color2, fontWeight: FontWeight.bold),
      ),
    ),
  );
}

Widget buttonValiderAnuller({
  required String val,
  required Function onTap,
  required Color color1,
  required Color color2,
}) {
  return Container(
    width: 150,
    height: 40,
    child: RaisedButton(
      onPressed: () {
        onTap();
      },
      color: color1,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: color2, width: 2)),
      child: Text(
        val,
        style:
            TextStyle(fontSize: 18, color: color2, fontWeight: FontWeight.bold),
      ),
    ),
  );
}

Widget buttonValiderAnullerReporte({
  required BuildContext context,
  required String val,
  required Function onTap,
  required Color color1,
  required Color color2,
  required IconData icon,
}) {
  return Column(
    children: [
      Container(
        width: MediaQuery.of(context).size.width * 0.338,
         height: 30,
        child: RaisedButton(
          onPressed: () {
            onTap();
          },
          color: color1,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(color: color2, width: 2)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: color2,
                size: 15,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                val,
                style: TextStyle(
                    fontSize: 13, color: color2, fontWeight: FontWeight.bold),textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
      SizedBox(
        height:5,
      ),
    ],
  );
}
