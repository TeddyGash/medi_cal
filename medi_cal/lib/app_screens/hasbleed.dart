import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:medi_cal/app_screens/home_screen.dart';
import 'package:medi_cal/widget/customRadio.dart';
import 'package:medi_cal/widget/customWidgets.dart';

class HASBLED extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomAppView(
      pageTitle: 'HASBLED Score',
      label: "HASBLED Score",
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
        //backgroundColor: Colors.lightBlueAccent,
        body: Center(
            child: Container(
                width: 100.w,
                padding: EdgeInsets.all(2.w),
                child: ListView(
                     children: [
                       Padding(
                         padding: EdgeInsets.all(1.5.w),
                       ),
                     Text(
                       'Select as appropriate',
                       textAlign: TextAlign.center,
                       style: TextStyle(
                           fontSize: 15.0.dp,
                           fontWeight: FontWeight.normal,
                       fontStyle: FontStyle.italic),
                     ),
                       Padding(
                         padding: EdgeInsets.all(1.w),
                       ),
                     //Divider(height: 5.0, color: Colors.black),
                     Text(
                       '1. Hypertension (SBP > 160mmHg)?',
                       textAlign: TextAlign.center,
                       style: TextStyle(
                         fontWeight: FontWeight.bold,
                         fontSize: 15.0.dp,
                       ),
                     ),
                       Padding(
                         padding: EdgeInsets.all(1.w),
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
                         onChanged: (value) => setState(() => _responseHPT = value),
                       ),
                     ],
                     ),
                     //Divider(height: 5.0, color: Colors.black,),
                       Padding(
                         padding: EdgeInsets.all(2.w),
                       ),
                     Text(
                       '2. Abnormal Renal Function?',
                       textAlign: TextAlign.center,
                       style: TextStyle(
                         fontWeight: FontWeight.bold,
                         fontSize: 15.0.dp,
                       ),
                     ),
                       Padding(
                         padding: EdgeInsets.all(1.w),
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
                           answer: ' No ',
                           //title: Text('Two'),
                           onChanged: (value) => setState(() => _responseRFT = value),
                         ),
                       ],
                     ),
                     //Divider(height: 5.0, color: Colors.black,),
                       Padding(
                         padding: EdgeInsets.all(2.w),
                       ),
                     Text(
                       '3. Abnormal Liver Function?',
                       textAlign: TextAlign.center,
                       style: TextStyle(
                         fontWeight: FontWeight.bold,
                         fontSize: 15.0.dp,
                       ),
                     ),
                       Padding(
                         padding: EdgeInsets.all(1.w),
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
                           answer: ' No ',
                           //title: Text('Two'),
                           onChanged: (value) => setState(() => _responseLFT = value),
                         ),
                       ],
                     ),
                     //Divider(height: 5.0, color: Colors.black,),
                       Padding(
                         padding: EdgeInsets.all(2.w),
                       ),
                     Text(
                       '4. Age?',
                       textAlign: TextAlign.center,
                       style: TextStyle(
                         fontWeight: FontWeight.bold,
                         fontSize: 15.0.dp,
                       ),
                     ),
                       Padding(
                         padding: EdgeInsets.all(1.w),
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
                           answer: '≤65yrs',
                           //title: Text('Two'),
                           onChanged: (value) => setState(() => _responseAge = value),
                         ),
                       ],
                     ),
                     //Divider(height: 5.0, color: Colors.black,),
                       Padding(
                         padding: EdgeInsets.all(2.w),
                       ),
                     Text(
                       '5. Previous Stroke?',
                       textAlign: TextAlign.center,
                       style: TextStyle(
                         fontWeight: FontWeight.bold,
                         fontSize: 15.0.dp,
                       ),
                     ),
                       Padding(
                         padding: EdgeInsets.all(1.w),
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
                           answer: ' No ',
                           //title: Text('Two'),
                           onChanged: (value) => setState(() => _responseStroke = value),
                         ),
                       ],
                     ),
                     //Divider(height: 5.0, color: Colors.black,),
                       Padding(
                         padding: EdgeInsets.all(2.w),
                       ),
                     Text(
                       '6. Prior major bleeding/Predisposition?',
                       textAlign: TextAlign.center,
                       style: TextStyle(
                         fontWeight: FontWeight.bold,
                         fontSize: 15.0.dp,
                       ),
                     ),
                       Padding(
                         padding: EdgeInsets.all(1.w),
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
                           answer: ' No ',
                           //title: Text('Two'),
                           onChanged: (value) => setState(() => _responseBleeding = value),
                         ),
                       ],
                     ),
                     //Divider(height: 5.0, color: Colors.black,),
                       Padding(
                         padding: EdgeInsets.all(2.w),
                       ),
                     Text(
                       '7. Taking drugs likely to cause bleeding?',
                       textAlign: TextAlign.center,
                       style: TextStyle(
                         fontWeight: FontWeight.bold,
                         fontSize: 15.0.dp,
                       ),
                     ),
                       Padding(
                         padding: EdgeInsets.all(1.w),
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
                           answer: ' No ',
                           //title: Text('Two'),
                           onChanged: (value) => setState(() => _responseDrugs = value),
                         ),
                       ],
                     ),
                     //Divider(height: 5.0, color: Colors.black,),
                       Padding(
                         padding: EdgeInsets.all(2.w),
                       ),
                     Text(
                       '8. Alcohol use?',
                       textAlign: TextAlign.center,
                       style: TextStyle(
                         fontWeight: FontWeight.bold,
                         fontSize: 15.0.dp,
                       ),
                     ),
                       Padding(
                         padding: EdgeInsets.all(1.w),
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
                           answer: ' No ',
                           //title: Text('Two'),
                           onChanged: (value) => setState(() => _responseAlcohol = value),
                         ),
                       ],
                     ),
                       Padding(
                         padding: EdgeInsets.all(2.w),
                       ),
                     Text(
                       '9. Labile INR?',
                       textAlign: TextAlign.center,
                       style: TextStyle(
                         fontWeight: FontWeight.bold,
                         fontSize: 15.0.dp,
                       ),
                     ),
                       Padding(
                         padding: EdgeInsets.all(1.w),
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
                           answer: ' No ',
                           //title: Text('Two'),
                           onChanged: (value) => setState(() => _responseINR = value),
                         ),
                       ],
                     ),
                       MaterialButton(
                         onPressed: () {
                           computeScore();
                         },
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
                         onPressed: () {
                           resetSelection();
                         },
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
      _color = Colors.green;
    } else if (totalScore == 2) {
      _bleedingRisk = 'Intermediate Risk';
      _color = Colors.brown;
    } else if (totalScore >= 3) {
      _bleedingRisk = 'High Risk';
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

  double customHeight =  38.h;
  double customWidth =  75.w;
  Color _color = Colors.black;

  void showResultDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(4.w))),
          contentPadding: EdgeInsets.all(0.0),
          content: Container(
              height: customHeight, width: customWidth,
              child: Column(
                  children: <Widget>[
                    Container(
                      width: customWidth,
                      padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(4.0.w),
                            topRight: Radius.circular(4.0.w)),
                      ),
                      child: Text("HASBLED Score", textAlign: TextAlign.center,
                        //overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontWeight: FontWeight.bold,  fontSize: 23.dp, color: Colors.white),),
                    ),
                    Padding(padding: EdgeInsets.only(top: 4.h)),
                    Text ("$totalScore", textAlign: TextAlign.center,
                      style: TextStyle(//fontWeight: FontWeight.bold,
                          fontSize: 40.dp),),
                    Padding(padding: EdgeInsets.only(top: 3.h)),
                    Text("Bleeding Risk:" , textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23.dp, color: Colors.black),),
                    Padding(padding: EdgeInsets.only(top: 2.h)),
                    Text(_bleedingRisk, textAlign: TextAlign.center, style: TextStyle(fontStyle: FontStyle.italic,
                        fontSize: 18.dp, fontWeight: FontWeight.normal, color: _color),),
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
