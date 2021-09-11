import 'package:flutter/material.dart';
import 'package:medi_cal/app_screens/home_screen.dart';

class WellsScoreDVT extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "WellsScoreDVT",
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Well's Score (DVT)"),
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
        body: WellsScoreDVTCore(),
      ),
    );
  }
}

class WellsScoreDVTCore extends StatelessWidget {
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
  int _radioValue8 = -1;
  int _radioValue9 = -1;
  int _radioValue10 = -1;
  int totalScore = 0;
  var _dvtRisk = "";
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

  void _handleRadioValueChange8(int value) {
    setState(() {
      _radioValue8 = value;

      switch (_radioValue8) {
        case 0:
          totalScore++;
          break;
        case 1:
          break;
      }
    });
  }

  void _handleRadioValueChange9(int value) {
    setState(() {
      _radioValue9 = value;

      switch (_radioValue9) {
        case 0:
          totalScore++;
          break;
        case 1:
          break;
      }
    });
  }

  void _handleRadioValueChange10(int value) {
    setState(() {
      _radioValue10 = value;

      switch (_radioValue10) {
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
                              Expanded(
                                child: ListView(
                                  children: [
                                    Text(
                                      'Select as appropriate',
                                      textAlign: TextAlign.center,
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
                                      '1. Active cancer (patient either receiving treatment for cancer '
                                      'within the previous 6 months or currently receiving palliative treatment)',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15.0,
                                      ),
                                    ),
                                    Flexible(
                                        child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                      '2. Paralysis, paresis, or recent cast immobilization '
                                      'of the lower extremities?',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15.0,
                                      ),
                                    ),
                                    Flexible(
                                        child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                      '3. Recently bedridden for ≥3 days, or major surgery '
                                      'within the previous 12 weeks requiring general or '
                                      'regional anesthesia?',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15.0,
                                      ),
                                    ),
                                    Expanded(
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                          Radio(
                                            value: 1,
                                            groupValue: _radioValue3,
                                            onChanged: _handleRadioValueChange3,
                                          ),
                                          Text(
                                            'Yes',
                                            style: TextStyle(fontSize: 13.0),
                                          ),
                                          Radio(
                                            value: 0,
                                            groupValue: _radioValue3,
                                            onChanged: _handleRadioValueChange3,
                                          ),
                                          Text(
                                            'No',
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
                                      '4. Localized tenderness along the distribution of the deep venous system?',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15.0,
                                      ),
                                    ),
                                    Expanded(
                                        child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Radio(
                                          value: 1,
                                          groupValue: _radioValue4,
                                          onChanged: _handleRadioValueChange4,
                                        ),
                                        Text(
                                          'Yes',
                                          style: TextStyle(fontSize: 13.0),
                                        ),
                                        Radio(
                                          value: 0,
                                          groupValue: _radioValue4,
                                          onChanged: _handleRadioValueChange4,
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
                                      '5. Entire leg swelling?',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15.0,
                                      ),
                                    ),
                                    Expanded(
                                        child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Radio(
                                          value: 1,
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
                                      '6. Calf swelling at least 3 cm larger than that on the '
                                      'asymptomatic side (measured 10 cm below tibial tuberosity)?',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15.0,
                                      ),
                                    ),
                                    Expanded(
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
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
                                      '7. Pitting edema confined to the symptomatic leg?',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15.0,
                                      ),
                                    ),
                                    Expanded(
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                          Radio(
                                            value: 1,
                                            groupValue: _radioValue7,
                                            onChanged: _handleRadioValueChange7,
                                          ),
                                          Text(
                                            'Yes',
                                            style: TextStyle(fontSize: 13.0),
                                          ),
                                          Radio(
                                            value: 0,
                                            groupValue: _radioValue7,
                                            onChanged: _handleRadioValueChange7,
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
                                      '8. Collateral superficial veins (non-varicose)?',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15.0,
                                      ),
                                    ),
                                    Expanded(
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                          Radio(
                                            value: 1,
                                            groupValue: _radioValue8,
                                            onChanged: _handleRadioValueChange8,
                                          ),
                                          Text(
                                            'Yes',
                                            style: TextStyle(fontSize: 13.0),
                                          ),
                                          Radio(
                                            value: 0,
                                            groupValue: _radioValue8,
                                            onChanged: _handleRadioValueChange8,
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
                                      '9. Previously documented deep vein thrombosis?',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15.0,
                                      ),
                                    ),
                                    Expanded(
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                          Radio(
                                            value: 1,
                                            groupValue: _radioValue9,
                                            onChanged: _handleRadioValueChange9,
                                          ),
                                          Text(
                                            'Yes',
                                            style: TextStyle(fontSize: 13.0),
                                          ),
                                          Radio(
                                            value: 0,
                                            groupValue: _radioValue9,
                                            onChanged: _handleRadioValueChange9,
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
                                      '10. Alternative diagnosis at least as likely as deep vein thrombosis?',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15.0,
                                      ),
                                    ),
                                    Expanded(
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                          Radio(
                                            value: -2,
                                            groupValue: _radioValue10,
                                            onChanged: _handleRadioValueChange10,
                                          ),
                                          Text(
                                            'Yes',
                                            style: TextStyle(fontSize: 13.0),
                                          ),
                                          Radio(
                                            value: 0,
                                            groupValue: _radioValue10,
                                            onChanged: _handleRadioValueChange10,
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
                                ),
                              )
                            ]))))));
  }

  void resetSelection() {
    _handleRadioValueChange1(-1);
    _handleRadioValueChange2(-1);
    _handleRadioValueChange3(-1);
    _handleRadioValueChange4(-1);
    _handleRadioValueChange5(-1);
    _handleRadioValueChange6(-1);
    _handleRadioValueChange7(-1);
    _handleRadioValueChange8(-1);
    _handleRadioValueChange9(-1);
    _handleRadioValueChange10(-1);
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
        _radioValue7 +
        _radioValue8 +
        _radioValue9 +
        _radioValue10;
  }

  void calculateScore() {
    validateAnswers();
    sumAnswers();
  }

  void comment() {
    if (totalScore == 0 || totalScore == -1 || totalScore == -2) {
      _dvtRisk = 'Low Risk';
    } else if (totalScore == 1 || totalScore == 2) {
      _dvtRisk = 'Intermediate Risk';
    } else if (totalScore >= 2) {
      _dvtRisk = 'High Risk';
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
            "Well's Score(DVT):", textAlign: TextAlign.center,
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
                      'DVT Risk:\n',
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text('$_dvtRisk', textAlign: TextAlign.center),
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
        _radioValue7 == -1 ||
        _radioValue6 == -1 ||
        _radioValue6 == -1 ||
        _radioValue7 == -1) {
      showErrorDialog();
    } else {
      showResultDialog();
    }
/**/
  }
}
