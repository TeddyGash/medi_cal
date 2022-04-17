import 'package:flutter/material.dart';
import 'package:medi_cal/app_screens/home_screen.dart';
import 'package:medi_cal/widget/customRadio.dart';
import 'package:medi_cal/widget/customWidgets.dart';

class WellsScorePE extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomAppView(
      pageTitle: 'WellsScore(PE)',
      appBarTitle: CustomAppBarLabel(label: "WellsScore(PE)",),
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
  double _responsePrevVTE = -1.0;
  double _responseTachycardia = -1.0;
  double _responseSurgeryImmobilised = -1.0;
  double _responseDVT = -1.0;
  double _responseAltDiag = -1.0;
  double _responseHaemoptysis = -1.0;
  double _responseCancer = -1.0;
  double totalScore = 0.0;
  var _peRisk = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        //key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: <Widget>[
            Text(
              'Select as appropriate',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.normal),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyRadioListTile(
                  value: 1.5,
                  groupValue: _responsePrevVTE,
                  answer: 'Yes',
                  //title: Text('One'),
                  onChanged: (value) =>
                      setState(() => _responsePrevVTE = value),
                ),
                MyRadioListTile(
                  value: 0.0,
                  groupValue: _responsePrevVTE,
                  answer: 'No',
                  //title: Text('Two'),
                  onChanged: (value) =>
                      setState(() => _responsePrevVTE = value),
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
              '2. Heart rate >100bpm?',
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
                  value: 1.5,
                  groupValue: _responseTachycardia,
                  answer: 'Yes',
                  //title: Text('One'),
                  onChanged: (value) =>
                      setState(() => _responseTachycardia = value),
                ),
                MyRadioListTile(
                  value: 0.0,
                  groupValue: _responseTachycardia,
                  answer: 'No',
                  //title: Text('Two'),
                  onChanged: (value) =>
                      setState(() => _responseTachycardia = value),
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
              '3. Recent surgery or immobilization (within the last 30 days)?',
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
                  value: 1.5,
                  groupValue: _responseSurgeryImmobilised,
                  answer: 'Yes',
                  //title: Text('One'),
                  onChanged: (value) =>
                      setState(() => _responseSurgeryImmobilised = value),
                ),
                MyRadioListTile(
                  value: 0.0,
                  groupValue: _responseSurgeryImmobilised,
                  answer: 'No',
                  //title: Text('Two'),
                  onChanged: (value) =>
                      setState(() => _responseSurgeryImmobilised = value),
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
              '4. Clinical signs of deep vein thrombosis?',
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
                  value: 3.0,
                  groupValue: _responseDVT,
                  answer: 'Yes',
                  //title: Text('One'),
                  onChanged: (value) => setState(() => _responseDVT = value),
                ),
                MyRadioListTile(
                  value: 0.0,
                  groupValue: _responseDVT,
                  answer: 'No',
                  //title: Text('Two'),
                  onChanged: (value) => setState(() => _responseDVT = value),
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
              '5. Alternative diagnosis less likely than pulmonary embolism?',
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
                  value: 3.0,
                  groupValue: _responseAltDiag,
                  answer: 'Yes',
                  //title: Text('One'),
                  onChanged: (value) =>
                      setState(() => _responseAltDiag = value),
                ),
                MyRadioListTile(
                  value: 0.0,
                  groupValue: _responseAltDiag,
                  answer: 'No',
                  //title: Text('Two'),
                  onChanged: (value) =>
                      setState(() => _responseAltDiag = value),
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
              '6. Hemoptysis?',
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
                  value: 1.0,
                  groupValue: _responseHaemoptysis,
                  answer: 'Yes',
                  //title: Text('One'),
                  onChanged: (value) =>
                      setState(() => _responseHaemoptysis = value),
                ),
                MyRadioListTile(
                  value: 0.0,
                  groupValue: _responseHaemoptysis,
                  answer: 'No',
                  //title: Text('Two'),
                  onChanged: (value) =>
                      setState(() => _responseHaemoptysis = value),
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
              '7. Cancer (treated within the last 6 months)?',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15.0,
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyRadioListTile(
                  value: 1.0,
                  groupValue: _responseCancer,
                  answer: 'Yes',
                  //title: Text('One'),
                  onChanged: (value) => setState(() => _responseCancer = value),
                ),
                MyRadioListTile(
                  value: 0.0,
                  groupValue: _responseCancer,
                  answer: 'No',
                  //title: Text('Two'),
                  onChanged: (value) => setState(() => _responseCancer = value),
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
      ),
    );
  }


  void resetSelection() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => WellsScorePE()));
  }

  void computeScore() {
    validateAnswers();
    sumAnswers();
    comment();
  }

  void validateAnswers() {
    if (_responsePrevVTE == -1 ||
        _responseTachycardia == -1 ||
        _responseSurgeryImmobilised == -1 ||
        _responseDVT == -1 ||
        _responseAltDiag == -1 ||
        _responseHaemoptysis == -1 ||
        _responseCancer == -1) {
      showErrorDialog();
    } else {
      showResultDialog();
    }
  }

  void sumAnswers() {
    totalScore = _responsePrevVTE +
        _responseTachycardia +
        _responseSurgeryImmobilised +
        _responseDVT +
        _responseAltDiag +
        _responseHaemoptysis +
        _responseCancer;
  }

  void comment() {
    if (totalScore < 2) {
      _peRisk = 'Low Risk';
    } else if (totalScore < 6.0) {
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
            "Well's Score (PE):", textAlign: TextAlign.center,
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
        );
      },
    );
  }

}



