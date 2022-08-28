import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:medi_cal/app_screens/home_screen.dart';
import 'package:medi_cal/widget/customRadio.dart';
import 'package:medi_cal/widget/customWidgets.dart';

class CHA2DS2VASc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomAppView(
      pageTitle: 'CHADSVASc Score',
      label: "CHADSVASc Score",
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
  //final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  int _responseCHF = -1;
  int _responseHPT = -1;
  int _responseAge = -1;
  int _responseDM = -1;
  int _responsePrevTEE = -1;
  int _responseVascDx = -1;
  int _responseSex = -1;
  int totalScore = 0;
  var _strokeRisk = "";


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
              '1. Congestive heart failure?',
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
                  groupValue: _responseCHF,
                  answer: 'Yes',
                  onChanged: (value) => setState(() => _responseCHF = value),
                ),
                MyRadioListTile(
                  value: 0,
                  groupValue: _responseCHF,
                  answer: 'No',
                  //title: Text('Two'),
                  onChanged: (value) => setState(() => _responseCHF = value),
                ),
              ],
            ),//.createState().userChoice,
              Padding(
                padding: EdgeInsets.all(1.h),
              ),
            Text(
              '2. Hypertension (SBP > 160mmHg)?',
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
                  groupValue: _responseHPT,
                  answer: 'Yes',
                  //title: Text('One'),
                  onChanged: (value) => setState(() => _responseHPT = value),
                ),
                MyRadioListTile(
                  value: 0,
                  groupValue: _responseHPT,
                  answer: ' No ',
                  //title: Text('Two'),
                  onChanged: (value) => setState(() => _responseHPT = value),
                ),
              ],
            ),
              Padding(
                padding: EdgeInsets.all(1.h),
              ),
            Text(
              '3. Age?',
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
                  value: 0,
                  groupValue: _responseAge,
                  answer: '<65yrs',
                  //title: Text('One'),
                  onChanged: (value) => setState(() => _responseAge = value),
                ),
                MyRadioListTile(
                  value: 1,
                  groupValue: _responseAge,
                  answer: '65-74yrs',
                  //title: Text('Two'),
                  onChanged: (value) => setState(() => _responseAge = value),
                ),
                MyRadioListTile(
                  value: 2,
                  groupValue: _responseAge,
                  answer: '≥75yrs',
                  //title: Text('Two'),
                  onChanged: (value) => setState(() => _responseAge = value),
                ),
              ],
            ),
              Padding(
                padding: EdgeInsets.all(1.h),
              ),
             Text(
              '4. Diabetes Mellitus?',
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
                  groupValue: _responseDM,
                  answer: 'Yes',
                  //title: Text('One'),
                  onChanged: (value) => setState(() => _responseDM = value),
                ),
                MyRadioListTile(
                  value: 0,
                  groupValue: _responseDM,
                  answer: ' No ',
                  //title: Text('Two'),
                  onChanged: (value) => setState(() => _responseDM = value),
                ),
              ],
            ),
              Padding(
                padding: EdgeInsets.all(1.h),
              ),
            Text(
              '5. Stroke/Transient Ischemic Attack/Thrombo-embolic event?',
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
                  groupValue: _responsePrevTEE,
                  answer: 'Yes',
                  //title: Text('One'),
                  onChanged: (value) => setState(() => _responsePrevTEE = value),
                ),
                MyRadioListTile(
                  value: 0,
                  groupValue: _responsePrevTEE,
                  answer: 'No',
                  //title: Text('Two'),
                  onChanged: (value) => setState(() => _responsePrevTEE = value),
                ),
              ],
            ),
              Padding(
                padding: EdgeInsets.all(1.h),
              ),
            Text(
              '6. Vascular disease (prior MI, PAD, aortic plaque)?',
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
                  groupValue: _responseVascDx,
                  answer: 'Yes',
                  //title: Text('One'),
                  onChanged: (value) => setState(() => _responseVascDx = value),
                ),
                MyRadioListTile(
                  value: 0,
                  groupValue: _responseVascDx,
                  answer: 'No',
                  //title: Text('Two'),
                  onChanged: (value) => setState(() => _responseVascDx = value),
                ),
              ],
            ),
              Padding(
                padding: EdgeInsets.all(1.h),
              ),
            Text(
              '7. Sex category?',
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
                  groupValue: _responseSex,
                  answer: 'Female',
                  //title: Text('One'),
                  onChanged: (value) => setState(() => _responseSex = value),
                ),


              MyRadioListTile(
              value: 0,
              groupValue: _responseSex,
              answer: 'Male',
              //title: Text('Two'),
              onChanged: (value) => setState(() => _responseSex = value),
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

  void validateAnswers() {
    if (_responseCHF == -1 ||
        _responseHPT == -1 ||
        _responseAge == -1 ||
        _responseDM == -1 ||
        _responsePrevTEE == -1 ||
        _responseVascDx == -1 ||
        _responseSex == -1) {
      showErrorDialog();
    } else {
      computeScore();
    }
  }

  void resetSelection() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => CHA2DS2VASc()));
  }

  void computeScore() {
    sumAnswers();
    comment();
    showResultDialog();
  }

  void sumAnswers() {
    totalScore = _responseCHF +
            _responseHPT +
            _responseAge +
            _responseDM +
            _responsePrevTEE +
            _responseVascDx +
            _responseSex;
  }

  void comment() {
    if (totalScore == 0) {
      _strokeRisk = 'Low Risk';
      _color = Colors.green;
    } else if (totalScore == 1) {
      _strokeRisk = 'Intermediate Risk.\nAspirin/OAC may be started';
      _color = Colors.brown;
    } else if (totalScore >= 2) {
      _strokeRisk = 'High Risk. \n OAC needed.';
      _color = Colors.red;
    }
  }

  void showErrorDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
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
            customHeight: 42.h,
            customWidth: 80.w,
            title: "CHA2DS2VASc Score",
            total: '$totalScore',
            subHeader: "Stroke Risk:",
            comment: _strokeRisk,
            commentColor: _color,
        );
      },
    );
  }
}
