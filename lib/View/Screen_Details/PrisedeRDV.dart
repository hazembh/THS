import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ths/Res/AppContextExtension.dart';
import 'package:ths/View/Widgets/PriseRDV.dart';
import 'package:ths/View/Widgets/showdialog.dart';
import 'package:ths/View_Model/AppbarModelView.dart';
import 'package:ths/View_Model/CardContentViewModel.dart';
import 'package:ths/View_Model/ShowDialogModelView.dart';

class PriseRDV extends StatefulWidget {
  const PriseRDV({Key? key}) : super(key: key);

  @override
  _PriseRDVState createState() => _PriseRDVState();
}

class _PriseRDVState extends State<PriseRDV> {
  @override
  Widget build(BuildContext context) {
    var data=AppbarWidget();

    return Scaffold(
      appBar: AppBar(
        title: Text(data.prise_rdv),
        centerTitle: true,
        backgroundColor: context.resources.color.bleumarineO,
      ),
      body: Prise_RDV(
          context: context,
          ontap1: () {
            Navigator.pop(context);
          },
          ontap2: () {
            _showMyDialog2();

          }),
    );
  }

  Future<void> _showMyDialog2() async {
    var data =ShowDialogModelView();
    return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
              builder: (BuildContext context, setState) {
                return ShowDialogWidget(para: data.ope, title:data.cong, test: true);
              }
          );
        }
    );
  }
}
