import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ths/Res/AppContextExtension.dart';
import 'package:ths/View_Model/AppbarModelView.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:core';

class Messanger extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var data = AppbarWidget();
     return Scaffold(
      appBar: AppBar(
          title: Text(data.admin),
          centerTitle: true,
          backgroundColor: context.resources.color.bleumarineO,
        ),
       body:
         StreamBuilder(
          stream: FirebaseFirestore.instance.collection('Messages').orderBy('createdAt',descending: false).snapshots() ,
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }
            final user = FirebaseAuth.instance.currentUser;
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                return MessageBubble(
                  snapshot.data!.docs[index]['text'],
                  snapshot.data!.docs[index]['createdAt'],

                );

              },
            );
          },
    ),
       
     );
  }
}

class MessageBubble extends StatelessWidget {
  MessageBubble(this.message,this.time);
  final String message;
  final String time;

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
                          'Envoyé le '+time,
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
