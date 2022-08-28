import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
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
          child: Container(
            width: 100.w,
            padding: EdgeInsets.all(2.w),
            child: ListView(
              children: [
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
                  '1. Confusion?',
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
                      value: 1,
                      groupValue: _responseConfusion,
                      answer: 'Yes',
                      //title: Text('One'),
                      onChanged: (value) => setState(() => _responseConfusion = value),
                    ),
                    MyRadioListTile(
                      value: 0,
                      groupValue: _responseConfusion,
                      answer: ' No ',
                      //title: Text('Two'),
                      onChanged: (value) => setState(() => _responseConfusion = value),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(1.h),
                ),
                Text(
                  '2. Serum Urea >7mmol/L?',
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
                      value: 1,
                      groupValue: _responseUrea,
                      answer: 'Yes',
                      //title: Text('One'),
                      onChanged: (value) => setState(() => _responseUrea = value),
                    ),
                    MyRadioListTile(
                      value: 0,
                      groupValue: _responseUrea,
                      answer: ' No ',
                      //title: Text('Two'),
                      onChanged: (value) => setState(() => _responseUrea = value),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(1.h),
                ),
                Text(
                  '3. Respiratory rate ≥30cpm?',
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
                      value: 1,
                      groupValue: _responseResp,
                      answer: 'Yes',
                      //title: Text('One'),
                      onChanged: (value) => setState(() => _responseResp = value),
                    ),
                    MyRadioListTile(
                      value: 0,
                      groupValue: _responseResp,
                      answer: ' No ',
                      //title: Text('Two'),
                      onChanged: (value) => setState(() => _responseResp = value),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(1.h),
                ),
                Text(
                  '4. SBP ≤ 90mmHg or DBP ≤ 60mmHg?',
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
                      value: 1,
                      groupValue: _responseHypotension,
                      answer: 'Yes',
                      //title: Text('One'),
                      onChanged: (value) => setState(() => _responseHypotension = value),
                    ),
                    MyRadioListTile(
                      value: 0,
                      groupValue: _responseHypotension,
                      answer: ' No ',
                      //title: Text('Two'),
                      onChanged: (value) => setState(() => _responseHypotension = value),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(1.h),
                ),
                Text(
                  '5. Age >65years?',
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
                      value: 1,
                      groupValue: _responseAge,
                      answer: 'Yes',
                      //title: Text('One'),
                      onChanged: (value) => setState(() => _responseAge = value),
                    ),
                    MyRadioListTile(
                      value: 0,
                      groupValue: _responseAge,
                      answer: ' No ',
                      //title: Text('Two'),
                      onChanged: (value) => setState(() => _responseAge = value),
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
        ));
  }


  void resetSelection() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => CURB65()));
  }

  void computeScore() {
    sumAnswers();
    comment();
    showResultDialog();
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
      computeScore();
    }
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
      _pneumoniaSeverity = 'MILD; '
          '\nconsider OPD mgt.';
      _color = Colors.green;
    } else if (totalScore ==2 ) {
      _pneumoniaSeverity = 'MODERATE; '
          '\nconsider in-patient mgt';
      _color = Colors.brown;
    } else if (totalScore > 2) {
      _pneumoniaSeverity = 'SEVERE; '
          '\nrequires admission';
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
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ResultDialog2(
          customHeight: 40.h,
          customWidth: 75.w,
          title: "CURB-65 Score",
          total: '$totalScore',
          subHeader: "Severity:",
          comment: _pneumoniaSeverity,
          commentColor: _color,
        );
      },
    );
  }
}
