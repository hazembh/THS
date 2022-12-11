import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ths/Res/AppContextExtension.dart';
import 'package:ths/View/Widgets/cardRDV.dart';
import 'package:ths/View/Widgets/drawer.dart';
import 'package:ths/View_Model/AppbarModelView.dart';
import 'package:ths/View_Model/UrlLauncher.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    var data = AppbarWidget();
    return Scaffold(
        appBar: AppBar(
          title: Text(data.rdv),
          centerTitle: true,
          backgroundColor: context.resources.color.bleumarineO,
        ),
        drawer: Drawers(
            context: context,
            cin: '11117999',
            name: 'Bouaziz Hazem',
            serie: '549 TN 183',
            phone: '+216 28272203',
            email: 'hazem.bouaziz@supcom.tn'),

        body: SingleChildScrollView(
          child: Column(
            children: [
              CardTache(
                ontapphone: () {
                  Utils.openPhoneCall(phoneNumber: '28272203');
                },
                ClientMSSDIN: '1232456',
                location: 'ariana',
                onTap: () {
                  Navigator.pushNamed(context, '/PrisedeRDV');
                },
                ClientPhone: '28272203',
                ClientId: 'B2C_2201_CHT_097',
                ClientName: 'Hazem bouaziz',
                context: context,
                location_f: () {
                  Navigator.pushNamed(context, '/maps');
                },
              ),
              CardRDV(
                  date: '12/12/2022',
                  ClientPhone: '28272203',
                  ClientMSSDIN: '1232456',
                  time: '08:30',
                  context: context,
                  ClientId: 'B2C_2201_CHT_097',
                  ClientName: 'Hazem bouaziz',
                  ontapphone: () {
                    Utils.openPhoneCall(phoneNumber: '28272203');
                  })
            ],
          ),
        ));
  }
}
