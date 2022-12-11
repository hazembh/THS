import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ths/Res/AppContextExtension.dart';

import 'button.dart';

Widget CardTache(
    {required BuildContext context,
    required String location,
    required String ClientName,
    required String ClientPhone,
    required String ClientId,
    required String ClientMSSDIN,
    required Function onTap,
      required Function location_f,
    required Function ontapphone}) {
  var size = MediaQuery.of(context).size;
  return Padding(
    padding: EdgeInsets.all(size.width * 0.05),
    child: Container(
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FlatButton(
                onPressed: () {location_f();},
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          location_f();

                        }, icon: Icon(Icons.location_on_sharp)),
                    Container(
                      width: size.width * 0.27,
                      child: Text(
                        location,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              FlatButton(
                onPressed: () {},
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {}, icon: Icon(Icons.account_circle)),
                    Container(
                      width: size.width * 0.27,
                      child: Text(
                        ClientName,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              FlatButton(
                onPressed: () {
                  ontapphone();
                },
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          ontapphone();
                        },
                        icon: Icon(Icons.phone)),
                    Container(
                      width: size.width * 0.27,
                      child: Text(
                        ClientPhone,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              new VerticalDivider(
                color: Colors.black,
                thickness: 1,
                indent: 10,
                endIndent: 10,
              ),
            ],
          ),
          SizedBox(
            width: size.width * 0.02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10 - .0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: size.width * 0.3,
                          child: Text(
                            ClientId,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          width: size.width * 0.3,
                          child: Text(
                            ClientMSSDIN,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: size.width * 0.35,
                      child: Padding(
                        padding:  EdgeInsets.only(left:size.width*0.02),
                        child: RaisedButton(
                          elevation: 5,
                          onPressed: () {
                            onTap();
                          },
                          child: Text(
                            "Prendre un RDV ",
                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),textAlign: TextAlign.center,
                          ),
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: BorderSide(color: Colors.black, width: 2)),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      width: size.width * 0.9,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border(
          top: BorderSide(width: 1.5, color: context.resources.color.black),
          bottom: BorderSide(width: 1.5, color: context.resources.color.black),
          left: BorderSide(width: 1.5, color: context.resources.color.black),
          right: BorderSide(width: 1.5, color: context.resources.color.black),
        ),
        color: context.resources.color.white,
      ),
    ),
  );
}

Widget CardRDV(
    {required BuildContext context,
    required String time,
    required String date,
    required String ClientName,
    required String ClientPhone,
    required String ClientId,
    required String ClientMSSDIN,
    required Function ontapphone}) {
  var size = MediaQuery.of(context).size;
  return Padding(
    padding: EdgeInsets.all(size.width * 0.05),
    child: Container(
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FlatButton(
                onPressed: () {},
                child: Row(
                  children: [
                    IconButton(onPressed: () {}, icon: Icon(Icons.access_time)),
                    Container(
                      width: size.width * 0.27,
                      child: Text(
                        time,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              FlatButton(
                onPressed: () {},
                child: Row(
                  children: [
                    IconButton(onPressed: () {}, icon: Icon(Icons.date_range)),
                    Container(
                      width: size.width * 0.27,
                      child: Text(
                        date,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              FlatButton(
                onPressed: () {},
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {}, icon: Icon(Icons.account_circle)),
                    Container(
                      width: size.width * 0.27,
                      child: Text(
                        ClientName,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              FlatButton(
                onPressed: () {
                  ontapphone();
                },
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          ontapphone();
                        },
                        icon: Icon(Icons.phone)),
                    Container(
                      width: size.width * 0.27,
                      child: Text(
                        ClientPhone,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              new VerticalDivider(
                color: Colors.black,
                thickness: 1,
                indent: 10,
                endIndent: 10,
              ),
            ],
          ),
          SizedBox(
            width: size.width * 0.02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10 - .0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: size.width * 0.3,
                          child: Text(
                            ClientId,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          width: size.width * 0.3,
                          child: Text(
                            ClientMSSDIN,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                    Container(

                        child: Padding(
                            padding:  EdgeInsets.only(left:size.width*0.019),
                          child: Column(
                            children: [
                              buttonValiderAnullerReporte(
                                  color2: Colors.red,
                                  onTap: () {
                                    Navigator.pushNamed(context, '/annuler');
                                  },
                                  val: 'Annulée        ',
                                  color1: Colors.white,
                                  icon: Icons.delete, context: context),
                              buttonValiderAnullerReporte(
                                  color2: Colors.blue,
                                  onTap: () {
                                    Navigator.pushNamed(context, '/reporter');
                                  },
                                  val: 'Reportée      ',
                                  color1: Colors.white,
                                  icon: Icons.access_time, context: context),
                              buttonValiderAnullerReporte(
                                  color2: Colors.deepPurple,
                                  onTap: () {
                                    Navigator.pushNamed(context, '/interrempu');
                                  },
                                  val: 'Interrempue',
                                  color1: Colors.white,
                                  icon: Icons.not_interested, context: context),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      width: size.width * 0.9,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border(
          top: BorderSide(width: 1.5, color: context.resources.color.black),
          bottom: BorderSide(width: 1.5, color: context.resources.color.black),
          left: BorderSide(width: 1.5, color: context.resources.color.black),
          right: BorderSide(width: 1.5, color: context.resources.color.black),
        ),
        color: context.resources.color.white,
      ),
    ),
  );
}
