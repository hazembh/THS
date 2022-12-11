import 'package:external_path/external_path.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:open_file/open_file.dart';
import 'package:ths/View/Widgets/Textfield.dart';
import 'package:ths/View/Widgets/button.dart';
import 'package:ths/View/Widgets/drawer.dart';
import 'package:ths/Res/AppContextExtension.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:ths/View/Widgets/photosWidget.dart';
import 'package:ths/View/Widgets/showdialog.dart';
import 'package:ths/View_Model/AppbarModelView.dart';
import 'package:ths/View_Model/InterventionViewModel.dart';
import 'package:ths/View_Model/ShowDialogModelView.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart'
    hide Column, Alignment, Row;

class Interventions extends StatefulWidget {
  @override
  _InterventionsState createState() => _InterventionsState();
}

class _InterventionsState extends State<Interventions> {
  List selectedqcm = [];
  List checkqcm = ['Oui', 'Non'];
  late bool qcmvalue = false;
  late bool newqcmvalue;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var data1 = InterventionViewModel();
    var data = AppbarWidget();
    return Scaffold(
        appBar: AppBar(
          title: Text(data.intervention),
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
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: size.width * 0.05, bottom: size.width * 0.06),
              child: Container(
                width: size.width * 0.9,
                height: size.height,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade500,
                          spreadRadius: 0.5,
                          blurRadius: 15)
                    ],
                    color: context.resources.color.white,
                    borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(30), top: Radius.circular(30))),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: size.width * 0.03,
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.attach_file,
                              size: 30,
                            ),
                            onPressed: () {
                              _showPicker(context);
                            },
                          ),
                          Text(
                            data1.pv,
                            style: TextStyle(
                                fontSize:
                                    context.resources.dimension.defaultMargin,
                                fontStyle: FontStyle.italic),
                          ),
                        ],
                      ),
                      TextTitle(context: context, title: data1.rp),
                      SizedBox(height: size.height * 0.01),
                      Date_time(
                          icon: Icons.date_range,
                          context: context,
                          text: '12/12/2022'),
                      Date_time(
                          icon: Icons.timelapse,
                          context: context,
                          text: '10:50'),
                      Row(
                        children: [
                          SizedBox(
                            width: size.width * 0.05,
                          ),
                          Text(
                            data1.sp,
                            style: TextStyle(
                                fontSize:
                                    context.resources.dimension.mediumText),
                          ),
                        ],
                      ),
                      Row(
                        children: checkqcm.map((e) {
                          return Expanded(
                            child: CheckboxListTile(
                                title: Text(e),
                                value:
                                    selectedqcm.indexOf(e) < 0 ? false : true,
                                onChanged: (newqcmvalue) {
                                  if (selectedqcm.indexOf(e) < 0) {
                                    setState(() {
                                      selectedqcm.add(e);
                                    });
                                  } else {
                                    setState(() {
                                      selectedqcm.removeWhere(
                                          (element) => element == e);
                                    });
                                    print(selectedqcm);
                                  }
                                },
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                activeColor: context.resources.color.black),
                          );
                        }).toList(),
                      ),
                      TextFieldRec(
                        context: context,
                        hinttext: data1.az,
                        ligne: 1,
                        bool: false,
                        icon: (Icons.not_interested),
                      ),
                      TextFieldRec(
                        context: context,
                        hinttext: data1.tl,
                        ligne: 1,
                        bool: false,
                        icon: (Icons.not_interested),
                      ),
                      TextFieldRec(
                        context: context,
                        hinttext: data1.RSRP,
                        ligne: 1,
                        bool: false,
                        icon: (Icons.not_interested),
                      ),
                      TextFieldRec(
                        context: context,
                        hinttext: data1.SINR,
                        ligne: 1,
                        bool: false,
                        icon: (Icons.not_interested),
                      ),
                      TextFieldRec(
                        context: context,
                        hinttext: data1.PCI,
                        ligne: 1,
                        bool: false,
                        icon: (Icons.not_interested),
                      ),
                      TextFieldRec(
                        context: context,
                        hinttext: data1.LONGCAB,
                        ligne: 1,
                        bool: false,
                        icon: (Icons.not_interested),
                      ),
                      TextFieldRec(
                        context: context,
                        hinttext: data1.COMM,
                        ligne: 5,
                        bool: false,
                        icon: (Icons.not_interested),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      TextTitle(context: context, title: data1.photo),
                      PhotoWidget(
                          context: context,
                          title: data1.oduvf,
                          onTap: () {
                            _showPicker(context);
                          }),
                      PhotoWidget(
                          context: context,
                          title: data1.oduva,
                          onTap: () {
                            _showPicker(context);
                          }),
                      PhotoWidget(
                          context: context,
                          title: data1.iduvf,
                          onTap: () {
                            _showPicker(context);
                          }),
                      PhotoWidget(
                          context: context,
                          title: data1.iduva,
                          onTap: () {
                            _showPicker(context);
                          }),
                      PhotoWidget(
                          context: context,
                          title: data1.caprad1,
                          onTap: () {
                            _showPicker(context);
                          }),
                      PhotoWidget(
                          context: context,
                          title: data1.caprad2,
                          onTap: () {
                            _showPicker(context);
                          }),
                      PhotoWidget(
                          context: context,
                          title: data1.caprad3,
                          onTap: () {
                            _showPicker(context);
                          }),
                      PhotoWidget(
                          context: context,
                          title: data1.cabext,
                          onTap: () {
                            _showPicker(context);
                          }),
                      PhotoWidget(
                          context: context,
                          title: data1.cabint,
                          onTap: () {
                            _showPicker(context);
                          }),
                      PhotoWidget(
                          context: context,
                          title: data1.xy,
                          onTap: () {
                            _showPicker(context);
                          }),
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: size.width * 0.05, top: size.width * 0.05),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            buttonValiderAnuller(
                                val: 'Annuler',
                                color1: Colors.white,
                                color2: Colors.red,
                                onTap: () {
                                  Navigator.pushNamed(context, '/RDV');
                                }),
                            buttonValiderAnuller(
                                val: 'Générer',
                                color1: Colors.white,
                                color2: Colors.green,
                                onTap: () async {
                                  await _createExcel();
                                  _showMyDialog2();
                                })
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  _imgFromCamera() async {
    await ImagePicker.platform.pickImage(source: ImageSource.camera);
  }

  late File image;

  _imgFromGallery() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: Text('Gallery'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
  Future<void> _showMyDialog2() async {
    var data = ShowDialogModelView();
    return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (BuildContext context, setState) {
            return ShowDialogWidget(
                para: data.ope, title: data.cong, test: true);
          });
        });
  }
}

