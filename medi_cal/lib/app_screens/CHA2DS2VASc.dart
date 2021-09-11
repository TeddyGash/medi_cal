//import 'dart:html';

import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
import 'package:medi_cal/app_screens/home_screen.dart';
//import 'dart:math';

class CHA2DS2VASc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "CHA2DS2VASc",
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("CHA2DS2VASc Score"),
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
        body: CHA2DS2VAScCore(),
      ),
    );
  }
}

class CHA2DS2VAScCore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.lightBlueAccent,
        child: Center(
            child: Container(
              padding: EdgeInsets.only(top: 0.0),
              alignment: Alignment.center,
              child: InputFields(),
            )));
  }
}

// Define a custom Form widget.
class InputFields extends StatefulWidget {
  @override
  _InputFieldsState createState() => _InputFieldsState();
}

// Define a corresponding State class.
// This class holds data related to the form.
class _InputFieldsState extends State<InputFields> {
  int _radioValue1 = -1;
  int _radioValue2 = -1;
  int _radioValue3 = -1;
  int _radioValue4 = -1;
  int _radioValue5 = -1;
  int _radioValue6 = -1;
  int _radioValue7 = -1;
  int totalScore = 0;
  var _strokeRisk = "";
  String _message = 'Please select as appropriate';

  void _handleRadioValueChange1(int value) {
    setState(() {
      _radioValue1 = value;

      switch (_radioValue1) {
        case 0:
          totalScore++;
          break;
        case 1:
          break;
      }
    });
  }

  void _handleRadioValueChange2(int value) {
    setState(() {
      _radioValue2 = value;

      switch (_radioValue2) {
        case 0:
          totalScore++;
          break;
        case 1:
          break;
      }
    });
  }

  void _handleRadioValueChange3(int value) {
    setState(() {
      _radioValue3 = value;

      switch (_radioValue3) {
        case 0:
          totalScore++;
          break;
        case 1:
          break;
      }
    });
  }

  void _handleRadioValueChange4(int value) {
    setState(() {
      _radioValue4 = value;

      switch (_radioValue4) {
        case 0:
          totalScore++;
          break;
        case 1:
          break;
      }
    });
  }

  void _handleRadioValueChange5(int value) {
    setState(() {
      _radioValue5 = value;

      switch (_radioValue5) {
        case 0:
          totalScore++;
          break;
        case 1:
          break;
      }
    });
  }

  void _handleRadioValueChange6(int value) {
    setState(() {
      _radioValue6 = value;

      switch (_radioValue6) {
        case 0:
          totalScore++;
          break;
        case 1:
          break;
      }
    });
  }

  void _handleRadioValueChange7(int value) {
    setState(() {
      _radioValue7 = value;

      switch (_radioValue7) {
        case 0:
          totalScore++;
          break;
        case 1:
          break;
      }
    });
  }


