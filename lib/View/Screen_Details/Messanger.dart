import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ths/Res/AppContextExtension.dart';
import 'package:ths/View_Model/AppbarModelView.dart';

class Messanger extends StatefulWidget {
  const Messanger({Key? key}) : super(key: key);

  @override
  _MessangerState createState() => _MessangerState();
}

class _MessangerState extends State<Messanger> {
  @override
  Widget build(BuildContext context) {
    var data = AppbarWidget();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(data.admin),
        centerTitle: true,
        backgroundColor: context.resources.color.bleumarineO,
      ),
      body:Column(
        children: [
          MessageBubble(
              "Le contenu du message diffuser par l'admin",),
        ],
      )
    );
  }
}

class MessageBubble extends StatelessWidget {
  MessageBubble(this.message);
  final String message;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(0),
                  )),
              width: size.width * 0.5,
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              margin: EdgeInsets.symmetric(vertical: 16, horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: [
                      Icon(
                        Icons.account_circle,
                        color: context.resources.color.bleumarineO,
                      ),
                      SizedBox(
                        width: size.width * 0.01,
                      ),
                      Text(
                         "Administarteur :",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: context.resources.color.bleumarineO,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: size.width * 0.42,
                        child: Text(
                          message,
                          style: TextStyle(color: Colors.black),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height*0.01,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: size.width*0.42,
                        child: Text(
                          'Envoyé le 12/12/2022 à 08:50',
                          style: TextStyle(color: Colors.grey[800],fontSize: 10,fontWeight: FontWeight.bold),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ],
      overflow: Overflow.visible,
    );
  }
}
