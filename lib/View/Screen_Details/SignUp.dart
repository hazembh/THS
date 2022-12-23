import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ths/Res/AppContextExtension.dart';
import 'package:ths/View/Widgets/Textfield.dart';
import 'package:ths/View_Model/LoginViewModel.dart';
import 'package:ths/View_Model/SignUpViewModel.dart';
import 'package:ths/View_Model/validations.dart';

import 'Login_Screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var data = LoginModelView();
  var data2 = SignUpModelView();
  @override
  TextEditingController email = TextEditingController();
  TextEditingController repassword = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController nom = TextEditingController();
  TextEditingController cin = TextEditingController();
  TextEditingController car = TextEditingController();
  TextEditingController phone = TextEditingController();

 /*void dispose() {
    super.dispose();
    email.dispose();
    repassword.dispose();
    password.dispose();
    nom.dispose();
    cin.dispose();
    car.dispose();
    phone.dispose();
  }*/
  @override
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
                ), // Required some widget in between to float AppBar,
              ), // Required some widget in between to float AppBar

              Positioned(
                top: size.height * 0.12, // To take AppBar Size only
                left: -size.width * 0.5,
                right: 0.0,
                child: Image.asset(data.image,
                    width: size.width * 0.1, height: size.height * 0.1),
              ),

              Positioned(
                top: size.height * 0.13, // To take AppBar Size only
                left: size.width * 0.41,
                right: 0.0,
                child: Text(
                  data2.title,
                  style: TextStyle(
                      color: context.resources.color.bleumarine,
                      fontSize: context.resources.dimension.bigText,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Positioned(
                  top: size.height * 0.23,
                  left: size.width * 0.075,
                  child: Container(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                data2.cpte,
                                style: TextStyle(
                                    color: context.resources.color.black,
                                    fontSize:
                                        context.resources.dimension.bigText,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          TextFielde(
                              value: data.email_label, icon: Icons.email, controller: email),
                          TextFielde(
                              value: data2.nom, icon: Icons.account_box_sharp, controller: nom),
                          TextFielde(value: data2.CIN, icon: Icons.credit_card, controller: cin),
                          TextFielde(value: data2.car, icon: Icons.car_rental, controller: car),
                          TextFielde(value: data2.tel, icon: Icons.phone, controller: phone),
                          TextFil(
                            value: data.mot_passe_label,
                            icon: Icons.lock, controller: password,
                          ),
                          TextFil(
                            value: data2.repMotdepasse,
                            icon: Icons.lock, controller: repassword,
                          ),
                        ],
                      ),
                    ),
                    width: size.width * 0.85,
                    height: size.height * 0.68,
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

              Column(
                children: [
                  SizedBox(
                    height: size.height * 0.88,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 170,
                        height: 40,
                        child: RaisedButton(
                          onPressed: (){
                                validations(
                                context,
                                email,
                                nom,
                                cin,
                                car,
                                phone,
                                password,
                                repassword);
                          },
                          color: context.resources.color.bleumarineO,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          child: Text(
                            data2.insc,
                            style: TextStyle(
                                fontSize: 18,
                                color: context.resources.color.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