  @override
  Widget build(BuildContext context) {
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
                            Text(
                              'Select as appropriate',
                              style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.normal),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                            ),
                            Divider(height: 5.0, color: Colors.black),
                            Padding(
                              padding: EdgeInsets.all(2.0),
                            ),
                            Text(
                              '1. Congestive heart failure?',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                              ),
                            ),
                            Flexible(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Radio(
                                      value: 1,
                                      groupValue: _radioValue1,
                                      onChanged: _handleRadioValueChange1,
                                    ),
                                    Text(
                                      'Yes',
                                      style: TextStyle(fontSize: 13.0),
                                    ),
                                    Radio(
                                      value: 0,
                                      groupValue: _radioValue1,
                                      onChanged: _handleRadioValueChange1,
                                    ),
                                    Text(
                                      'No',
                                      style: TextStyle(
                                        fontSize: 13.0,
                                      ),
                                    ),
                                  ],
                                )),
                            Divider(
                              height: 5.0,
                              color: Colors.black,
                            ),
                            Padding(
                              padding: EdgeInsets.all(2.0),
                            ),
                            Text(
                              '2. Hypertension (SBP > 160mmHg)?',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                              ),
                            ),
                            Flexible(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Radio(
                                      value: 1,
                                      groupValue: _radioValue2,
                                      onChanged: _handleRadioValueChange2,
                                    ),
                                    Text(
                                      'Yes',
                                      style: TextStyle(fontSize: 13.0),
                                    ),
                                    Radio(
                                      value: 0,
                                      groupValue: _radioValue2,
                                      onChanged: _handleRadioValueChange2,
                                    ),
                                    Text(
                                      'No',
                                      style: TextStyle(fontSize: 13.0),
                                    ),
                                  ],
                                )),
                            Divider(
                              height: 5.0,
                              color: Colors.black,
                            ),
                            Padding(
                              padding: EdgeInsets.all(2.0),
                            ),
                            Text(
                              '3. Age?',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                              ),
                            ),
                            Expanded(
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Radio(
                                        value: 0,
                                        groupValue: _radioValue3,
                                        onChanged: _handleRadioValueChange3,
                                      ),
                                      Text(
                                        '≤64yrs',
                                        style: TextStyle(fontSize: 13.0),
                                      ),
                                      Radio(
                                        value: 1,
                                        groupValue: _radioValue3,
                                        onChanged: _handleRadioValueChange3,
                                      ),
                                      Text(
                                        '65 to 74 years',
                                        style: TextStyle(fontSize: 13.0),
                                      ),
                                      Radio(
                                        value: 2,
                                        groupValue: _radioValue3,
                                        onChanged: _handleRadioValueChange3,
                                      ),
                                      Text(
                                        '≥75 years',
                                        style: TextStyle(fontSize: 13.0),
                                      ),
                                    ])),
                            Divider(
                              height: 5.0,
                              color: Colors.black,
                            ),
                            Padding(
                              padding: EdgeInsets.all(2.0),
                            ),
                            Text(
                              '4. Diabetes Mellitus?',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                              ),
                            ),
                            Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Radio(
                                      value: 0,
                                      groupValue: _radioValue4,
                                      onChanged: _handleRadioValueChange4,
                                    ),
                                    Text(
                                      'No',
                                      style: TextStyle(fontSize: 13.0),
                                    ),
                                    Radio(
                                      value: 1,
                                      groupValue: _radioValue4,
                                      onChanged: _handleRadioValueChange4,
                                    ),
                                    Text(
                                      'Yes',
                                      style: TextStyle(fontSize: 13.0),
                                    ),
                                  ],
                                )),
                            Divider(
                              height: 5.0,
                              color: Colors.black,
                            ),
                            Padding(
                              padding: EdgeInsets.all(2.0),
                            ),
                            Text(
                              '5. Stroke/Transient Ischemic Attack/Thromboembolic event?', textAlign: TextAlign.center, 
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                              ),
                            ),
                            Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Radio(
                                      value: 2,
                                      groupValue: _radioValue5,
                                      onChanged: _handleRadioValueChange5,
                                    ),
                                    Text(
                                      'Yes',
                                      style: TextStyle(fontSize: 13.0),
                                    ),
                                    Radio(
                                      value: 0,
                                      groupValue: _radioValue5,
                                      onChanged: _handleRadioValueChange5,
                                    ),
                                    Text(
                                      'No',
                                      style: TextStyle(fontSize: 13.0),
                                    ),
                                  ],
                                )),
                            Divider(
                              height: 5.0,
                              color: Colors.black,
                            ),
                            Padding(
                              padding: EdgeInsets.all(2.0),
                            ),
                            Text(
                              '6. Vascular disease (prior MI, PAD, aortic plaque)?', textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                              ),
                            ),
                            Expanded(
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Radio(
                                        value: 1,
                                        groupValue: _radioValue6,
                                        onChanged: _handleRadioValueChange6,
                                      ),
                                      Text(
                                        'Yes',
                                        style: TextStyle(fontSize: 13.0),
                                      ),
                                      Radio(
                                        value: 0,
                                        groupValue: _radioValue6,
                                        onChanged: _handleRadioValueChange6,
                                      ),
                                      Text(
                                        'No',
                                        style: TextStyle(fontSize: 13.0),
                                      )
                                    ])),
                            Divider(
                              height: 5.0,
                              color: Colors.black,
                            ),
                            Padding(
                              padding: EdgeInsets.all(2.0),
                            ),
                            Text(
                              '7. Sex category?',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                              ),
                            ),
                            Expanded(
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Radio(
                                        value: 1,
                                        groupValue: _radioValue7,
                                        onChanged: _handleRadioValueChange7,
                                      ),
                                      Text(
                                        'Female',
                                        style: TextStyle(fontSize: 13.0),
                                      ),
                                      Radio(
                                        value: 0,
                                        groupValue: _radioValue7,
                                        onChanged: _handleRadioValueChange7,
                                      ),
                                      Text(
                                        'Male',
                                        style: TextStyle(fontSize: 13.0),
                                      )
                                    ])),
                            Divider(
                              height: 5.0,
                              color: Colors.black,
                            ),
                            Padding(
                              padding: EdgeInsets.all(2.0),
                            ),
                            ElevatedButton(
                              onPressed: computeScore,
                              child: Text(
                                'Check Final Score',
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
                              child: Text(
                                'Reset Selection',
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 16.0,
                                    color: Colors.white),
                              ),
                            )
                          ],
                        ))))));
  }

  void resetSelection() {
    _handleRadioValueChange1(-1);
    _handleRadioValueChange2(-1);
    _handleRadioValueChange3(-1);
    _handleRadioValueChange4(-1);
    _handleRadioValueChange5(-1);
    _handleRadioValueChange6(-1);
    _handleRadioValueChange7(-1);

    totalScore = 0;
  }

  void computeScore() {
    validateAnswers();
    calculateScore();
    comment();
  }

  void sumAnswers() {
    totalScore = _radioValue1 +
        _radioValue2 +
        _radioValue3 +
        _radioValue4 +
        _radioValue5 +
        _radioValue6 +
        _radioValue7;
  }

  void calculateScore() {
    validateAnswers();
    sumAnswers();
  }

  void comment() {
    if (totalScore == 0) {
      _strokeRisk = 'Low Risk';
    } else if (totalScore == 1) {
      _strokeRisk = 'Intermediate Risk. Aspirin/OAC may be started';
    } else if (totalScore >= 2) {
      _strokeRisk = 'High Risk. \n OAC needed.';
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
          title: Text("CHA2DS2VASc Score:", textAlign: TextAlign.center,
            //overflow: TextOverflow.ellipsis,
            style: TextStyle(fontWeight: FontWeight.bold),),
          content: Container ( height: 150, width: 200,
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text ("$totalScore\n", textAlign: TextAlign.center,
                      //overflow: TextOverflow.ellipsis,
                      style: TextStyle(//fontWeight: FontWeight.bold,
                          fontSize: 25),),
                    Text('Stroke Risk:\n', textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                    Text('$_strokeRisk', textAlign: TextAlign.center),
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
    if (_radioValue1 == -1 ||
        _radioValue2 == -1 ||
        _radioValue3 == -1 ||
        _radioValue4 == -1 ||
        _radioValue5 == -1 ||
        _radioValue6 == -1 ||
        _radioValue7 == -1 ){
      showErrorDialog();
    } else {
      showResultDialog();
    }
/**/
  }
}