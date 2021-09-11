import 'package:flutter/material.dart';
import 'package:medi_cal/app_screens/home_screen.dart';

class WellsScorePE extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "WellsScorePE",
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Well's Score (PE)"),
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
        body: WellsScorePECore(),
      ),
    );
  }
}

class WellsScorePECore extends StatelessWidget {
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
  double _radioValue1 = -1.0;
  double _radioValue2 = -1.0;
  double _radioValue3 = -1.0;
  double _radioValue4 = -1.0;
  double _radioValue5 = -1.0;
  double _radioValue6 = -1.0;
  double _radioValue7 = -1.0;
  double totalScore = 0.0;
  var _peRisk = "";
  //String _message = 'Please select as appropriate';

  void _handleRadioValueChange1(double value) {
    setState(() {
       _radioValue1 = value;
    });
  }

  void _handleRadioValueChange2(double value) {
    setState(() {
      _radioValue2 = value;
    });
  }

  void _handleRadioValueChange3(double value) {
    setState(() {
      _radioValue3 = value;
    });
  }

  void _handleRadioValueChange4(double value) {
    setState(() {
      _radioValue4 = value;
    });
  }

  void _handleRadioValueChange5(double value) {
    setState(() {
      _radioValue5 = value;
    });
  }

  void _handleRadioValueChange6(double value) {
    setState(() {
      _radioValue6 = value;
    });
  }

  void _handleRadioValueChange7(double value) {
    setState(() {
      _radioValue7 = value;
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
                                      '1. Previous pulmonary embolism or deep vein thrombosis?',
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
                                              value: 1.5,
                                              groupValue: _radioValue1,
                                              onChanged: _handleRadioValueChange1,
                                            ),
                                            Text(
                                              'Yes',
                                              style: TextStyle(fontSize: 13.0),
                                            ),
                                            Radio(
                                              value: 0.0,
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
                                      '2. Heart rate >100bpm?',
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
                                              value: 1.5,
                                              groupValue: _radioValue2,
                                              onChanged: _handleRadioValueChange2,
                                            ),
                                            Text(
                                              'Yes',
                                              style: TextStyle(fontSize: 13.0),
                                            ),
                                            Radio(
                                              value: 0.0,
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
                                      '3. Recent surgery or immobilization (within the last 30 days)?',
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
                                                value: 1.5,
                                                groupValue: _radioValue3,
                                                onChanged: _handleRadioValueChange3,
                                              ),
                                              Text(
                                                'Yes',
                                                style: TextStyle(fontSize: 13.0),
                                              ),
                                              Radio(
                                                value: 0.0,
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
                                      '4. Clinical signs of deep vein thrombosis?',
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
                                              value: 3.0,
                                              groupValue: _radioValue4,
                                              onChanged: _handleRadioValueChange4,
                                            ),
                                            Text(
                                              'Yes',
                                              style: TextStyle(fontSize: 13.0),
                                            ),
                                            Radio(
                                              value: 0.0,
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
                                      '5. Alternative diagnosis less likely than pulmonary embolism?',
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
                                              value: 3.0,
                                              groupValue: _radioValue5,
                                              onChanged: _handleRadioValueChange5,
                                            ),
                                            Text(
                                              'Yes',
                                              style: TextStyle(fontSize: 13.0),
                                            ),
                                            Radio(
                                              value: 0.0,
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
                                      '6. Hemoptysis?',
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
                                                value: 1.0,
                                                groupValue: _radioValue6,
                                                onChanged: _handleRadioValueChange6,
                                              ),
                                              Text(
                                                'Yes',
                                                style: TextStyle(fontSize: 13.0),
                                              ),
                                              Radio(
                                                value: 0.0,
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
                                      '7. Cancer (treated within the last 6 months)?',
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
                                                value: 1.0,
                                                groupValue: _radioValue7,
                                                onChanged: _handleRadioValueChange7,
                                              ),
                                              Text(
                                                'Yes',
                                                style: TextStyle(fontSize: 13.0),
                                              ),
                                              Radio(
                                                value: 0.0,
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
    if (totalScore == 0 || totalScore == 1 ) {
      _peRisk = 'Low Risk';
    } else if (2.0 <= totalScore && totalScore < 6.0 ) {
      _peRisk = 'Intermediate Risk';
    } else if (totalScore >= 6) {
      _peRisk = 'High Risk';
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
            "Well's Score(PE):", textAlign: TextAlign.center,
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
                      'PE Risk:\n',
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text('$_peRisk', textAlign: TextAlign.center),
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
        _radioValue7 == -1)
        {
      showErrorDialog();
    } else {
      showResultDialog();
    }
/**/
  }
}
