/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medi_cal/app_screens/neonatalCalcHome.dart';
import 'package:medi_cal/widget/customWidgets.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

class Fluids extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomAppView(
      pageTitle: 'NeonatalDailyMaintenance',
      appBarTitle: CustomAppBarLabel(
        label: "NeonatalDailyMaintenance",
      ),
      backButtonDestination: NeonatalHome(),
      pageBody: InputFields(),
    );
  }
}

// Define a custom Form widget.
class InputFields extends StatefulWidget {
  @override
  _InputFieldsState createState() => _InputFieldsState();
}

enum Maturity { term, preterm }
// Define a corresponding State class.
// This class holds data related to the form.
class _InputFieldsState extends State<InputFields> {
  final _ageController = TextEditingController();

  final _weightController = TextEditingController();

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

  var _maturity;


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
                //width: MediaQuery.of(context).size.width / 1.3,
                //height: MediaQuery.of(context).size.height / 6.3,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "\u2022 The values from this calculator are guides based on practice in the tropics.\n",
                      softWrap: true,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.0,
                        fontStyle: FontStyle.italic,
                        fontFamily: 'helvetica_neue_light',
                      ),
                      textAlign: TextAlign.start,
                    ),
                    Text(
                      "\u2022 It is valid for both term and preterm neonates (≤28days)\n",
                      softWrap: true,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.0,
                        fontStyle: FontStyle.italic,
                        fontFamily: 'helvetica_neue_light',
                      ),
                      textAlign: TextAlign.start,
                    ),
                    Text(
                      "\u2022 Preferred fluids:",
                      softWrap: true,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.0,
                        fontStyle: FontStyle.italic,
                        fontFamily: 'helvetica_neue_light',
                      ),
                      textAlign: TextAlign.start,
                    ),
                    Text(
                      "Day 0: 10% Dextrose",
                      softWrap: true,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.0,
                        fontStyle: FontStyle.italic,
                        fontFamily: 'helvetica_neue_light',
                      ),
                      textAlign: TextAlign.start,
                    ),
                    Text(
                      "≥Day 1: 1/5NS + 10% Dextrose\n",
                      softWrap: true,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.0,
                        fontStyle: FontStyle.italic,
                        fontFamily: 'helvetica_neue_light',
                      ),
                      textAlign: TextAlign.start,
                    ),
                    Text(
                      "\u2022 NB: First 24h = Day 0\n",
                      softWrap: true,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.0,
                        fontStyle: FontStyle.italic,
                        fontFamily: 'helvetica_neue_light',
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    width: 250,
                    child: TextFormField(
                      keyboardType:
                      TextInputType.numberWithOptions(decimal: false),
                      decoration: InputDecoration(labelText: 'weight in kg *'),
                      controller: _weightController,
                      validator: Validators.compose([
                        Validators.required('weight is required'),
                        Validators.min(0, "invalid weight"),
                        //Validators.max(12, 'valid only up to 12yrs'),
                      ]),
                    ),
                  ),
                  SizedBox(width: 50, child: Text("kg"))
                ],
              ),
              SizedBox(height: 20,),

              Row(
                children: [
                  SizedBox(
                    width: 250,
                    child: TextFormField(
                      keyboardType:
                      TextInputType.numberWithOptions(decimal: false),
                      decoration: InputDecoration(labelText: 'age in days'),
                      controller: _ageController,
                      validator: Validators.compose([
                        Validators.required('required'),
                        Validators.min(1, "invalid age"),
                        Validators.max(28, 'use general Paediatric Calculator'),
                      ]),
                    ),
                  ),
                  SizedBox(width: 50, child: Text("days"))
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Maturity: '),
                  Row(
                    children: [
                      ListTile(
                        title: Text('Term'),
                        leading: Radio(
                          value: Maturity.term,
                          groupValue: _maturity,
                          onChanged: (value) {
                            setState(() {
                              _maturity = value;
                            });
                          },
                        ),
                      ),
                      ListTile(
                        title: Text('Preterm'),
                        leading: Radio(
                          value: Maturity.preterm,
                          groupValue: _maturity,
                          onChanged: (value) {
                            setState(() {
                              _maturity = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              MaterialButton(
                onPressed: () {
                  _saveForm();
                  //compute();
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 12,
                  padding: EdgeInsets.all(15.0),
                  child: Material(
                      color: Colors.blue,
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
      ),
    );
  }

  String _message ='';

  double _weight;

  int _ageInDays;

  double _fluids;

  String _maxLimitComment;

  String _fluidsToDisplay;

  double _flowRate;

  String _flowRateRounded;

  void compute() {
    //verifyInputSetMessage();
    chooseCalculator();
    filterResult();
    calcFlowRate();
    roundFlowRate();
    displayResult(context);
  }

  void chooseCalculator(){
    final double _weight = double.tryParse(_weightController.value.text);
    final int _ageInDays = int.tryParse(_ageController.value.text);
    if (_ageInDays==null&&_weight>=3.5){hollidaySegarFormula();}
    else if (_weight<3.5||_ageInDays!=null){modifiedCalculator();}
  }

  void modifiedCalculator(){
    final double _weight = double.tryParse(_weightController.value.text);
    final int _ageInDays = int.tryParse(_ageController.value.text);
    if (_ageInDays==1){_fluids = 50*_weight;}
    else if (_ageInDays==2){_fluids = 70*_weight;}
    else if (_ageInDays==3||_weight<3.5){_fluids = 80*_weight;}
    else if (_ageInDays==4){_fluids = 100*_weight;}
    else if (5<= _ageInDays && _ageInDays <=28){_fluids = 120*_weight;}
    else if (_weight >= 3.5 && _ageInDays>28){hollidaySegarFormula();}
  }

  void hollidaySegarFormula(){
    final double _weight = double.tryParse(_weightController.value.text);
    if (_weight<=10){_fluids=100*_weight;}
    else if (_weight>10&&_weight<=20){_fluids=1000+ (50*(_weight-10));}
    else if (_weight>20){_fluids=1500+ (20*(_weight-20));}
  }

  void filterResult(){
    if (_fluids>2400){_fluidsToDisplay="2400.00";_maxLimitComment = "Maximum daily "
        "maintenance fluid for children is 2400ml. Clinical judgement is however recommended.";}
    else {_fluidsToDisplay = _fluids.toStringAsFixed(2);}
  }

  void calcFlowRate(){
    if (_fluids<=2400){ _flowRate= _fluids/24;}
    else if (_fluids>2400){_flowRate=2400/24;}
  }

  void roundFlowRate(){
    _flowRateRounded = _flowRate.toStringAsFixed(0);
  }

  void displayResult(BuildContext context){
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            width: MediaQuery.of(context).size.width / 1.3,
            height: MediaQuery.of(context).size.height / 3.0,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: const Color(0xFFFFFF),
              borderRadius: BorderRadius.all(Radius.circular(40.0)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Daily Maintenance Fluid',
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 24.0,
                    //fontStyle: FontStyle.bold,
                    fontFamily: 'helvetica_neue_light',
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "Total: $_fluidsToDisplay ml/24h",
                  //maxLines: 11,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontFamily: 'RobotoMono',
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "Flow rate: $_flowRateRounded ml/h",
                  //maxLines: 11,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontFamily: 'RobotoMono',
                  ),
                  textAlign: TextAlign.center,
                ),
                MaterialButton(
                  onPressed: () {
                    close();
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 12,
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
        builder: (BuildContext context) => Fluids()));
  }
}
*/
