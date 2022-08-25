//import 'dart:html';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:medi_cal/app_screens/home_screen.dart';
import 'dart:math';
import 'package:medi_cal/widget/customWidgets.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

class EGFR extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomAppView(
      pageTitle: 'eGFR',
      label: "eGFR Calculator",
      backButtonDestination: HomeScreen(),
      pageBody: EGFRCore(),
    );
  }
}

class EGFRCore extends StatelessWidget {
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

class _InputFieldsState extends State<InputFields> {

  final _ageController = TextEditingController();

  final _creatinineController = TextEditingController();

  final _sexController = TextEditingController();

  late double _egfr;


  late String _comment;
  double _k = 0.9;
  double _a = -0.302;
  double _kf = 1;
  late double _sCrKRatio;
  late double sCr;

  final List<String> _units = [
    'umol/L',
    'mg/dl',
  ];
  String? _selectedUnit = "umol/L";

  final List<String> _genders = ["male", "female",];
  String? _selectedGender = "male";

  final _form = GlobalKey<FormState>(); //for storing form state.
  final Uri _url = Uri.parse('https://www.kidney.org/content/ckd-epi-creatinine-equation-2021');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _form, //assigning key to form
        child: Container(
          padding: EdgeInsets.all(8.w),
          child: ListView(
            children: [
              Container(
                padding: EdgeInsets.all(5.w),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '\u2022 This calculator is based on the ',
                            style: new TextStyle(color: Colors.white,
                                fontSize: 12.dp),
                          ),
                          TextSpan(
                            text: "CKD-EPI Creatinine Equation (2021).\n",
                            style: TextStyle(color: Colors.black, fontSize: 12.0.dp),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                launchUrl(_url);
                              },
                          ),
                        ],
                      ),
                    ),
                    TextWidget(text: "\u2022 It is valid for persons aged ≥ 18yrs.\n"),
                    TextWidget(text: "\u2022 For people less than 18 years of age, the Bedside Schwartz equation is recommended."),
                  ],
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 58.w,
                    child: TextFormField(
                      keyboardType:
                      TextInputType.numberWithOptions(decimal: true),
                      decoration: InputDecoration(labelText: 'age*'),
                      controller: _ageController,
                      validator: Validators.compose([
                        Validators.required('age is required'),
                        Validators.min(18, "valid for ≥18yrs"),
                        //Validators.max(28, ''),
                      ]),
                    ),
                  ),
                  SizedBox(width: 13.w,
                      child: Text("yrs",
                        style: TextStyle(
                          fontSize: 15.0.dp,
                        ),))
                ],
              ),
                Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 68.w,
                          child: DropdownButton2(
                            items: _genders
                                .map((_gender) =>
                                DropdownMenuItem<String>(
                                  value: _gender,
                                  child: Text(
                                    _gender,
                                    style: TextStyle(
                                      fontSize: 15.dp,
                                    ),
                                  ),
                                ))
                                .toList(),
                            value: _selectedGender,
                            onChanged: (value) {
                              setState(() {
                                _selectedGender = value as String;
                              });
                            },
                            buttonHeight: 11.h,
                            buttonWidth: 63.w,
                            itemHeight: 6.h,
                            dropdownWidth: 63.w,
                          ),
                        ),
                      ],),
              Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                      SizedBox(
                       width: 45.w,
                        child: TextFormField(
                      keyboardType:
                      TextInputType.numberWithOptions(decimal: true),
                      decoration: InputDecoration(labelText: 'serum Creatinine*'),
                      controller: _creatinineController,
                      validator: Validators.compose([
                        Validators.required('required'),
                        Validators.min(0, "invalid input"),
                      ]),
                    ),
                  ),
                      SizedBox(width: 20.w,
                        child:  DropdownButton2(
                          hint: Text(
                        'unit',
                        style: TextStyle(
                          fontSize: 15.dp,
                             ),
                            ),
                          items: _units
                          .map((_unit) =>
                          DropdownMenuItem<String>(
                            value: _unit,
                            child: Text(
                              _unit,
                              style: TextStyle(
                                fontSize: 13.dp,
                              ),
                            ),
                          ))
                          .toList(),
                      value: _selectedUnit,
                      onChanged: (value) {
                        setState(() {
                          _selectedUnit = value as String;
                        });
                      },
                      buttonHeight: 11.h,
                      buttonWidth: 20.w,
                      itemHeight: 4.h,
                      dropdownWidth: 21.w,
                    ),)
                ],
              ),

                     SizedBox(height: 2.h,),

                     SizedBox(height: 2.h,),

                    MaterialButton(
                      onPressed: () {
                      _saveForm();},
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
                              'Calculate',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
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

  double customHeight =  45.h;
  double customWidth =  80.w;
  Color _color = Colors.black;

  //saving form after validation
  void _saveForm() {
    final isValid = _form.currentState?.validate();
    if (!isValid!) {
      return;
    } else {
      compute();
    }
  }

  void compute(){
    processGender();
    processUnit();
    sCrKRatio();
    calculateGFR();
    comment();
    showResultDialog();
  }

  void processGender(){
    if (_selectedGender == 'female'){
      _k = 0.7;
      _a = -0.241;
      _kf = 1.012;
    }
  }

  void processUnit(){
    final double? _sCr = double.tryParse(_creatinineController.value.text);
    if (_selectedUnit == 'umol/L'){sCr = _sCr! * 0.0113;}
    else if (_selectedUnit == 'mg/dl'){sCr = _sCr!;}
  }

  void sCrKRatio(){
    _sCrKRatio = sCr/_k;
  }

  void calculateGFR() {
    final double? _age = double.tryParse(_ageController.value.text);
    _egfr = 142 * pow(min(_sCrKRatio, 1), _a) * pow(max(_sCrKRatio, 1), -1.2) * pow(0.9938, _age!) * _kf;
  }

  void comment() {
    if (_egfr > 90) {
      _comment = "Normal eGFR or Stage 1 CKD. Correlate with imaging studies";
      _color = Colors.green;
    } else if (_egfr > 60) {
      _comment = 'CKD Stage 2';
    } else if (_egfr > 45) {
      _comment = 'CKD Stage 3a';
    } else if (_egfr > 30) {
      _color = Colors.brown;
      _comment = 'CKD Stage 3b';
    } else if (_egfr > 15) {
      _color = Colors.deepOrange;
      _comment = 'CKD Stage 4';
    } else {
      _comment = 'End Stage Kidney Disease';
      _color = Colors.red;
    }
  }

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
                      padding: EdgeInsets.only(top: 2.0.h, bottom: 2.0.h),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(4.0.w),
                            topRight: Radius.circular(4.0.w)),
                      ),
                      child: Text("eGFR", textAlign: TextAlign.center,
                        //overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontWeight: FontWeight.bold,  fontSize: 30.dp, color: Colors.white),),
                    ),
                    Padding(padding: EdgeInsets.only(top: 4.h)),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text (_egfr.toStringAsFixed(1), textAlign: TextAlign.center,
                          style: TextStyle(//fontWeight: FontWeight.bold,
                              fontSize: 40.dp),),
                        Text (" ml/min/1.73 m2", textAlign: TextAlign.center,
                          style: TextStyle(//fontWeight: FontWeight.bold,
                              fontSize: 20.dp, fontStyle: FontStyle.italic),),
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(top: 3.h)),
                    Text("Comment" , textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23.dp, color: Colors.blue),),
                    Padding(padding: EdgeInsets.only(top: 2.h)),
                    Padding(padding: EdgeInsets.only(top: 1.h)),
                    Text("$_comment", textAlign: TextAlign.center, style: TextStyle(fontStyle: FontStyle.italic,
                        fontSize: 18.dp, fontWeight: FontWeight.normal, color: _color),),
                  ])),
        );
      },
    );
  }
}