//-----------------------------------------------------------------------------

List<CellStyle> createStyles(Workbook workbook) {
  final CellStyle style = workbook.styles.add('Style');
  style.fontColor = '#308DA2';
  style.fontSize = 28;
  style.bold = true;
  style.borders.bottom.lineStyle = LineStyle.double;
  style.vAlign = VAlignType.center;

  final CellStyle style1 = workbook.styles.add('Style1');
  style1.bold = true;
  style1.fontSize = 12;
  style1.fontColor = '#595959';
  style1.vAlign = VAlignType.center;
  style1.borders.bottom.lineStyle = LineStyle.thin;
  style1.borders.bottom.color = '#A6A6A6';
  style1.borders.right.lineStyle = LineStyle.thin;
  style1.borders.right.color = '#A6A6A6';

  final CellStyle style2 = workbook.styles.add('Style2');
  style2.fontColor = '#595959';
  style2.wrapText = true;
  style2.vAlign = VAlignType.center;
  style2.borders.bottom.lineStyle = LineStyle.thin;
  style2.borders.bottom.color = '#A6A6A6';
  style2.borders.right.lineStyle = LineStyle.thin;
  style2.borders.right.color = '#A6A6A6';
  style2.numberFormat = '_(\$* #,##0_);_(\$* (#,##0);_(\$* "-"_);_(@_)';

  final CellStyle style3 = workbook.styles.add('style3');
  style3.backColor = '#F2F2F2';
  style3.fontColor = '#313F55';
  style3.vAlign = VAlignType.center;
  style3.borders.bottom.lineStyle = LineStyle.thin;
  style3.borders.bottom.color = '#308DA2';
  style3.borders.right.lineStyle = LineStyle.thin;
  style3.borders.right.color = '#A6A6A6';

  final CellStyle style4 = workbook.styles.add('Style4');
  style4.backColor = '#CFEBF1';
  style4.bold = true;
  style4.vAlign = VAlignType.center;
  style4.borders.bottom.lineStyle = LineStyle.medium;
  style4.borders.bottom.color = '#308DA2';
  style4.borders.right.lineStyle = LineStyle.thin;
  style4.borders.right.color = '#A6A6A6';

  final CellStyle style5 = workbook.styles.add('Style5');
  style5.fontSize = 12;
  style5.vAlign = VAlignType.center;
  style5.hAlign = HAlignType.right;
  style5.indent = 1;
  style5.borders.bottom.lineStyle = LineStyle.thick;
  style5.borders.bottom.color = '#308DA2';
  style5.borders.right.lineStyle = LineStyle.thin;
  style5.borders.right.color = '#A6A6A6';
  style5.borders.left.lineStyle = LineStyle.thin;
  style5.borders.left.color = '#A6A6A6';

  final CellStyle style6 = workbook.styles.add('Style6');
  style6.fontColor = '#595959';
  style6.wrapText = true;
  style6.vAlign = VAlignType.center;
  style6.borders.right.lineStyle = LineStyle.thin;
  style6.borders.right.color = '#A6A6A6';
  style6.numberFormat = '_(\$* #,##0_);_(\$* (#,##0);_(\$* "-"_);_(@_)';

  final CellStyle style7 = workbook.styles.add('Style7');
  style7.fontColor = '#595959';
  style7.wrapText = true;
  style7.vAlign = VAlignType.center;
  style7.borders.bottom.lineStyle = LineStyle.thin;
  style7.borders.bottom.color = '#A6A6A6';

  final CellStyle style8 = workbook.styles.add('style8');
  style8.backColor = '#F2F2F2';
  style8.fontColor = '#313F55';
  style8.vAlign = VAlignType.center;
  style8.borders.bottom.lineStyle = LineStyle.thin;
  style8.borders.bottom.color = '#308DA2';
  style8.borders.right.lineStyle = LineStyle.thin;
  style8.borders.right.color = '#A6A6A6';
  style8.numberFormat = '_(\$* #,##0_);_(\$* (#,##0);_(\$* "-"_);_(@_)';

  final CellStyle style9 = workbook.styles.add('style9');
  style9.backColor = '#CFEBF1';
  style9.bold = true;
  style9.vAlign = VAlignType.center;
  style9.borders.bottom.lineStyle = LineStyle.medium;
  style9.borders.bottom.color = '#308DA2';
  style9.borders.right.lineStyle = LineStyle.thin;
  style9.borders.right.color = '#A6A6A6';
  style9.numberFormat = '_(\$* #,##0_);_(\$* (#,##0);_(\$* "-"_);_(@_)';

  return [
    style,
    style1,
    style2,
    style3,
    style4,
    style5,
    style6,
    style7,
    style8,
    style9
  ];
}

