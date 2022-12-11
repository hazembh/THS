import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget TextFielde({
  required String value,
  required IconData icon,
  // required TextEditingController controller
}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 35, vertical: 5),
    child: TextFormField(
      //controller: controller,
      decoration: InputDecoration(
        border: UnderlineInputBorder(),
        labelText: value,
        prefixIcon: Icon(icon),
      ),
    ),
  );
}

class TextFil extends StatefulWidget {
  late String value;
  late IconData icon;

  //late TextEditingController controller;

  TextFil({
    required this.value,
    required this.icon,
    //required this.controller,
  });

  @override
  _TextFilState createState() => _TextFilState();
}

class _TextFilState extends State<TextFil> {
  bool passwordobscured = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 35, vertical: 5),
      child: TextFormField(
        obscureText: passwordobscured,
        //controller: widget.controller,
        decoration: InputDecoration(
            border: UnderlineInputBorder(),
            labelText: widget.value,
            prefixIcon: Icon(widget.icon),
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  passwordobscured = !passwordobscured;
                });
              },
              icon: Icon(
                  passwordobscured ? Icons.visibility_off : Icons.visibility),
            )),
      ),
    );
  }
}

Widget TextFieldRec(
    {required String hinttext,
    required BuildContext context,
    required int ligne,
      required IconData icon,
      required bool bool,
    }) {
  return Padding(
    padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.width * 0.01,
        left: MediaQuery.of(context).size.width * 0.03,
        right: MediaQuery.of(context).size.width * 0.03),
    child: TextField(

      decoration: InputDecoration(
        prefixIcon: bool ? Icon(icon):null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        hintText: hinttext,
      ),
      maxLines: ligne,
    ),
  );
}


