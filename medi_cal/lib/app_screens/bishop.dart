import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medi_cal/app_screens/home_screen.dart';
import 'dart:math';

class BISHOP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "BISHOP SCORE",
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("BISHOP Score"),
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
        body: BISHOPCore(),
      ),
    );
  }
}

class BISHOPCore extends StatelessWidget {
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
  int totalScore = 0;
  var _comment = "";
  //String _message = 'Please select as appropriate';

  void _handleRadioValueChange1(int value) {
    setState(() {
      _radioValue1 = value;
    });
  }

  void _handleRadioValueChange2(int value) {
    setState(() {
      _radioValue2 = value;
    });
  }

  void _handleRadioValueChange3(int value) {
    setState(() {
      _radioValue3 = value;
    });
  }

  void _handleRadioValueChange4(int value) {
    setState(() {
      _radioValue4 = value;
    });
  }

  void _handleRadioValueChange5(int value) {
    setState(() {
      _radioValue5 = value;
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
                                    Text(
                                      '1. Cervical Position?',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15.0,
                                      ),
                                    ),
                                    Flexible(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            Row(
                                              //mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                             Radio(
                                              value: 0,
                                              groupValue: _radioValue1,
                                              onChanged: _handleRadioValueChange1,
                                            ),
                                             Text(
                                              'Posterior',
                                              style: TextStyle(fontSize: 13.0),
                                            ),],),
                                            Row(
                                              children: [
                                                Radio(
                                                  value: 1,
                                                  groupValue: _radioValue1,
                                                  onChanged: _handleRadioValueChange1,
                                                ),
                                                Text(
                                                  'Central',
                                                  style: TextStyle(fontSize: 13.0),
                                                ),],),
                                            Row(
                                              children: [
                                                Radio(
                                                  value: 2,
                                                  groupValue: _radioValue1,
                                                  onChanged: _handleRadioValueChange1,
                                                ),
                                                Text(
                                                  'Anterior',
                                                  style: TextStyle(fontSize: 13.0),
                                                ),],),
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
                                      '2. Cervical Consistency?',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15.0,
                                      ),
                                    ),
                                    Flexible(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            Row(
                                              children: [
                                                Radio(
                                                  value: 0,
                                                  groupValue: _radioValue2,
                                                  onChanged: _handleRadioValueChange2,
                                                ),
                                                Text(
                                                  'Firm',
                                                  style: TextStyle(fontSize: 13.0),
                                                ),],),
                                            Row(
                                              children: [
                                                Radio(
                                                  value: 1,
                                                  groupValue: _radioValue2,
                                                  onChanged: _handleRadioValueChange2,
                                                ),
                                                Text(
                                                  'Medium',
                                                  style: TextStyle(fontSize: 13.0),
                                                ),],),
                                            Row(
                                              children: [
                                                Radio(
                                                  value: 2,
                                                  groupValue: _radioValue2,
                                                  onChanged: _handleRadioValueChange2,
                                                ),
                                                Text(
                                                  'Soft',
                                                  style: TextStyle(fontSize: 13.0),
                                                ),],),
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
                                      '3. Cervical Effacement?',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15.0,
                                      ),
                                    ),
                                    Expanded(
                                        child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Row(
                                                children: [
                                                  Radio(
                                                    value: 0,
                                                    groupValue: _radioValue3,
                                                    onChanged: _handleRadioValueChange3,
                                                  ),
                                                  Text(
                                                    '0-30%',
                                                    style: TextStyle(fontSize: 13.0),
                                                  ),],),
                                              Row(
                                                children: [
                                                  Radio(
                                                    value: 1,
                                                    groupValue: _radioValue3,
                                                    onChanged: _handleRadioValueChange3,
                                                  ),
                                                  Text(
                                                    '40-50%',
                                                    style: TextStyle(fontSize: 13.0),
                                                  ),],),
                                              Row(
                                                children: [
                                                  Radio(
                                                    value: 2,
                                                    groupValue: _radioValue3,
                                                    onChanged: _handleRadioValueChange3,
                                                  ),
                                                  Text(
                                                    '60-70%',
                                                    style: TextStyle(fontSize: 13.0),
                                                  ),],),
                                              Row(
                                                children: [
                                                  Radio(
                                                    value: 3,
                                                    groupValue: _radioValue3,
                                                    onChanged: _handleRadioValueChange3,
                                                  ),
                                                  Text(
                                                    '≥80%',
                                                    style: TextStyle(fontSize: 13.0),
                                                  ),],),
                                            ])),
                                    Divider(
                                      height: 5.0,
                                      color: Colors.black,
                                    ),
                                    Text(
                                      '4. Cervical Dilatation?',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15.0,
                                      ),
                                    ),
                                    Expanded(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            Row(
                                              children: [
                                                Radio(
                                                  value: 0,
                                                  groupValue: _radioValue4,
                                                  onChanged: _handleRadioValueChange4,
                                                ),
                                                Text(
                                                  '0cm',
                                                  style: TextStyle(fontSize: 13.0),
                                                ),],),
                                            Row(
                                              children: [
                                                Radio(
                                                  value: 1,
                                                  groupValue: _radioValue4,
                                                  onChanged: _handleRadioValueChange4,
                                                ),
                                                Text(
                                                  '1-2cm',
                                                  style: TextStyle(fontSize: 13.0),
                                                ),],),
                                            Row(
                                              children: [
                                                Radio(
                                                  value: 2,
                                                  groupValue: _radioValue4,
                                                  onChanged: _handleRadioValueChange4,
                                                ),
                                                Text(
                                                  '3-4cm',
                                                  style: TextStyle(fontSize: 13.0),
                                                ),],),
                                            Row(
                                              children: [
                                                Radio(
                                                  value: 3,
                                                  groupValue: _radioValue4,
                                                  onChanged: _handleRadioValueChange4,
                                                ),
                                                Text(
                                                  '≥5cm',
                                                  style: TextStyle(fontSize: 13.0),
                                                ),],),
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
                                      '5. Fetal Station?',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15.0,
                                      ),
                                    ),
                                    Expanded(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            Row(
                                              children: [
                                                Radio(
                                                  value: 0,
                                                  groupValue: _radioValue5,
                                                  onChanged: _handleRadioValueChange5,
                                                ),
                                                Text(
                                                  '-3',
                                                  style: TextStyle(fontSize: 13.0),
                                                ),],),
                                            Row(
                                              children: [
                                                Radio(
                                                  value: 1,
                                                  groupValue: _radioValue5,
                                                  onChanged: _handleRadioValueChange5,
                                                ),
                                                Text(
                                                  '-2',
                                                  style: TextStyle(fontSize: 13.0),
                                                ),],),
                                            Row(
                                              children: [
                                                Radio(
                                                  value: 2,
                                                  groupValue: _radioValue5,
                                                  onChanged: _handleRadioValueChange5,
                                                ),
                                                Text(
                                                  '-1 or 0',
                                                  style: TextStyle(fontSize: 13.0),
                                                ),],),
                                            Row(
                                              children: [
                                                Radio(
                                                  value: 3,
                                                  groupValue: _radioValue5,
                                                  onChanged: _handleRadioValueChange5,
                                                ),
                                                Text(
                                                  '+1 or +3',
                                                  style: TextStyle(fontSize: 13.0),
                                                ),],),
                                          ],
                                        )),
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
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.redAccent,),
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
        _radioValue5 ;
  }

  void calculateScore() {
    validateAnswers();
    sumAnswers();
  }

  void comment() {
    if (0 <= totalScore && totalScore <= 4) {
      _comment = 'Unfavourable Cervix';
    } else if (5 <= totalScore && totalScore <= 6 ) {
      _comment = 'Intermediate';
    } else if (totalScore >= 7) {
      _comment = 'Favourable Cervix';
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
          title: Text("Bishop Score:", textAlign: TextAlign.center,
            //overflow: TextOverflow.ellipsis,
            style: TextStyle(fontWeight: FontWeight.bold),),
          content: Container ( height: 150, width: 200,
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text ("$totalScore/13\n", textAlign: TextAlign.center,
                      //overflow: TextOverflow.ellipsis,
                      style: TextStyle(//fontWeight: FontWeight.bold,
                          fontSize: 25),),
                    Text('Comment:\n', textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                    Text('$_comment', textAlign: TextAlign.center),
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
        _radioValue5 == -1 ) {
      showErrorDialog();
    } else {
      showResultDialog();
    }
  }
}