void addDataAndFormulas(Workbook workbook) {
  final List<CellStyle> styles = createStyles(workbook);

  addDEVISSheet(workbook, styles);

  addDataSheet(workbook, styles);

  addImageSheet(workbook, styles);
}

Future<void> _createExcel() async {
//Create an Excel document.

  //Creating a workbook.
  final Workbook workbook = Workbook();
  addDataAndFormulas(workbook);

  final List<int> bytes = workbook.saveAsStream();
  //Dispose the document.
  workbook.dispose();
  var path = await ExternalPath.getExternalStoragePublicDirectory(
      ExternalPath.DIRECTORY_DOWNLOADS);
  final String filename = "$path/excel.xlsx";
  print(filename);
  final File file = File(filename);

  await file.writeAsBytes(bytes, flush: true);
  //OpenFile.open(filename);
}

void addImageSheet(Workbook workbook, List<CellStyle> styles) {
  // sheet3
  final Worksheet sheet4 = workbook.worksheets.addWithName('IMAGES');
  sheet4.showGridlines = false;

  sheet4.getRangeByName('A1').columnWidth = 1.69;

  sheet4.getRangeByName('B1').text = 'Categories';
  sheet4.getRangeByName('B1').cellStyle = styles[0];
  sheet4.getRangeByName('B1').columnWidth = 60;

  sheet4.getRangeByName('B3:B8').cellStyle = styles[7];
  sheet4.getRangeByIndex(3, 2).text = 'Current Assets';
  sheet4.getRangeByIndex(4, 2).text = 'Fixed Assets';
  sheet4.getRangeByIndex(5, 2).text = 'Other Assets';
  sheet4.getRangeByIndex(6, 2).text = 'Current Liabilities';
  sheet4.getRangeByIndex(7, 2).text = 'Long-term Liabilities';
  sheet4.getRangeByIndex(8, 2).text = 'Owner Equity';
}

