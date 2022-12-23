import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ths/Res/AppContextExtension.dart';
import 'package:ths/View/Screen_Details/Login_Screen.dart';
import 'package:ths/View/Widgets/snack.dart';
import 'Conditions.dart';


var data = SnackViewModel();
//Validation and login for the sign in
void validation(BuildContext context, TextEditingController email,
    TextEditingController password, fct) {
  var c1 = email.text.trim().isEmpty;
  var c2 = password.text.trim().isEmpty;

  if ((c1) && (c2)) {
    (ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: context.resources.color.RedColor,
        content: Snack(text: data.field, context: context))));
    return;
  }
  if (c1) {
    ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
        backgroundColor: context.resources.color.RedColor,
        content: Snack(text: data.email, context: context)));
    return;
  } else if (!RegExp(data.logic).hasMatch(email.text)) {
    ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
        backgroundColor: context.resources.color.RedColor,
        content: Snack(text: data.Validemail, context: context)));
  } else if (c2) {
    // ignore: deprecated_member_use
    ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
        backgroundColor: context.resources.color.RedColor,
        content: Snack(text: data.pwd, context: context)));
    return;
  } else {
    showDialog<String>(
        context: context,
        builder: (BuildContext context) => Alert(context: context));
    //loginUser(context, email, password, fct);
    fct;
  }
}

loginUser(BuildContext context, TextEditingController email,
    TextEditingController password, Widget fct1) async {
  bool hasException = false;

  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email.text.trim(),
      password: password.text.trim(),
    );
  } on FirebaseException catch (e) {
    hasException = true;

    if (e.code == data.code1) {
      ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
          backgroundColor: context.resources.color.RedColor,
          content: Snack(text: data.nouserfound, context: context)));
      Navigator.pop(context);
    } else if (e.code == data.code2) {
      ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
          backgroundColor: context.resources.color.RedColor,
          content: Snack(text: data.wrongpassword, context: context)));
      Navigator.pop(context);
    }
  } finally {
    if (!hasException) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => fct1));
    }
  }
}


//validation and senddata for the signUp

sendData(
    BuildContext context,
    TextEditingController email,
    TextEditingController nom,
    TextEditingController cin,
    TextEditingController car,
    TextEditingController phone,
    TextEditingController password,
    ) async {
  bool hasException = false;
  late UserCredential userCredential;

  try {
    //userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email.text, password: password.text);

    await FirebaseFirestore.instance.collection('UserCompte').add({
     // 'userid': userCredential.user?.uid,
      'Nom et prenom ': nom.text.trim(),
      'email': email.text.trim(),
      'CIN': cin.text.trim(),
      'Matricule': car.text.trim(),
      'Téléphone': phone.text.trim(),
      'Mot de passe ': password.text.trim(),
      'createdAt': DateFormat('dd-MM-yyyy hh:mm').format(DateTime.now()),
    });


  } catch (e) {
    hasException = true;
    if (e is FirebaseException) {
      if (e.code == data.code3) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: context.resources.color.RedColor,
            content: Snack(text: data.weak, context: context)));
        Navigator.pop(context);
      } else if (e.code == data.code4) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: context.resources.color.RedColor,
            content: Snack(text: data.used, context: context)));
        Navigator.pop(context);
      }
    }
  } finally {
    if (!hasException) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => LoginScreen()));
    }
  }
}



void validations(
    BuildContext context,
    TextEditingController email,
    TextEditingController nom,
    TextEditingController cin,
    TextEditingController car,
    TextEditingController phone,
    TextEditingController password,
    TextEditingController Repassword,
    ) {

  var c1 = email.text.trim().isEmpty;
  var c2 = nom.text.trim().isEmpty;
  var c3 = cin.text.trim().isEmpty;
  var c4 = car.text.trim().isEmpty;
  var c5 = phone.text.trim().isEmpty;
  var c6 = password.text.trim().isEmpty;
  var c7 = Repassword.text.trim().isEmpty;
  var c8 = password.text.trim() != Repassword.text.trim();

  if (c1 && c2 && c4 && c5 && c6 && c3) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: context.resources.color.RedColor,
        content: Snack(text: data.field, context: context)));
    return;
  }

  if (c1) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: context.resources.color.RedColor,
        content: Snack(text: data.email, context: context)));
    return;

  } else if (!RegExp(data.logic).hasMatch(email.text)) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: context.resources.color.RedColor,
        content: Snack(text: data.Validemail, context: context)));
    return;
  }

  else if (c2) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: context.resources.color.RedColor,
        content: Snack(text: data.checkn, context: context)));

    return;
  }


  else if (c3) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: context.resources.color.RedColor,
        content: Snack(text: data.checkcin, context: context)));

    return;
  }

  else if ((!RegExp(data.logic1 ).hasMatch(cin.text))||(cin.text.trim().length != 8)) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: context.resources.color.RedColor,
        content: Snack(text: data.cinvalid, context: context)));
    return;
  }

  else if (c4) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: context.resources.color.RedColor,
        content: Snack(text: data.checkv, context: context)));

    return;
  }
  else if (car.text.trim().length != 11) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: context.resources.color.RedColor,
        content: Snack(text: data.serie, context: context)));

    return;
  }

  else if (c5) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: context.resources.color.RedColor,
        content: Snack(text: data.checkt, context: context)));

    return;
  }

  else if ((!RegExp(data.logic1).hasMatch(phone.text))||((cin.text.trim().length != 8))) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: context.resources.color.RedColor,
        content: Snack(text: data.telvalid, context: context)));
    return;
  }

  else if (c6) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: context.resources.color.RedColor,
        content: Snack(text: data.pwd, context: context)));

    return;
  }
  else if (c7) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: context.resources.color.RedColor,
        content: Snack(text: data.checkrep, context: context)));
    return;
  }

  else if (c8) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: context.resources.color.RedColor,
        content: Snack(text: data.check, context: context)));
    return;
  }

  else {
    showDialog<String>(
        context: context,
        builder: (BuildContext context) => Alert(context: context));
    sendData(context, email, nom, cin, car, phone, password);
  }
}
