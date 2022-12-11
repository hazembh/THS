import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ths/View/Widgets/RaisonWidget.dart';
import 'package:ths/View/Widgets/drawer.dart';
import 'package:ths/Res/AppContextExtension.dart';
import 'package:ths/View/Widgets/showdialog.dart';
import 'package:ths/View_Model/AppbarModelView.dart';
import 'package:ths/View_Model/CardContentViewModel.dart';
import 'package:ths/View_Model/ShowDialogModelView.dart';

class InterventionReporte extends StatefulWidget {
  const InterventionReporte({Key? key}) : super(key: key);

  @override
  _InterventionReporteState createState() => _InterventionReporteState();
}

class _InterventionReporteState extends State<InterventionReporte> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var data = AppbarWidget();
    var data2= ContentTextFiled();
    return Scaffold(
        appBar: AppBar(
          title: Text(data.reporte),
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
        body: Column(
          children: [
            SizedBox(
              height: size.height * 0.05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                raison(
                    context: context,
                    hinttext:
                        data2.rep,
                    ontap1: () {
                      Navigator.pop(context);
                    },
                    ontap2: () {
                      _showMyDialog2();
                    }),
              ],
            ),
          ],
        ));
  }

  Future<void> _showMyDialog2() async {
    var data=ShowDialogModelView();
    return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (BuildContext context, setState) {
            return ShowDialogWidget(
                para:
                    data.oprep,
                title: data.rep,
                test: false);
          });
        });
  }
}