void addDataSheet(Workbook workbook, List<CellStyle> styles) {
  // sheet2
  final Worksheet sheet3 = workbook.worksheets.addWithName('DATA');
  sheet3.showGridlines = false;

  sheet3.getRangeByName('A1').columnWidth = 1.69;
  sheet3.getRangeByIndex(1, 3).columnWidth = 23;

  sheet3.getRangeByName('B1').text = 'Liabilities';
  sheet3.getRangeByName('B1:E1').cellStyle = styles[0];

  final Range range1 = sheet3.getRangeByName('D2');
  range1.cellStyle = styles[5];
  range1.text = 'FY-2019';

  final Range range2 = sheet3.getRangeByName('E2');
  range2.cellStyle = styles[5];
  range2.text = 'FY-2020';

  sheet3.getRangeByName('B3').text = 'Liabilities Type';
  sheet3.getRangeByName('C3').text = 'Description';
  sheet3.getRangeByName('D3').text = 'Prior Year';
  sheet3.getRangeByName('E3').text = 'Current Year';

  sheet3.getRangeByName('B3:E3').cellStyle = styles[1];
  sheet3.getRangeByName('B4:E11').cellStyle = styles[2];
  sheet3.getRangeByName('B12:E12').cellStyle = styles[6];

  sheet3.getRangeByName('B4:B8').text = 'Current Liabilities';
  sheet3.getRangeByName('B9:B10').text = 'Long-term Liabilities';
  sheet3.getRangeByIndex(10, 2, 11, 2).text = 'Owner Equity';

  sheet3.getRangeByIndex(4, 3).text = 'Accounts payable';
  sheet3.getRangeByIndex(5, 3).text = 'Accrued wages';
  sheet3.getRangeByIndex(6, 3).text = 'Accrued compensation';
  sheet3.getRangeByIndex(7, 3).text = 'Income taxes payable';
  sheet3.getRangeByIndex(8, 3).text = 'Unearned revenue';
  sheet3.getRangeByIndex(9, 3).text = 'Notes Payable';
  sheet3.getRangeByIndex(10, 3).text = 'Bonds Payable';
  sheet3.getRangeByIndex(11, 3).text = 'Investment capital';
  sheet3.getRangeByIndex(12, 3).text = 'Accumulated retained earnings';

  sheet3.getRangeByName('D4').number = 35900;
  sheet3.getRangeByName('D5').number = 8500;
  sheet3.getRangeByName('D6').number = 7900;
  sheet3.getRangeByName('D7').number = 6100;
  sheet3.getRangeByName('D8').number = 1500;
  sheet3.getRangeByName('D9').number = 20000;
  sheet3.getRangeByName('D10').number = 400000;
  sheet3.getRangeByName('D11').number = 11000;
  sheet3.getRangeByName('D12').number = 22000;

  sheet3.getRangeByName('E4').number = 30000;
  sheet3.getRangeByName('E5').number = 6400;
  sheet3.getRangeByName('E6').number = 5000;
  sheet3.getRangeByName('E7').number = 5300;
  sheet3.getRangeByName('E8').number = 1700;
  sheet3.getRangeByName('E9').number = 22000;
  sheet3.getRangeByName('E10').number = 380100;
  sheet3.getRangeByName('E11').number = 12500;
  sheet3.getRangeByName('E12').number = 20700;
}

