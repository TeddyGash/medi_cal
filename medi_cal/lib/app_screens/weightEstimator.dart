import 'package:flutter/material.dart';
import 'package:medi_cal/app_screens/potassium_deficit.dart';
import 'package:medi_cal/widget/customWidgets.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

class WeightEstimator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomAppView(
      pageTitle: 'WeightEstimator',
      appBarTitle: CustomAppBarLabel(
        label: "Paediatric Weight Estimator",
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
  /// the controller for the text field associated with "serum sodium"
  final _ageYearsController = TextEditingController();

  /// the controller for the text field associated with "weight"
  final _ageMonthsController = TextEditingController();

  //final double serumSodium = double.tryParse(_serumSodiumController.value.text);
  //final double weight = double.tryParse(_weightController.value.text);

  final _form = GlobalKey<FormState>(); //for storing form state.

//saving form after validation
  void _saveForm() {
    final isValid = _form.currentState.validate();
    if (!isValid) {
      return;
    } else {
      compute();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      body: Form(
        key: _form, //assigning key to form
        child: Container(
          padding: const EdgeInsets.all(40.0),
          child: ListView(
              children: [
          Container(
          padding: EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width / 1.3,
          height: MediaQuery.of(context).size.height / 6.0,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.blueGrey,
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(text: "\u2022 This estimator is based on the Weech's formula.\n"),
              TextWidget(text: "\u2022 It is valid for ages between 3months and 12years.\n"),
              TextWidget(text: "\u2022 Enter age in 'years + months' format."),
              TextWidget(text: "   eg. 18months = '1year 6months"),
              TextWidget(text: "          12months = 1year 0months"),
              TextWidget(text: "          7months = 0yrs 7month"),
              ])),
              Row(
                children: [
                  SizedBox(
                    width: 250,
                    child: TextFormField(
                      keyboardType:
                      TextInputType.numberWithOptions(decimal: false),
                      decoration: InputDecoration(labelText: 'age in years'),
                      controller: _ageYearsController,
                      validator: Validators.compose([
                        Validators.required(
                            'required: put 0 if not applicable'),
                        Validators.min(0, "age can't be negative"),
                        Validators.max(12, 'valid only up to 12yrs'),
                      ]),
                      //decoration: InputDecoration(labelText: 'Full Name'),
                    ),
                  ),
                  SizedBox(width: 50, child: Text("years"))
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 250,
                    child: TextFormField(
                      keyboardType:
                      TextInputType.numberWithOptions(decimal: false),
                      decoration: InputDecoration(labelText: 'age in months'),
                      controller: _ageMonthsController,
                      validator: Validators.compose([
                        Validators.required(
                            'required: put 0 if not applicable'),
                        Validators.min(3, "valid only from 3months"),
                        Validators.max(11, 'breakdown into yrs+months format'),
                      ]),
                    ),
                  ),
                  SizedBox(width: 50, child: Text("months"))
                ],
              ),
              MaterialButton(
                onPressed: () {
                  _saveForm();
                  //compute();
                },
                child: Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  height: MediaQuery
                      .of(context)
                      .size
                      .height / 12,
                  padding: EdgeInsets.all(15.0),
                  child: Material(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(25.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Continue',
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
    ));
  }

  double _weight;

  String _weightRounded;

  var _age;

  void compute() {
    convertAge();
    calculateWeight();
    showAlertDialog(context);
  }

  void convertAge() {
    final int ageYears = int.tryParse(_ageYearsController.value.text);
    final int ageMonths = int.tryParse(_ageMonthsController.value.text);
    if (ageYears == 0) {
      _age = ageMonths;
    } else {
      _age = ageYears + (ageMonths / 12);
    }
  }

  void calculateWeight() {
    final int ageYears = int.tryParse(_ageYearsController.value.text);
    //final int ageMonths = int.tryParse(_ageMonthsController.value.text);
    if (ageYears == 0) {
      _weight = (_age + 9) / 2;
    } else if (_age >= 1 || _age <= 6) {
      _weight = (_age * 2) + 8;
    } else if (_age >= 7 || _age <= 12) {
      _weight = ((_age * 7) - 5) / 2;
    }

    _weightRounded = _weight.toStringAsFixed(2);
  }

  //void showResult() {}

  void showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            width: MediaQuery
                .of(context)
                .size
                .width / 1.3,
            height: MediaQuery
                .of(context)
                .size
                .height / 3.0,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: const Color(0xFFFFFF),
              borderRadius: BorderRadius.all(Radius.circular(40.0)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Expected Weight',
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 24.0,
                    fontFamily: 'helvetica_neue_light',
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "$_weightRounded kg",
                  //maxLines: 11,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30.0,
                    fontFamily: 'RobotoMono',
                  ),
                  textAlign: TextAlign.center,
                ),
                MaterialButton(
                  onPressed: () {
                    close();
                  },
                  child: Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    height: MediaQuery
                        .of(context)
                        .size
                        .height / 12,
                    padding: EdgeInsets.all(15.0),
                    child: Material(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(25.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Dismiss',
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
        );
      },
    );
  }

  void close() {
    Navigator.of(context, rootNavigator: true).pop();
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => WeightEstimator()));
  }
}
