import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ths/Res/AppContextExtension.dart';
import 'package:ths/View/Widgets/Textfield.dart';
import 'package:ths/View/Widgets/button.dart';
import 'package:ths/View_Model/LoginViewModel.dart';
import 'package:ths/View_Model/validations.dart';

import 'dashboard.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  var data = LoginModelView();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: context.resources.color.white,
        body: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Container(
                height: size.height,
              ),
              Positioned(
                child: Container(
                  height: size.height * 0.45,
                  decoration: BoxDecoration(
                      color: context.resources.color.bleuciel,
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(30))),
                ), // Required some wid float AppBar,
              ),
              Positioned(
                top: size.height * 0.18, // To take AppBar Size only
                left: -size.width * 0.5,
                right: 0.0,
                child: Container(
                  child: Image.asset(data.image,
                      width: size.width * 0.1, height: size.height * 0.1),
                ),
              ),
              Positioned(
                top: size.height * 0.195, // To take AppBar Size only
                left: size.width * 0.38,
                right: 0.0,
                child: Container(
                  child: Text(
                    data.title,
                    style: TextStyle(
                        color: context.resources.color.bleumarine,
                        fontSize: context.resources.dimension.bigText,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Positioned(
                  top: size.height * 0.28,
                  left: size.width * 0.075,
                  child: Container(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                child: Text(
                                  data.connexion,
                                  style: TextStyle(
                                      color: context.resources.color.black,
                                      fontSize:
                                          context.resources.dimension.bigText,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.04,
                          ),
                          TextFielde(
                              icon: Icons.email, value: data.email_label, controller: email),
                          TextFil(
                            value: data.mot_passe_label,
                            icon: Icons.lock, controller: password,
                          ),
                          SizedBox(
                            height: size.height * 0.07,
                          ),
                          Container(
                            child: FlatButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/signup');
                              },
                              child: Text(
                                data.pas_compte,
                                style: TextStyle(
                                    color: context.resources.color.bleumarine,
                                    fontSize:
                                        context.resources.dimension.mediumText,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    width: size.width * 0.85,
                    height: size.height * 0.45,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade500,
                              spreadRadius: 0.5,
                              blurRadius: 15)
                        ],
                        color: context.resources.color.white,
                        borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(30),
                            top: Radius.circular(30))),
                  )),
              Positioned(
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.7,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            width: 170,
                            height: 40,
                            child: button(
                                val: data.connecter,
                                color1: context.resources.color.bleumarineO,
                                color2: context.resources.color.white,
                                onTap: () {
                                 validation(context, email, password,loginUser(context, email, password, Dashboard()));
                                })),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
