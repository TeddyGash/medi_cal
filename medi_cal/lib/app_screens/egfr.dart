//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medi_cal/app_screens/home_screen.dart';
import 'dart:math';

import 'package:medi_cal/widget/customWidgets.dart';

class EGFR extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomAppView(
      pageTitle: 'eGFR',
      appBarTitle: CustomAppBarLabel(
        label: "eGFR Calculator",
      ),
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

// Define a corresponding State class.
// This class holds data related to the form.
class _InputFieldsState extends State<InputFields> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  //final _formKey = GlobalKey<FormState>();

  // the controller for the text field associated with "height"
  final _ageController = TextEditingController();

  // the controller for the text field associated with "weight"
  //final _genderController = TextEditingController();

  // the controller for the text field associated with "weight"
  final _creatinineController = TextEditingController();

  late double _egfr;

  // the message at the beginning
  String _message = 'Please enter age, gender and serum creatinine';

  var _currentSelectedValue = 'male';

  void _calculate() {
    final double? age = double.tryParse(_ageController.value.text);
    final String gender = 'male';
    final double? creatinine = double.tryParse(_creatinineController.value.text);

    if (age! <= 0 || creatinine! <= 0) {
      setState(() {
        _message = "Age and Creatinine must be positive numbers";
      });
      return;
    }

    if (gender == 'female' && creatinine <= 62) {
      setState(() {
        _egfr = 144.0 * pow((creatinine / 61.6), -0.329) * pow(0.993, age);
          if (_egfr > 90) {
            _message = "Normal eGFR or Stage 1 CKD. Correlate with imaging studies";
          } else if (_egfr > 60) {
            _message = 'CKD Stage 2';
          } else if (_egfr > 45) {
            _message = 'CKD Stage 3a';
          } else if (_egfr > 30) {
            _message = 'CKD Stage 3b';
          } else if (_egfr > 15) {
            _message = 'CKD Stage 4';
          } else {
            _message = 'End Stage Kidney Disease';
          }
      });
    }

    else if (gender == 'female' && creatinine >= 62) {
      setState(() {
        _egfr = 144.0 * pow((creatinine / 61.6), -1.209) * pow(0.993, age);
        if (_egfr > 90) {
          _message = "Normal eGFR or Stage 1 CKD. Correlate with imaging studies";
        } else if (_egfr > 60) {
          _message = 'CKD Stage 2';
        } else if (_egfr > 45) {
          _message = 'CKD Stage 3a';
        } else if (_egfr > 30) {
          _message = 'CKD Stage 3b';
        } else if (_egfr > 15) {
          _message = 'CKD Stage 4';
        } else {
          _message = 'End Stage Kidney Disease';
        }
      });
    }

    else if (gender == 'male' && creatinine <= 62) {
      setState(() {
        _egfr = 141.0 * pow((creatinine / 79.2), -0.411) * pow(0.993, age);
        if (_egfr > 90) {
          _message = "Normal eGFR or Stage 1 CKD. Correlate with imaging studies";
        } else if (_egfr > 60) {
          _message = 'CKD Stage 2';
        } else if (_egfr > 45) {
          _message = 'CKD Stage 3a';
        } else if (_egfr > 30) {
          _message = 'CKD Stage 3b';
        } else if (_egfr > 15) {
          _message = 'CKD Stage 4';
        } else {
          _message = 'End Stage Kidney Disease';
        }
      });

    }

    else if (gender == 'male' && creatinine >= 62) {
      setState(() {
        _egfr = 141.0 * pow((creatinine / 79.2), -1.209) * pow(0.993, age);
        if (_egfr > 90) {
          _message = "Normal eGFR or Stage 1 CKD. Correlate with imaging studies";
        } else if (_egfr > 60) {
          _message = 'CKD Stage 2';
        } else if (_egfr > 45) {
          _message = 'CKD Stage 3a';
        } else if (_egfr > 30) {
          _message = 'CKD Stage 3b';
        } else if (_egfr > 15) {
          _message = 'CKD Stage 4';
        } else {
          _message = 'End Stage Kidney Disease';
        }
      });

    }

  }



  var _gender = ["male", "female",];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlueAccent,
        body: Center(
          child: Container(
            width: 320,
            child: Card(
              color: Colors.white,
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      keyboardType:
                      TextInputType.numberWithOptions(decimal: false),
                      decoration: InputDecoration(labelText: 'Age (years)'),
                      controller: _ageController,
                    ),
                     DropdownButton<String>(
                       items: _gender.map((String dropDownStringItem) {
                          return DropdownMenuItem<String>(
                          value: dropDownStringItem,
                          child: Text(dropDownStringItem),
                          );
                          }).toList(),
                              //value: _currentSelectedValue,
                              //isDense: true,
                      onChanged: (newValue) {
                                setState(() {
                                  _currentSelectedValue = newValue!;
                                  //state.didChange(newValue);
                                });
                              },
                       value: _currentSelectedValue,
                            ),
                    TextField(
                      keyboardType:
                      TextInputType.numberWithOptions(decimal: true),
                      decoration: InputDecoration(
                        labelText: 'Serum Creatinine (umol/L)',
                      ),
                      controller: _creatinineController,
                    ),
                    ElevatedButton(
                      onPressed: _calculate,
                      child: Text('Calculate'),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      child: Text(
                        _egfr == null ? 'No Result' : _egfr.toStringAsFixed(2),
                        style: TextStyle(fontSize: 50),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Text(
                        _message,
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

/*@override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child:
      Column(
          children: [
            TextField(
              decoration: new InputDecoration(labelText: "Enter age (in years)"),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],),
            TextField(
              decoration: new InputDecoration(labelText: "Enter weight (in kg)"),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],),
            TextField(
              decoration: new InputDecoration(labelText: "Enter height (in m)"),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],),
            Container(
            margin: EdgeInsets.only(top: 70.0),
            width: 250.0,
            height: 50.0,
            child:
              ElevatedButton(
              onPressed: () {},
                child: Text('Calculate BMI',
                    style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    ),),
          ),
          // Add TextFormFields and ElevatedButton here.

    ),
      ],
    ));
  }*/

//class CalculateBMI
