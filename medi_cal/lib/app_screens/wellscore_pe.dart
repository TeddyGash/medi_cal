import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:medi_cal/app_screens/home_screen.dart';
import 'package:medi_cal/widget/customRadio.dart';
import 'package:medi_cal/widget/customWidgets.dart';

class WellsScorePE extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomAppView(
      pageTitle: 'WellsScore(PE)',
      label: "Well's Score (PE)",
      backButtonDestination: HomeScreen(),
      pageBody: InputFields(),
    );
  }
}

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
        child: Container(
          width: 100.w,
          padding: EdgeInsets.all(2.w),
          child: ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(0.9.h),
              ),
              Text(
                'Select as appropriate',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15.0.dp, fontWeight: FontWeight.normal,
                    fontStyle: FontStyle.italic),
              ),
              Padding(
                padding: EdgeInsets.all(0.7.h),
              ),
              Text(
                '1. Previous pulmonary embolism or deep vein thrombosis?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0.dp,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(0.5.h),
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
              Padding(
                padding: EdgeInsets.all(1.h),
              ),
              Text(
                '2. Heart rate >100bpm?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0.dp,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(0.5.h),
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
              Padding(
                padding: EdgeInsets.all(1.h),
              ),
              Text(
                '3. Recent surgery or immobilization (within the last 30 days)?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0.dp,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(0.5.h),
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
              Padding(
                padding: EdgeInsets.all(1.h),
              ),
              Text(
                '4. Clinical signs of deep vein thrombosis?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0.dp,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(0.5.h),
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
              Padding(
                padding: EdgeInsets.all(1.h),
              ),
              Text(
                '5. Alternative diagnosis less likely than pulmonary embolism?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0.dp,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(0.5.h),
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
              Padding(
                padding: EdgeInsets.all(1.h),
              ),
              Text(
                '6. Hemoptysis?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0.dp,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(0.5.h),
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
              Padding(
                padding: EdgeInsets.all(1.h),
              ),
              Text(
                '7. Cancer (treated within the last 6 months)?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0.dp,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(0.5.h),
              ),
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
              Padding(
                padding: EdgeInsets.all(1.h),
              ),
              MaterialButton(
                onPressed:validateAnswers,
                child: Container(
                  width: 70.w,
                  height: 10.0.h,
                  padding: EdgeInsets.all(15.0),
                  child: Material(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(7.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Check Final Score',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0.dp,
                              fontFamily: 'helvetica_neue_light',
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      )),
                ),
              ),
              MaterialButton(
                onPressed:resetSelection,
                child: Container(
                  width: 70.w,
                  height: 10.0.h,
                  padding: EdgeInsets.only(left: 4.w, right: 4.w, bottom: 7.w),
                  child: Material(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(7.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Reset Selection',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0.dp,
                              fontFamily: 'helvetica_neue_light',
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  void resetSelection() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => WellsScorePE()));
  }

  void computeScore() {
    sumAnswers();
    comment();
    showResultDialog();
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
      computeScore();
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
      _color = Colors.green;
    } else if (2 <= totalScore && totalScore < 6.0) {
      _peRisk = 'Intermediate Risk';
      _color = Colors.brown;
    } else if (totalScore >= 6) {
      _peRisk = 'High Risk';
      _color = Colors.red;
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

  Color _color = Colors.black;
  void showResultDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ResultDialog2(
          customHeight: 38.h,
          customWidth: 75.w,
          title: "Well's Score (PE)",
          total: '$totalScore',
          subHeader: "PE Risk:",
          comment: _peRisk,
          commentColor: _color,
        );
      },
    );
  }
}



