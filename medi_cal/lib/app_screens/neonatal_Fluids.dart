import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:medi_cal/app_screens/neonatalCalcHome.dart';
import 'package:medi_cal/widget/customWidgets.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

class Fluids extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomAppView(
      pageTitle: 'NeonatalDailyMaintenance',
      label: "Maintenance",
      backButtonDestination: NeonatalHome(),
      pageBody: InputFields(),

    );
  }
}

class InputFields extends StatefulWidget {
  @override
  _InputFieldsState createState() => _InputFieldsState();
}

enum Maturity { term, preterm }

class _InputFieldsState extends State<InputFields> {
  final _ageController = TextEditingController();

  final _weightController = TextEditingController();

  final _form = GlobalKey<FormState>(); //for storing form state.

//saving form after validation
  void _saveForm() {
    final isValid = _form.currentState?.validate();
    if (!isValid!) {
      return;
    } else {
      compute();
    }
  }

  var _maturity = Maturity.term;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      body: Form(
        key: _form, //assigning key to form
        child:
            Container(
             padding: EdgeInsets.fromLTRB(10.w, 5.h, 10.w, 5.w),
             child: ListView(
              children: [
                Container(
                  padding: EdgeInsets.all(4.w),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(2.w)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "\u2022 The values from this calculator are guides based on practice in the tropics.\n",
                        softWrap: true,
                        style: buildTextStyle(),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        "\u2022 It is valid for both term and preterm neonates (≤28days).\n",
                        softWrap: true,
                        style: buildTextStyle(),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        "\u2022 Preferred fluids:",
                        softWrap: true,
                        style: buildTextStyle(),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        "Day 0: 10% Dextrose",
                        softWrap: true,
                        style: buildTextStyle(),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        "≥Day 1: 1/5NS + 10% Dextrose\n",
                        softWrap: true,
                        style: buildTextStyle(),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        "\u2022 NB: First 24h = Day 0\n",
                        softWrap: true,
                        style: buildTextStyle(),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 55.w,
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
                    SizedBox(width: 15.w, child: Text("kg"))
                  ],
                ),
                SizedBox(height: 4.h,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 55.w,
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
                    SizedBox(width: 15.w, child: Text("days"))
                  ],
                ),
                SizedBox(height: 4.h,),
                Text('Maturity: ',
                  style: TextStyle(
                    //color: Colors.white,
                    fontSize: 16.0.dp,
                    fontStyle: FontStyle.normal,
                    fontFamily: 'helvetica_neue_light',
                  ),
                ),

                    SizedBox(
                      width: 60.w,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 38.w,
                            child: RadioListTile<Maturity>(
                                title: const Text('Term'),
                                  value: Maturity.term,
                                  groupValue: _maturity,
                                  onChanged: (value) {
                                    setState(() {
                                      _maturity = value!;
                                    });
                                  },
                                ),),

                              SizedBox(
                                width: 40.w,
                                child: RadioListTile<Maturity>(
                                  title: const Text('Preterm'),
                                    value: Maturity.preterm,
                                    groupValue: _maturity,
                                    onChanged: (value) {
                                      setState(() {
                                        _maturity = value!;
                                      });
                                    },
                                  ),),
                            ],
                          ),
                    ),

                MaterialButton(
                  onPressed: () {
                    _saveForm();
                    compute();
                  },
                  child: Container(
                    width: 70.w,
                    //MediaQuery.of(context).size.width,
                    height: 10.h,
                    //MediaQuery.of(context).size.height / 12,
                    padding: EdgeInsets.all(2.0.w),
                    child: Material(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(5.0.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Continue',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0.dp,
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

  late double _fluids;

  late String _fluidsToDisplay;

  late double _flowRate;

  late String _flowRateRounded;

  void compute() {
    chooseCalculator();
    roundFluids();
    calcFlowRate();
    roundFlowRate();
    showResultDialog();
  }

  void chooseCalculator() {
    if (_maturity==Maturity.term) {
      termFormula();
    }
    else {
      pretermFormula();
    }
  }

  void termFormula() {
    final double? _weight = double.tryParse(_weightController.value.text);
    final int? _ageInDays = int.tryParse(_ageController.value.text);
    if (_ageInDays==0) {_fluids = 50 * _weight!;}
    else if (_ageInDays==1) {_fluids = 70 * _weight!;}
    else if (_ageInDays==3) {_fluids = 90 * _weight!;}
    else if (_ageInDays==4) {_fluids = 110 * _weight!;}
    else if (_ageInDays==5) {_fluids = 130 * _weight!;}
    else if (_ageInDays!>=6 && _ageInDays<=28) {_fluids=150 * _weight!;}
  }

  void pretermFormula() {
    final double? _weight = double.tryParse(_weightController.value.text);
    final int? _ageInDays = int.tryParse(_ageController.value.text);
    if (_ageInDays==0) {_fluids = 70 * _weight!;}
    else if (_ageInDays==1) {_fluids = 90 * _weight!;}
    else if (_ageInDays==3) {_fluids = 110 * _weight!;}
    else if (_ageInDays==4) {_fluids = 130 * _weight!;}
    else if (_ageInDays==5) {_fluids = 150 * _weight!;}
    else if (_ageInDays!>=6 && _ageInDays<=28) {_fluids=180 * _weight!;}
  }

  void roundFluids(){
    _fluidsToDisplay = _fluids.toStringAsFixed(0);
  }

  void calcFlowRate(){
    _flowRate = _fluids/24;
  }

  void roundFlowRate(){
    _flowRateRounded = _flowRate.toStringAsFixed(0);
  }

  Color _color = Colors.black;
  void showResultDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ResultDialog2(
          customHeight: 38.h,
          customWidth: 75.w,
          title: "24h Maintenance",
          total: "$_fluidsToDisplay"+"ml",
          subHeader: "Flow Rate:",
          comment: "$_flowRateRounded"+"ml/h",
          commentColor: _color,
        );
      },
    );
  }

  void displayResult() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          //insetPadding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(4.0.w),
                  topRight: Radius.circular(4.0.w))),
          contentPadding: EdgeInsets.all(0.0),
          //title:
          content: Container(
              height: 40.h,
              width: 80.w,
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: 80.w,
                      padding: EdgeInsets.only(top: 2.h, bottom: 2.h),
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(4.0.w),
                            topRight: Radius.circular(4.0.w)),
                      ),
                      child: Text("Maintenance", textAlign: TextAlign.center,
                        //overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontWeight: FontWeight.bold,  fontSize: 30.dp, color: Colors.white),),
                    ),
                    Padding(padding: EdgeInsets.only(top: 4.h)),
                    Text ("$_fluidsToDisplay"+"ml/24h", textAlign: TextAlign.center,
                      //overflow: TextOverflow.ellipsis,
                      style: TextStyle(//fontWeight: FontWeight.bold,
                          fontSize: 25.dp),),
                    Padding(padding: EdgeInsets.only(top: 5.h)),
                    Text("Flow Rate" , textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23.dp, color: Colors.blueAccent),),
                    Padding(padding: EdgeInsets.only(top: 2.h)),
                    Text("$_flowRateRounded"+"ml/h", textAlign: TextAlign.center, style: TextStyle(fontStyle: FontStyle.italic,
                        fontSize: 18.dp, fontWeight: FontWeight.normal),),
                  ])),
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
