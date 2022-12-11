import 'package:flutter/material.dart';
import 'package:ths/View/Screen_Details/Interventionannul%C3%A9.dart';
import 'package:ths/View/Screen_Details/Login_Screen.dart';
import 'package:ths/View/Screen_Details/PrisedeRDV.dart';
import 'package:ths/View/Screen_Details/interventioninterrempu.dart';
import 'package:ths/View/Screen_Details/interventionreport%C3%A9.dart';
import 'View/Screen_Details/Home.dart';
import 'View/Screen_Details/Messanger.dart';
import 'View/Screen_Details/Navigationbar.dart';
import 'View/Screen_Details/SignUp.dart';
import 'View/Widgets/API/maps.dart';

void main() async {
  //WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
      routes: {
        '/signup': (context) => SignUpScreen(),
        '/login': (context) => LoginScreen(),
        '/RDV': (context) => NavigationBar(),
        '/annuler': (context) => InterventionAnnule(),
        '/reporter': (context) => InterventionReporte(),
        '/interrempu': (context) => InterventionInterrempu(),
        '/PrisedeRDV': (context) =>PriseRDV(),
        '/messanger':(context)=>Messanger(),
        '/maps':(context)=>MapSample(),
      },
    );
  }
}
