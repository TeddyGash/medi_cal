import 'package:flutter/material.dart';
import 'package:medi_cal/widget/customRadio.dart';
import 'package:medi_cal/widget/customWidgets.dart';

class HASBLED extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomAppView(
      pageTitle: 'HASBLED Score',
      appBarTitle: CustomAppBarLabel(
        label: "HASBLED Score",
      ),
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
  //final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  int _responseHPT = -1;
  int _responseRFT = -1;
  int _responseLFT = -1;
  int _responseAge = -1;
  int _responseStroke = -1;
  int _responseBleeding = -1;
  int _responseDrugs = -1;
  int _responseAlcohol = -1;
  int _responseINR = -1;
  int totalScore = 0;
  var _bleedingRisk = "";

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
                              '1. Hypertension (SBP > 160mmHg)?',
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
                                groupValue: _responseHPT,
                                answer: 'Yes',
                                //title: Text('One'),
                                onChanged: (value) => setState(() => _responseHPT = value),
                              ),
                              MyRadioListTile(
                                value: 0,
                                groupValue: _responseHPT,
                                answer: 'No',
                                //title: Text('Two'),
                                onChanged: (value) => setState(() => _responseHPT = value),
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
                              '2. Abnormal Renal Function?',
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
                                  groupValue: _responseRFT,
                                  answer: 'Yes',
                                  //title: Text('One'),
                                  onChanged: (value) => setState(() => _responseRFT = value),
                                ),
                                MyRadioListTile(
                                  value: 0,
                                  groupValue: _responseRFT,
                                  answer: 'No',
                                  //title: Text('Two'),
                                  onChanged: (value) => setState(() => _responseRFT = value),
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
                              '3. Abnormal Liver Function?',
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
                                  groupValue: _responseLFT,
                                  answer: 'Yes',
                                  //title: Text('One'),
                                  onChanged: (value) => setState(() => _responseLFT = value),
                                ),
                                MyRadioListTile(
                                  value: 0,
                                  groupValue: _responseLFT,
                                  answer: 'No',
                                  //title: Text('Two'),
                                  onChanged: (value) => setState(() => _responseLFT = value),
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
                              '4. Age?',
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
                                  answer: '>65yrs',
                                  //title: Text('One'),
                                  onChanged: (value) => setState(() => _responseAge = value),
                                ),
                                MyRadioListTile(
                                  value: 0,
                                  groupValue: _responseAge,
                                  answer: '≤65',
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
                            Text(
                              '5. Previous Stroke?',
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
                                  groupValue: _responseStroke,
                                  answer: 'Yes',
                                  //title: Text('One'),
                                  onChanged: (value) => setState(() => _responseStroke = value),
                                ),
                                MyRadioListTile(
                                  value: 0,
                                  groupValue: _responseStroke,
                                  answer: 'No',
                                  //title: Text('Two'),
                                  onChanged: (value) => setState(() => _responseStroke = value),
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
                              '6. Prior major bleeding/Predisposition?',
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
                                  groupValue: _responseBleeding,
                                  answer: 'Yes',
                                  //title: Text('One'),
                                  onChanged: (value) => setState(() => _responseBleeding = value),
                                ),
                                MyRadioListTile(
                                  value: 0,
                                  groupValue: _responseBleeding,
                                  answer: 'No',
                                  //title: Text('Two'),
                                  onChanged: (value) => setState(() => _responseBleeding = value),
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
                              '7. Taking drugs likely to cause bleeding?',
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
                                  groupValue: _responseDrugs,
                                  answer: 'Yes',
                                  //title: Text('One'),
                                  onChanged: (value) => setState(() => _responseDrugs = value),
                                ),
                                MyRadioListTile(
                                  value: 0,
                                  groupValue: _responseDrugs,
                                  answer: 'No',
                                  //title: Text('Two'),
                                  onChanged: (value) => setState(() => _responseDrugs = value),
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
                              '8. Alcohol use?',
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
                                  groupValue: _responseAlcohol,
                                  answer: 'Yes',
                                  //title: Text('One'),
                                  onChanged: (value) => setState(() => _responseAlcohol = value),
                                ),
                                MyRadioListTile(
                                  value: 0,
                                  groupValue: _responseAlcohol,
                                  answer: 'No',
                                  //title: Text('Two'),
                                  onChanged: (value) => setState(() => _responseAlcohol = value),
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
                              '9. Labile INR?',
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
                                  groupValue: _responseINR,
                                  answer: 'Yes',
                                  //title: Text('One'),
                                  onChanged: (value) => setState(() => _responseINR = value),
                                ),
                                MyRadioListTile(
                                  value: 0,
                                  groupValue: _responseINR,
                                  answer: 'No',
                                  //title: Text('Two'),
                                  onChanged: (value) => setState(() => _responseINR = value),
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

  void resetSelection() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => HASBLED()));
  }

  void computeScore() {
    validateAnswers();
    sumAnswers();
    comment();
  }

  void sumAnswers() {
    totalScore = _responseHPT +
        _responseRFT +
        _responseLFT +
        _responseAge +
        _responseStroke +
        _responseBleeding +
        _responseDrugs +
        _responseAlcohol +
        _responseINR;
  }

  void comment() {
    if (totalScore == 1|| totalScore == 0) {
      _bleedingRisk = 'Low Risk';
    } else if (totalScore == 2) {
      _bleedingRisk = 'Intermediate Risk';
    } else if (totalScore >= 3) {
      _bleedingRisk = 'High Risk';
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
          title: Text("HASBLED Score:", textAlign: TextAlign.center,
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
                    Text('Bleeding Risk:\n', textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                    Text('$_bleedingRisk', textAlign: TextAlign.center),
              ])),
        );
      },
    );
  }

  void validateAnswers() {
    if (_responseHPT == -1 ||
        _responseRFT == -1 ||
        _responseLFT == -1 ||
        _responseAge == -1 ||
        _responseStroke == -1 ||
        _responseBleeding == -1 ||
        _responseDrugs == -1 ||
        _responseAlcohol == -1 ||
        _responseINR == -1) {
      showErrorDialog();
    } else {
      showResultDialog();
    }
  }
}
