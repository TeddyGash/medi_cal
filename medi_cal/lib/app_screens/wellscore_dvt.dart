import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:medi_cal/app_screens/home_screen.dart';
import 'package:medi_cal/widget/customRadio.dart';
import 'package:medi_cal/widget/customWidgets.dart';

class WellsScoreDVT extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomAppView(
      pageTitle: 'WellsScoreDVT',
      label: "Well's Score (DVT)",
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
  int _responseCancer = -1;
  int _responseParesis = -1;
  int _responseSurgery = -1;
  int _responseTenderness = -1;
  int _responseLegSwelling = -1;
  int _responseCalfSwelling = -1;
  int _responseOedema = -1;
  int _responseSuperficialVeins = -1;
  int _responsePrevDVT = -1;
  int _responseAltDiag = -1;
  int totalScore = 0;
  var _dvtRisk = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
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
                      '1. Active cancer (patient either receiving treatment for cancer '
                          'within the previous 6 months or currently receiving palliative treatment)',
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
                          groupValue: _responseCancer,
                          answer: 'Yes',
                          onChanged: (value) =>
                              setState(() => _responseCancer = value),
                        ),
                        MyRadioListTile(
                          value: 0,
                          groupValue: _responseCancer,
                          answer: 'No',
                          //title: Text('Two'),
                          onChanged: (value) =>
                              setState(() => _responseCancer = value),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.all(1.h),
                    ),
                    Text(
                      '2. Paralysis, paresis, or recent cast immobilization '
                          'of the lower extremities?',
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
                          groupValue: _responseParesis,
                          answer: 'Yes',
                          onChanged: (value) =>
                              setState(() => _responseParesis = value),
                        ),
                        MyRadioListTile(
                          value: 0,
                          groupValue: _responseParesis,
                          answer: 'No',
                          //title: Text('Two'),
                          onChanged: (value) =>
                              setState(() => _responseParesis = value),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.all(1.h),
                    ),
                    Text(
                      '3. Recently bedridden for ≥3 days, or major surgery '
                          'within the previous 12 weeks requiring general or '
                          'regional anesthesia?',
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
                          groupValue: _responseSurgery,
                          answer: 'Yes',
                          onChanged: (value) =>
                              setState(() => _responseSurgery = value),
                        ),
                        MyRadioListTile(
                          value: 0,
                          groupValue: _responseSurgery,
                          answer: 'No',
                          //title: Text('Two'),
                          onChanged: (value) =>
                              setState(() => _responseSurgery = value),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.all(1.h),
                    ),
                    Text(
                      '4. Localized tenderness along the distribution of the deep venous system?',
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
                          groupValue: _responseTenderness,
                          answer: 'Yes',
                          onChanged: (value) =>
                              setState(() => _responseTenderness = value),
                        ),
                        MyRadioListTile(
                          value: 0,
                          groupValue: _responseTenderness,
                          answer: 'No',
                          //title: Text('Two'),
                          onChanged: (value) =>
                              setState(() => _responseTenderness = value),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.all(1.h),
                    ),
                    Text(
                      '5. Entire leg swelling?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0,
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
                          groupValue: _responseLegSwelling,
                          answer: 'Yes',
                          onChanged: (value) =>
                              setState(() => _responseLegSwelling = value),
                        ),
                        MyRadioListTile(
                          value: 0,
                          groupValue: _responseLegSwelling,
                          answer: 'No',
                          //title: Text('Two'),
                          onChanged: (value) =>
                              setState(() => _responseLegSwelling = value),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.all(1.h),
                    ),
                    Text(
                      '6. Calf swelling at least 3 cm larger than that on the '
                          'asymptomatic side (measured 10 cm below tibial tuberosity)?',
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
                          groupValue: _responseCalfSwelling,
                          answer: 'Yes',
                          onChanged: (value) =>
                              setState(() => _responseCalfSwelling = value),
                        ),
                        MyRadioListTile(
                          value: 0,
                          groupValue: _responseCalfSwelling,
                          answer: 'No',
                          //title: Text('Two'),
                          onChanged: (value) =>
                              setState(() => _responseCalfSwelling = value),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.all(1.h),
                    ),
                    Text(
                      '7. Pitting edema confined to the symptomatic leg?',
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
                          groupValue: _responseOedema,
                          answer: 'Yes',
                          onChanged: (value) =>
                              setState(() => _responseOedema = value),
                        ),
                        MyRadioListTile(
                          value: 0,
                          groupValue: _responseOedema,
                          answer: 'No',
                          //title: Text('Two'),
                          onChanged: (value) =>
                              setState(() => _responseOedema = value),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.all(1.h),
                    ),
                    Text(
                      '8. Collateral superficial veins (non-varicose)?',
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
                          groupValue: _responseSuperficialVeins,
                          answer: 'Yes',
                          onChanged: (value) =>
                              setState(() => _responseSuperficialVeins = value),
                        ),
                        MyRadioListTile(
                          value: 0,
                          groupValue: _responseSuperficialVeins,
                          answer: 'No',
                          //title: Text('Two'),
                          onChanged: (value) =>
                              setState(() => _responseSuperficialVeins = value),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.all(1.h),
                    ),
                    Text(
                      '9. Previously documented deep vein thrombosis?',
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
                          groupValue: _responsePrevDVT,
                          answer: 'Yes',
                          onChanged: (value) =>
                              setState(() => _responsePrevDVT = value),
                        ),
                        MyRadioListTile(
                          value: 0,
                          groupValue: _responsePrevDVT,
                          answer: 'No',
                          //title: Text('Two'),
                          onChanged: (value) =>
                              setState(() => _responsePrevDVT = value),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.all(1.h),
                    ),
                    Text(
                      '10. Alternative diagnosis at least as likely as deep vein thrombosis?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(0.5.h),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyRadioListTile(
                          value: -2,
                          groupValue: _responseAltDiag,
                          answer: 'Yes',
                          onChanged: (value) =>
                              setState(() => _responseAltDiag = value),
                        ),
                        MyRadioListTile(
                          value: 0,
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
                    MaterialButton(
                      onPressed: validateAnswers,
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
                ))));
  }

  void resetSelection() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => WellsScoreDVT()));
  }

  void computeScore() {
    sumAnswers();
    comment();
    showResultDialog();
  }

  void validateAnswers() {
    if (_responseCancer == -1 ||
        _responseParesis == -1 ||
        _responseSurgery == -1 ||
        _responseTenderness == -1 ||
        _responseLegSwelling == -1 ||
        _responseCalfSwelling == -1 ||
        _responseOedema == -1 ||
        _responseSuperficialVeins == -1 ||
        _responsePrevDVT == -1 ||
        _responseAltDiag == -1) {
      showErrorDialog();
    } else {
      computeScore();
    }


  }

  void sumAnswers() {
    totalScore = _responseCancer +
        _responseParesis +
        _responseSurgery +
        _responseTenderness +
        _responseLegSwelling +
        _responseCalfSwelling +
        _responseOedema +
        _responseSuperficialVeins +
        _responsePrevDVT +
        _responseAltDiag;
  }

  void comment() {
    if (totalScore == 0 || totalScore == -1 || totalScore == -2) {
      _dvtRisk = 'Low Risk';
      _color = Colors.green;
    } else if (totalScore == 1 || totalScore == 2) {
      _dvtRisk = 'Intermediate Risk';
      _color = Colors.brown;
    } else if (totalScore > 2) {
      _dvtRisk = 'High Risk';
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
          customHeight: 39.h,
          customWidth: 75.w,
          title: "Well's Score(DVT)",
          total: '$totalScore',
          subHeader: "DVT Risk:",
          comment: _dvtRisk,
          commentColor: _color,
        );
      },
    );
  }
}
