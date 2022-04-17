import 'package:flutter/material.dart';
import 'package:medi_cal/app_screens/home_screen.dart';
import 'package:medi_cal/widget/customRadio.dart';
import 'package:medi_cal/widget/customWidgets.dart';

class GCS extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomAppView(
      pageTitle: 'GCS Score',
      appBarTitle: CustomAppBarLabel(label: "GCS Score",),
      backButtonDestination: HomeScreen(),
      pageBody: InputFields(),
    );
  }
}

/// Input Display that receives user's inputs.
class InputFields extends StatefulWidget {
  @override
  _InputFieldsState createState() => _InputFieldsState();
}

// Define a corresponding State class.
// This class holds data related to the form.
class _InputFieldsState extends State<InputFields> {
  int _responseEye = -1;
  int _responseVerbal = -1;
  int _responseMotor = -1;
  int totalScore = 0;
  var _comaStatus = "";

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
                                      'EYE OPENING',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15.0,
                                      ),
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        MyRadioListTile(
                                          value: 4,
                                          groupValue: _responseEye,
                                          answer: 'Opens eyes spontaneously',
                                          //title: Text('One'),
                                          onChanged: (value) =>
                                              setState(() => _responseEye = value),
                                        ),
                                        MyRadioListTile(
                                          value: 3,
                                          groupValue: _responseEye,
                                          answer: 'Opens to speech',
                                          //title: Text('Two'),
                                          onChanged: (value) =>
                                              setState(() => _responseEye = value),
                                        ),
                                        MyRadioListTile(
                                          value: 2,
                                          groupValue: _responseEye,
                                          answer: 'Opens to pain',
                                          //title: Text('Two'),
                                          onChanged: (value) =>
                                              setState(() => _responseEye = value),
                                        ),
                                        MyRadioListTile(
                                          value: 1,
                                          groupValue: _responseEye,
                                          answer: 'No eye opening',
                                          //title: Text('Two'),
                                          onChanged: (value) =>
                                              setState(() => _responseEye = value),
                                        ),
                                      ],
                                    ),
                                    Divider(
                                      height: 5.0,
                                      color: Colors.black,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(2.0),
                                    ),
                                    Text(
                                      'VERBAL RESPONSE',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15.0,
                                      ),
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        MyRadioListTile(
                                          value: 5,
                                          groupValue: _responseVerbal,
                                          answer: 'Well-oriented in TPP',
                                          //title: Text('One'),
                                          onChanged: (value) =>
                                              setState(() => _responseVerbal = value),
                                        ),
                                        MyRadioListTile(
                                          value: 4,
                                          groupValue: _responseVerbal,
                                          answer: 'Confused conversation',
                                          //title: Text('Two'),
                                          onChanged: (value) =>
                                              setState(() => _responseVerbal = value),
                                        ),
                                        MyRadioListTile(
                                          value: 3,
                                          groupValue: _responseVerbal,
                                          answer: 'Inappropriate words',
                                          //title: Text('Two'),
                                          onChanged: (value) =>
                                              setState(() => _responseVerbal = value),
                                        ),
                                        MyRadioListTile(
                                          value: 2,
                                          groupValue: _responseVerbal,
                                          answer: 'Incomprehensible sounds',
                                          //title: Text('Two'),
                                          onChanged: (value) =>
                                              setState(() => _responseVerbal = value),
                                        ),
                                        MyRadioListTile(
                                          value: 1,
                                          groupValue: _responseVerbal,
                                          answer: 'No verbal response',
                                          //title: Text('Two'),
                                          onChanged: (value) =>
                                              setState(() => _responseVerbal = value),
                                        ),
                                      ],
                                    ),
                                    Divider(
                                      height: 5.0,
                                      color: Colors.black,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(2.0),
                                    ),
                                    Text(
                                      'BEST MOTOR RESPONSE',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15.0,
                                      ),
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        MyRadioListTile(
                                          value: 6,
                                          groupValue: _responseMotor,
                                          answer: 'Obeys commands',
                                          //title: Text('One'),
                                          onChanged: (value) =>
                                              setState(() => _responseMotor = value),
                                        ),
                                        MyRadioListTile(
                                          value: 5,
                                          groupValue: _responseMotor,
                                          answer: 'Localises pain',
                                          //title: Text('Two'),
                                          onChanged: (value) =>
                                              setState(() => _responseMotor = value),
                                        ),
                                        MyRadioListTile(
                                          value: 4,
                                          groupValue: _responseMotor,
                                          answer: 'Withdraws from pain',
                                          //title: Text('Two'),
                                          onChanged: (value) =>
                                              setState(() => _responseMotor = value),
                                        ),
                                        MyRadioListTile(
                                          value: 3,
                                          groupValue: _responseMotor,
                                          answer: 'Abnormal flexion (decorticate)',
                                          //title: Text('Two'),
                                          onChanged: (value) =>
                                              setState(() => _responseMotor = value),
                                        ),
                                        MyRadioListTile(
                                          value: 2,
                                          groupValue: _responseMotor,
                                          answer: 'Abnormal extension (decerebrate)',
                                          //title: Text('Two'),
                                          onChanged: (value) =>
                                              setState(() => _responseMotor = value),
                                        ),
                                        MyRadioListTile(
                                          value: 1,
                                          groupValue: _responseMotor,
                                          answer: 'No movement',
                                          //title: Text('Two'),
                                          onChanged: (value) =>
                                              setState(() => _responseMotor = value),
                                        ),
                                      ],
                                    ),
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


  ///Methods
  void resetSelection() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => GCS()));
  }

  void computeScore() {
    validateAnswers();
    sumAnswers();
    comment();
  }

  void sumAnswers() {
    totalScore = _responseEye +
        _responseVerbal +
        _responseMotor ;
  }

  void comment() {
    if (3 <= totalScore && totalScore <= 8) {
      _comaStatus = 'Severe/Coma';
    } else if (9 <= totalScore && totalScore <= 12 ) {
      _comaStatus = 'Moderate';
    } else if (totalScore >= 13) {
      _comaStatus = 'Mild';
    }
  }

  void showErrorDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return ErrorDialog();
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
          title: Text("GCS Score:", textAlign: TextAlign.center,
            //overflow: TextOverflow.ellipsis,
            style: TextStyle(fontWeight: FontWeight.bold),),
          content: Container ( height: 150, width: 200,
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text ("$totalScore/15\n", textAlign: TextAlign.center,
                      //overflow: TextOverflow.ellipsis,
                      style: TextStyle(//fontWeight: FontWeight.bold,
                          fontSize: 25),),
                    Text('Comment:\n', textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                    Text('$_comaStatus', textAlign: TextAlign.center),
                  ])),
        );
      },
    );
  }

  void validateAnswers() {
    if (_responseEye == -1 ||
        _responseVerbal == -1 ||
        _responseMotor == -1 ) {
      showErrorDialog();
    } else {
      showResultDialog();
    }
  }
}
