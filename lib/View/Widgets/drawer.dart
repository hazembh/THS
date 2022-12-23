import 'package:flutter/material.dart';

Widget Drawers({
  required BuildContext context,
  required String name,
  required String email,
  required String cin,
  required String serie,
  required String phone,
}) {
  return Drawer(
    child: ListView(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.025,
        ),
        Content(
            text: name,
            icon: Icons.account_circle,
            ontap: () {},
            context: context),
        Content(text: email, icon: Icons.email, ontap: () {}, context: context),
        Content(
            text: cin, icon: Icons.credit_card, ontap: () {}, context: context),
        Content(
            text: serie,
            icon: Icons.car_rental,
            ontap: () {},
            context: context),
        Content(text: phone, icon: Icons.phone, ontap: () {}, context: context),
        Content(
            text: 'Rendez-vous',
              icon: Icons.date_range,
            ontap: () {
              Navigator.pushNamed(context, '/PrisedeRDV');
            },
            context: context),
        Content(
            text: 'Home',
            icon: Icons.home,
            ontap: () {
              Navigator.pushNamed(context, '/RDV');
            },
            context: context),
        Content(
            text: 'Messages',
            icon: Icons.message,
            ontap: () {
              Navigator.pushNamed(context, '/messanger');
            },
            context: context),
        Content(
            text: 'Déconnexion',
            icon: Icons.logout,
            ontap: () {
              Navigator.pushReplacementNamed(context, '/login');
            },
            context: context),
      ],
    ),
  );
}

Widget Content(
    {required IconData icon,
    required String text,
    required BuildContext context,
    required Function ontap}) {
  return ListTile(
    leading: Icon(icon),
    title: Text(text),
    onTap: () {
      ontap();
    },
  );
}
