import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ths/Res/AppContextExtension.dart';
import 'package:ths/View/Widgets/NotificationsWidgets.dart';
import 'package:ths/View_Model/AppbarModelView.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var data = AppbarWidget();
    return Scaffold(
      backgroundColor: context.resources.color.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.07,
            ),
            Row(
              children: [
                SizedBox(
                  width: size.width * 0.05,
                ),
                Text(
                  data.notif,
                  style: TextStyle(
                      color: context.resources.color.bleumarine,
                      fontSize: context.resources.dimension.bigText,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            NotifciationTitleWidget(title: 'Nouvelles', context: context),
            NotifciationWidget(
                date: '11/12/2022',
                client: 'B2C_2201_CHT_097 ',
                context: context),
            NotifciationWidget(
                date: '15/12/2022',
                client: 'B2C_2201_CHT_099 ',
                context: context),
            NotifciationTitleWidget(title: 'Récentes', context: context),
            NotifciationWidget(
                date: '20/12/2022',
                client: 'B2C_2201_CHT_0100 ',
                context: context),
            NotifciationWidget(
                date: '21/12/2022',
                client: 'B2C_2201_CHT_099 ',
                context: context),
          ],
        ),
      ),
    );
  }
}