void addDEVISSheet(Workbook workbook, List<Style> styles) {
  final Worksheet sheet = workbook.worksheets.addWithName('DEVI');

  //Set data in the worksheet.
  sheet.getRangeByName('A2').columnWidth = 40.0;
  sheet.getRangeByName('B2').columnWidth = 40.0;
  sheet.getRangeByName('B1:C1').columnWidth = 13.82;
  sheet.getRangeByName('D1').columnWidth = 40.0;
  sheet.getRangeByName('E1').columnWidth = 7.50;
  sheet.getRangeByName('F1').columnWidth = 9.73;
  sheet.getRangeByName('G1').columnWidth = 8.82;
  sheet.getRangeByName('H1').columnWidth = 4.46;

  //sheet.getRangeByName('A1:H1').cellStyle.backColor = '#333F4F';
  //sheet.getRangeByName('A1:H1').merge();
  //sheet.getRangeByName('B4:D6').merge();
  sheet.getRangeByName('A2:B2').merge();
  sheet.getRangeByName('A2:B2').cellStyle.backColor = '#f1c232';
  sheet.getRangeByName('A2').setText('Rapport mise en service-CPE Outdoor-TDD');
  sheet.getRangeByName('A2').cellStyle.fontSize = 15;
  sheet.getRangeByName('A2').cellStyle.bold =true;
  sheet.getRangeByName('A2').cellStyle.hAlign= HAlignType.center;








  sheet.getRangeByName('B4').setText('Invoice');
  sheet.getRangeByName('B4').cellStyle.fontSize = 32;

  sheet.getRangeByName('B8').setText('BILL TO:');
  sheet.getRangeByName('B8').cellStyle.fontSize = 9;
  sheet.getRangeByName('B8').cellStyle.bold = true;

  sheet.getRangeByName('B9').setText('Abraham Swearegin');
  sheet.getRangeByName('B9').cellStyle.fontSize = 12;

  sheet.getRangeByName('B10').setText('United States, California, San Mateo,');
  sheet.getRangeByName('B10').cellStyle.fontSize = 9;

  sheet.getRangeByName('B11').setText('9920 BridgePointe Parkway,');
  sheet.getRangeByName('B11').cellStyle.fontSize = 9;

  sheet.getRangeByName('B12').setNumber(9365550136);
  sheet.getRangeByName('B12').cellStyle.fontSize = 9;
  sheet.getRangeByName('B12').cellStyle.hAlign = HAlignType.left;

  final Range range1 = sheet.getRangeByName('F8:G8');
  final Range range2 = sheet.getRangeByName('F9:G9');
  final Range range3 = sheet.getRangeByName('F10:G10');
  final Range range4 = sheet.getRangeByName('F11:G11');
  final Range range5 = sheet.getRangeByName('F12:G12');

  range1.merge();
  range2.merge();
  range3.merge();
  range4.merge();
  range5.merge();

  sheet.getRangeByName('F8').setText('INVOICE#');
  range1.cellStyle.fontSize = 8;
  range1.cellStyle.bold = true;
  range1.cellStyle.hAlign = HAlignType.right;

  sheet.getRangeByName('F9').setNumber(2058557939);
  range2.cellStyle.fontSize = 9;
  range2.cellStyle.hAlign = HAlignType.right;

  sheet.getRangeByName('F10').setText('DATE');
  range3.cellStyle.fontSize = 8;
  range3.cellStyle.bold = true;
  range3.cellStyle.hAlign = HAlignType.right;

  sheet.getRangeByName('F11').dateTime = DateTime(2020, 08, 31);
  sheet.getRangeByName('F11').numberFormat =
      '[\$-x-sysdate]dddd, mmmm dd, yyyy';
  range4.cellStyle.fontSize = 9;
  range4.cellStyle.hAlign = HAlignType.right;

  range5.cellStyle.fontSize = 8;
  range5.cellStyle.bold = true;
  range5.cellStyle.hAlign = HAlignType.right;

  final Range range6 = sheet.getRangeByName('B15:G15');
  range6.cellStyle.fontSize = 10;
  range6.cellStyle.bold = true;

  sheet.getRangeByIndex(15, 2).setText('Code');
  sheet.getRangeByIndex(16, 2).setText('CA-1098');
  sheet.getRangeByIndex(17, 2).setText('LJ-0192');
  sheet.getRangeByIndex(18, 2).setText('So-B909-M');
  sheet.getRangeByIndex(19, 2).setText('FK-5136');
  sheet.getRangeByIndex(20, 2).setText('HL-U509');

  sheet.getRangeByIndex(15, 3).setText('Description');
  sheet.getRangeByIndex(16, 3).setText('AWC Logo Cap');
  sheet.getRangeByIndex(17, 3).setText('Long-Sleeve Logo Jersey, M');
  sheet.getRangeByIndex(18, 3).setText('Mountain Bike Socks, M');
  sheet.getRangeByIndex(19, 3).setText('ML Fork');
  sheet.getRangeByIndex(20, 3).setText('Sports-100 Helmet, Black');

  sheet.getRangeByIndex(15, 3, 15, 4).merge();
  sheet.getRangeByIndex(16, 3, 16, 4).merge();
  sheet.getRangeByIndex(17, 3, 17, 4).merge();
  sheet.getRangeByIndex(18, 3, 18, 4).merge();
  sheet.getRangeByIndex(19, 3, 19, 4).merge();
  sheet.getRangeByIndex(20, 3, 20, 4).merge();

  sheet.getRangeByIndex(15, 5).setText('Quantity');
  sheet.getRangeByIndex(16, 5).setNumber(2);
  sheet.getRangeByIndex(17, 5).setNumber(3);
  sheet.getRangeByIndex(18, 5).setNumber(2);
  sheet.getRangeByIndex(19, 5).setNumber(6);
  sheet.getRangeByIndex(20, 5).setNumber(1);

  sheet.getRangeByIndex(15, 6).setText('Price');
  sheet.getRangeByIndex(16, 6).setNumber(8.99);
  sheet.getRangeByIndex(17, 6).setNumber(49.99);
  sheet.getRangeByIndex(18, 6).setNumber(9.50);
  sheet.getRangeByIndex(19, 6).setNumber(175.49);
  sheet.getRangeByIndex(20, 6).setNumber(34.99);

  sheet.getRangeByIndex(15, 7).setText('Total');
  sheet.getRangeByIndex(16, 7).setFormula('=E16*F16+(E16*F16)');
  sheet.getRangeByIndex(17, 7).setFormula('=E17*F17+(E17*F17)');
  sheet.getRangeByIndex(18, 7).setFormula('=E18*F18+(E18*F18)');
  sheet.getRangeByIndex(19, 7).setFormula('=E19*F19+(E19*F19)');
  sheet.getRangeByIndex(20, 7).setFormula('=E20*F20+(E20*F20)');
  sheet.getRangeByIndex(15, 6, 20, 7).numberFormat = '\$#,##0.00';

  sheet.getRangeByName('E15:G15').cellStyle.hAlign = HAlignType.right;
  sheet.getRangeByName('B15:G15').cellStyle.fontSize = 10;
  sheet.getRangeByName('B15:G15').cellStyle.bold = true;
  sheet.getRangeByName('B16:G20').cellStyle.fontSize = 9;

  sheet.getRangeByName('E22:G22').merge();
  sheet.getRangeByName('E22:G22').cellStyle.hAlign = HAlignType.right;
  sheet.getRangeByName('E23:G24').merge();

  final Range range7 = sheet.getRangeByName('E22');
  final Range range8 = sheet.getRangeByName('E23');
  range7.setText('TOTAL');
  range7.cellStyle.fontSize = 8;
  range8.setFormula('=SUM(G16:G20)');
  range8.numberFormat = '\$#,##0.00';
  range8.cellStyle.fontSize = 24;
  range8.cellStyle.hAlign = HAlignType.right;
  range8.cellStyle.bold = true;

  sheet.getRangeByIndex(26, 1).text =
      '800 Interchange Blvd, Suite 2501, Austin, TX 78721 | support@adventure-works.com';
  sheet.getRangeByIndex(26, 1).cellStyle.fontSize = 8;

  final Range range9 = sheet.getRangeByName('A26:H27');
  range9.cellStyle.backColor = '#ACB9CA';
  range9.merge();
  range9.cellStyle.hAlign = HAlignType.center;
  range9.cellStyle.vAlign = VAlignType.center;
}
