import 'package:flutter/material.dart';
import 'package:medi_cal/app_screens/home_screen.dart';
import 'package:medi_cal/widget/customRadio.dart';
import 'package:medi_cal/widget/customWidgets.dart';

class CURB65 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomAppView(
      pageTitle: 'CURB-65 Score',
      label: "CURB-65 Score",
      backButtonDestination: HomeScreen(),
      pageBody: InputFields(),
    );
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
  int _responseConfusion = -1;
  int _responseUrea = -1;
  int _responseResp = -1;
  int _responseHypotension = -1;
  int _responseAge = -1;
  int totalScore = 0;
  var _pneumoniaSeverity = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
          //key: _formKey,
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
                '1. Confusion?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyRadioListTile(
                    value: 1,
                    groupValue: _responseConfusion,
                    answer: 'Yes',
                    //title: Text('One'),
                    onChanged: (value) => setState(() => _responseConfusion = value),
                  ),
                  MyRadioListTile(
                    value: 0,
                    groupValue: _responseConfusion,
                    answer: 'No',
                    //title: Text('Two'),
                    onChanged: (value) => setState(() => _responseConfusion = value),
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
                '2. Serum Urea >7mmol/L?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyRadioListTile(
                    value: 1,
                    groupValue: _responseUrea,
                    answer: 'Yes',
                    //title: Text('One'),
                    onChanged: (value) => setState(() => _responseUrea = value),
                  ),
                  MyRadioListTile(
                    value: 0,
                    groupValue: _responseUrea,
                    answer: 'No',
                    //title: Text('Two'),
                    onChanged: (value) => setState(() => _responseUrea = value),
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
                '3. Respiratory rate ≥30cpm?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyRadioListTile(
                    value: 1,
                    groupValue: _responseResp,
                    answer: 'Yes',
                    //title: Text('One'),
                    onChanged: (value) => setState(() => _responseResp = value),
                  ),
                  MyRadioListTile(
                    value: 0,
                    groupValue: _responseResp,
                    answer: 'No',
                    //title: Text('Two'),
                    onChanged: (value) => setState(() => _responseResp = value),
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
                '4. SBP ≤ 90mmHg or DBP ≤ 60mmHg?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyRadioListTile(
                    value: 1,
                    groupValue: _responseHypotension,
                    answer: 'Yes',
                    //title: Text('One'),
                    onChanged: (value) => setState(() => _responseHypotension = value),
                  ),
                  MyRadioListTile(
                    value: 0,
                    groupValue: _responseHypotension,
                    answer: 'No',
                    //title: Text('Two'),
                    onChanged: (value) => setState(() => _responseHypotension = value),
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
                '5. Age >65years?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyRadioListTile(
                    value: 1,
                    groupValue: _responseAge,
                    answer: 'Yes',
                    //title: Text('One'),
                    onChanged: (value) => setState(() => _responseAge = value),
                  ),
                  MyRadioListTile(
                    value: 0,
                    groupValue: _responseAge,
                    answer: 'No',
                    //title: Text('Two'),
                    onChanged: (value) => setState(() => _responseAge = value),
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
                onPressed:resetSelection,
                style: ElevatedButton.styleFrom(
                    primary: Colors.redAccent),
                child: Text(
                  'Reset Selection',
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.normal,
                      color: Colors.white),
                ),
              ),
            ],
          ),
        ));
  }


  void resetSelection() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => CURB65()));
  }

  void computeScore() {
    validateAnswers();
    sumAnswers();
    comment();
  }

  void validateAnswers() {
    if (_responseConfusion == -1 ||
        _responseUrea == -1 ||
        _responseResp == -1 ||
        _responseHypotension == -1 ||
        _responseAge == -1)
    {
      showErrorDialog();
    } else {
      showResultDialog();
    }
/**/
  }

  void sumAnswers() {
    totalScore = _responseConfusion +
        _responseUrea +
        _responseResp +
        _responseHypotension +
        _responseAge ;
  }

  void comment() {
    if (totalScore == 0 || totalScore == 1 ) {
      _pneumoniaSeverity = 'MILD; consider OPD mgt.';
    } else if (totalScore ==2 ) {
      _pneumoniaSeverity = 'MODERATE; consider in-patient mgt';
    } else if (totalScore > 2) {
      _pneumoniaSeverity = 'SEVERE; requires admission';
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
                    Text('$_pneumoniaSeverity', textAlign: TextAlign.center),
                  ])),
        );
      },
    );
  }
}
