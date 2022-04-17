import 'dart:async';
import 'package:flutter/material.dart';
import 'package:medi_cal/app_screens/home_screen.dart';
import 'package:medi_cal/app_screens/GAcalculator.dart';
import 'package:medi_cal/app_screens/GAcalculatorLMP.dart';
import 'package:medi_cal/app_screens/GAcalculatorGA.dart';
import 'package:medi_cal/widget/customWidgets.dart';



// EDD
class GAcalculatorEDD extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomAppView(
      pageTitle: 'EGA/EDD Calculator',
      appBarTitle: CustomAppBarLabel(
        label: "EGA/EDD Calculator",
      ),
      backButtonDestination: ChooseMethod(),
      pageBody: GAcalculatorCoreEDD(),
    );
  }
}

class GAcalculatorCoreEDD extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.lightBlueAccent,
        child: Center(
            child: Container(
              padding: EdgeInsets.only(top: 0.0),
              alignment: Alignment.center,
              child: InputFieldsEDD(),
            )));
  }
}

// Define a custom Form widget.
class InputFieldsEDD extends StatefulWidget {
  @override
  _InputFieldsEDDState createState() => _InputFieldsEDDState();
}

// Define a corresponding State class.
// This class holds data related to the form.
class _InputFieldsEDDState extends State<InputFieldsEDD> {
  DateTime selectedLMP = DateTime.now();
  DateTime selectedEDD = DateTime.now();
  final weeks = List.generate(43, (i) => i + 1);

  final days = List.generate(6, (i) => i + 1);

  int gaInDays = -1;
  int gaDays = -1;
  int gaWeeks = -1;
  DateTime lmp = DateTime.now();

  int _radioValue1 = 3;

  void _handleRadioValueChange1(value) {
    setState(() {
      _radioValue1 = value;
    });
  }

  void goToInputScreen() {
    if (_radioValue1 == 1) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => GAcalculatorLMP()));
    } else if (_radioValue1 == 2) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => GAcalculatorGA()));
    } else if (_radioValue1 == 3) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => GAcalculatorEDD()));
    }
  }

  Future<void> _selectEDD(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedEDD,
        firstDate: DateTime(2019, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedEDD)
      setState(() {
        selectedEDD = picked;
      });
  }

  void resetSelection() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (BuildContext context) => ChooseMethod()));
  }

  void compute() {
    calcLMP();
    calcGA();
    showResultDialog();
  }

  void calcLMP() {
    lmp = selectedEDD.subtract(const Duration(days: 280));
  }

  void calcGA() {
    int daysBetween(DateTime from, DateTime to) {
      from = DateTime(from.year, from.month, from.day);
      to = DateTime(to.year, to.month, to.day);
      return (to.difference(from).inHours / 24).round();
    }
    gaInDays = daysBetween(lmp, DateTime.now());
    gaDays = gaInDays % 7;
    gaWeeks = gaInDays ~/ 7;
  }

  void showResultDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Text(
            "GA/EDD Calculator", textAlign: TextAlign.center,
            //overflow: TextOverflow.ellipsis,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: Container(
              height: 150,
              width: 200,
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text('Calculated LMP'),
                    Padding(
                      padding: EdgeInsets.all(5.0),
                    ),
                    Text(
                      "$lmp.toLocal()}"
                          .split(' ')[0],
                      style: TextStyle(fontSize: 13.0),
                    ),
                    //Divider(height: 5.0, color: Colors.black),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                    ),
                    Text (
                      'Gestational Age Today',
                    ),
                    Padding(
                      padding: EdgeInsets.all(5.0),
                    ),
                    Text("$gaWeeks" + 'week(s), ' "$gaDays" + 'day(s)',
                      style: TextStyle(fontSize: 13.0),
                    ),
                  ])),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            TextButton(
              child: new Text("Back"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: new Text("Reset"),
              onPressed: () {
                //Navigator.of(context).pop();
                resetSelection();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final _style = Theme.of(context).textTheme.display2;
    return Scaffold(
        backgroundColor: Colors.lightBlueAccent,
        body: Center(
            child: Container(
                width: 400,
                child: Card(
                    color: Colors.white,
                    elevation: 10,
                    child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                child: ListView(
                                  children: [
                                    Text(
                                      'Calculate based on:',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold,
                                          fontStyle: FontStyle.italic),
                                    ),
                                    Row(
                                      //mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Radio(
                                          value: 1,
                                          groupValue: _radioValue1,
                                          onChanged: _handleRadioValueChange1,
                                        ),
                                        Text(
                                          'LMP',
                                          style: TextStyle(fontSize: 13.0),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      //mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Radio(
                                          value: 2,
                                          groupValue: _radioValue1,
                                          onChanged: _handleRadioValueChange1,
                                        ),
                                        Text(
                                          'GA',
                                          style: TextStyle(fontSize: 13.0),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      //mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Radio(
                                          value: 3,
                                          groupValue: _radioValue1,
                                          onChanged: _handleRadioValueChange1,
                                        ),
                                        Text(
                                          'EDD',
                                          style: TextStyle(fontSize: 13.0),
                                        ),
                                      ],
                                    ),
                                    ElevatedButton(
                                      onPressed: goToInputScreen,
                                      child: Text(
                                        'Input Value',
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.white),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                    ),
                                    Divider(height: 5.0, color: Colors.black),
                                    Padding(
                                      padding: EdgeInsets.all(2.0),
                                    ),
                                    ElevatedButton(
                                      onPressed: () => _selectEDD(context),
                                      child: Text('Select EDD'),
                                    ),
                                    Text(
                                        "${selectedEDD.toLocal()}"
                                            .split(' ')[0],
                                        textAlign: TextAlign.center),
                                    SizedBox(
                                      height: 20.0,
                                    ),
                                    SizedBox(
                                      height: 20.0,
                                    ),
                                    Divider(
                                      height: 5.0,
                                      color: Colors.black,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(2.0),
                                    ),
                                    ElevatedButton(
                                      onPressed: compute,
                                      child: Text(
                                        'Calculate',
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.white),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(4.0),
                                    ),
                                    ElevatedButton(
                                      onPressed: resetSelection,
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.redAccent,
                                      ),
                                      child: Text(
                                        'Reset Selection',
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 16.0,
                                            color: Colors.white),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ]))))));
  }
}

class MySelectionItem extends StatelessWidget {
  final int title;
  final bool isForList;

  const MySelectionItem({Key key, this.title, this.isForList = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.0,
      child: isForList
          ? Padding(
        child: _buildItem(context),
        padding: EdgeInsets.all(10.0),
      )
          : Card(
        margin: EdgeInsets.symmetric(horizontal: 10.0),
        child: Stack(
          children: <Widget>[
            _buildItem(context),
            Align(
              alignment: Alignment.centerRight,
              child: Icon(Icons.arrow_drop_down),
            )
          ],
        ),
      ),
    );
  }

  _buildItem(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      child: Text("$title"),
    );
  }
}
