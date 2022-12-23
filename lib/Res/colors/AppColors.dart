import 'dart:ui';

import 'package:flutter/material.dart';

import 'BaseColor.dart';

class AppColors implements BaseColors {
  Map<int, Color> _primary = {
    50: Color.fromRGBO(22, 134, 206, 0.1),
    100: Color.fromRGBO(22, 134, 206, 0.2),
    200: Color.fromRGBO(22, 134, 206, 0.3),
    300: Color.fromRGBO(22, 134, 206, 0.4),
    400: Color.fromRGBO(22, 134, 206, 0.5),
    500: Color.fromRGBO(22, 134, 206, 0.6),
    600: Color.fromRGBO(22, 134, 206, 0.7),
    700: Color.fromRGBO(22, 134, 206, 0.8),
    800: Color.fromRGBO(22, 134, 206, 0.9),
    900: Color.fromRGBO(22, 134, 206, 1.0),
  };

  //Primary color
  @override
  MaterialColor get colorPrimary => MaterialColor(0xff1686ce, _primary);

  //Cadre color
  @override
  Color get bleuciel => Color.fromRGBO(167, 167, 183, 0.45);

  @override
  // TODO: implement CardColor
  Color get white=> Colors.white;
  @override
  // TODO: implement CardColor
  Color get black=> Colors.black;
  @override
  Color get bleumarine => Color.fromRGBO(  0, 36, 147,1);
  @override
  Color get bleumarineO => Color.fromRGBO(  0, 36, 147,0.75);
  @override
  Color get RedColor =>Colors.red;




}