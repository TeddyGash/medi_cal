import 'dart:async';
import 'package:medi_cal/app_screens/GAcalculator3.dart';
import 'package:medi_cal/app_screens/GAcalculatorLMP.dart';
import 'package:medi_cal/app_screens/GAcalculatorGA.dart';
import 'package:medi_cal/app_screens/GAcalculatorEDD.dart';
import 'package:direct_select/direct_select.dart';
import 'package:flutter/material.dart';
import 'package:medi_cal/app_screens/home_screen.dart';

class ChooseMethod extends StatefulWidget {
  @override
  _ChooseMethodState createState() => _ChooseMethodState();
}

class _ChooseMethodState extends State<ChooseMethod> {
  int _radioValue1 = -1;

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
      //add an error message if nothing is selected.
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "GAcalculator",
        home: Scaffold(
            appBar: AppBar(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("EGA/EDD Calculator"),
                  IconButton(
                    icon: const Icon(Icons.home,
                        color: Colors.white, size: 24.0, semanticLabel: "Home"),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    },
                  )
                ],
              ),
            ),
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
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold,
                                              fontStyle: FontStyle.italic),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(8.0),
                                        ),
                                        Row(
                                          //mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Radio(
                                              value: 1,
                                              groupValue: _radioValue1,
                                              onChanged:
                                                  _handleRadioValueChange1,
                                            ),
                                            Text(
                                              'LMP',
                                              style: TextStyle(fontSize: 15.0),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          //mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Radio(
                                              value: 2,
                                              groupValue: _radioValue1,
                                              onChanged:
                                                  _handleRadioValueChange1,
                                            ),
                                            Text(
                                              'GA',
                                              style: TextStyle(fontSize: 15.0),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          //mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Radio(
                                              value: 3,
                                              groupValue: _radioValue1,
                                              onChanged:
                                                  _handleRadioValueChange1,
                                            ),
                                            Text(
                                              'EDD',
                                              style: TextStyle(fontSize: 15.0),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(8.0),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(4.0),
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
                                      ],
                                    ),
                                  )
                                ])))))));
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

/*
void computeScore() {
  validateAnswers();
  calculateScore();
  comment();
}

void sumAnswers() {

}

void calculateScore() {
  validateAnswers();
  sumAnswers();
}

void comment() {
}
}

void showErrorDialog() {
  // flutter defined function
  showDialog(
    context: context,
    builder: (BuildContext context) {
      // return object of type Dialog
      return AlertDialog(
        title: new Text("Alert"),
        content: new Text("You left some parameters unanswered."),
        actions: <Widget>[
          // usually buttons at the bottom of the dialog
          TextButton(
            child: new Text("Back"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

void showResultDialog() {
  // flutter defined function
  showDialog(
    context: context,
    builder: (BuildContext context) {
      // return object of type Dialog
      return AlertDialog(
        title: Text(
          "CURB-65 Score:", textAlign: TextAlign.center,
          //overflow: TextOverflow.ellipsis,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        content: Container(
            height: 150,
            width: 200,
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "$totalScore\n", textAlign: TextAlign.center,
                    //overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      //fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                  Text(
                    'Pneumonia Severity:\n',
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text('$_pneumonia_severity', textAlign: TextAlign.center),
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
              Navigator.of(context).pop();
              resetSelection();
            },
          ),
        ],
      );
    },
  );
}

void validateAnswers() {
  if ()
  {
    showErrorDialog();
  } else {
    showResultDialog();
  }
*/