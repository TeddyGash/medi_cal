import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:medi_cal/app_screens/home_screen.dart';
import 'package:medi_cal/widget/customWidgets.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

class BmiInputScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomAppView(
      pageTitle: 'BMI',
      label: "BMI Calculator",
      backButtonDestination: HomeScreen(),
      pageBody: BmiInputCore(),
    );
  }
}

class BmiInputCore extends StatelessWidget {
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
  final _heightController = TextEditingController();

  // the controller for the text field associated with "weight"
  final _weightController = TextEditingController();

  final _heightInchesController = TextEditingController();

  late double _bmi;


  late String _comment;

  final _form = GlobalKey<FormState>(); //for storing form state.
  final Uri _url = Uri.parse('https://academic.oup.com/ndt/article/23/1/47/1923176');

  final List<String> heightUnits = [
    'm',
    'cm',
    'ft',
    'in',
  ];
  String? selectedHeightValue = "m";

  final List<String> weightUnits = [
    'kg',
    'lb',
  ];
  String? selectedWeightValue = "kg";

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
                            text: '\u2022 The values from this calculator are based on the ',
                            style: new TextStyle(color: Colors.white,
                            fontSize: 12.dp),
                          ),
                          TextSpan(
                            text: "Quetelet's index (W/H2).\n",
                            style: TextStyle(color: Colors.black),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                              launchUrl(_url);
                              },
                          ),
                        ],
                      ),
                    ),
                    TextWidget(text: "\u2022 It is valid for persons aged ≥20yrs\n"),
                    TextWidget(text: "\u2022 Select the appropriate units"),
                  ],
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 55.w,
                    child: TextFormField(
                      keyboardType:
                      TextInputType.numberWithOptions(decimal: true),
                      decoration: InputDecoration(labelText: 'height*'),
                      controller: _heightController,
                      validator: Validators.compose([
                        Validators.required('height is required'),
                        Validators.min(0, "invalid height"),
                        //Validators.max(28, ''),
                      ]),
                    ),
                  ),
                  SizedBox(width: 15.w,
                      child: DropdownButton2(
                        hint: Text(
                          'unit',
                          style: TextStyle(
                            fontSize: 15.dp,
                          ),
                        ),
                        items: heightUnits
                            .map((heightUnit) =>
                            DropdownMenuItem<String>(
                              value: heightUnit,
                              child: Text(
                                heightUnit,
                                style: TextStyle(
                                  fontSize: 15.dp,
                                ),
                              ),
                            ))
                            .toList(),
                        value: selectedHeightValue,
                        onChanged: (value) {
                          setState(() {
                            selectedHeightValue = value as String;
                          });
                        },
                        buttonHeight: 11.h,
                        buttonWidth: 15.w,
                        itemHeight: 6.h,
                        dropdownWidth: 15.w,
                      ),)
                ],
              ),
              if (selectedHeightValue == 'ft')...[
                StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 55.w,
                      child: TextFormField(
                        keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                        decoration: InputDecoration(labelText: 'inches *'),
                        controller: _heightInchesController,
                        validator: Validators.compose([
                          Validators.required('required- 0 if N/A'),
                          Validators.min(0, "invalid"),
                          Validators.max(11, '12inches = 1ft'),
                        ]),
                      ),
                    ),
                    SizedBox(width: 15.w,
                        child: Text("in",
                          style: TextStyle(
                            fontSize: 15.0.dp,
                          ),))
                  ],
                );},
                ),
              ],
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 55.w,
                    child: TextFormField(
                      keyboardType:
                      TextInputType.numberWithOptions(decimal: true),
                      decoration: InputDecoration(labelText: 'weight*'),
                      controller: _weightController,
                      validator: Validators.compose([
                        Validators.required('weight is required'),
                        Validators.min(0, "invalid weight"),
                        //Validators.max(12, 'valid only up to 12yrs'),
                      ]),
                    ),
                  ),
                  SizedBox(width: 15.w,
                      child: DropdownButton2(
                        hint: Text(
                          'unit',
                          style: TextStyle(
                            fontSize: 15.dp,
                          ),
                        ),
                        items: weightUnits
                            .map((weightUnit) =>
                            DropdownMenuItem<String>(
                              value: weightUnit,
                              child: Text(
                                weightUnit,
                                style: TextStyle(
                                  fontSize: 15.dp,
                                ),
                              ),
                            ))
                            .toList(),
                        value: selectedWeightValue,
                        onChanged: (value) {
                          setState(() {
                            selectedWeightValue = value as String;
                          });
                        },
                        buttonHeight: 11.h,
                        buttonWidth: 15.w,
                        itemHeight: 6.h,
                        dropdownWidth: 15.w,
                      ),)
                ],
              ),

              SizedBox(height: 2.h,),

              SizedBox(height: 2.h,),

              MaterialButton(
                onPressed: () {
                  _saveForm();
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
  /*Widget build(BuildContext context) {
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
                          TextInputType.numberWithOptions(decimal: true),
                      decoration: InputDecoration(labelText: 'Height (m)'),
                      controller: _heightController,
                    ),
                    TextField(
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      decoration: InputDecoration(
                        labelText: 'Weight (kg)',
                      ),
                      controller: _weightController,
                    ),
                    ElevatedButton(
                      onPressed: _calculate,
                      child: Text('Calculate'),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            _bmi == null ? 'No Result' : _bmi.toStringAsFixed(2),
                            style: TextStyle(fontSize: 40),
                            textAlign: TextAlign.center,
                          ),
                          Text(_bmi == null ? '' : 'kg/m2',  style: TextStyle(fontSize: 20),
                            textAlign: TextAlign.center,)
                        ],
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
  }*/

  late double height;
  late double weight;
  double customHeight =  40.h;
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
    processHeight();
    processWeight();
    calculateBMI();
    comment();
    showResultDialog();
  }

  void processHeight(){
    final double? _height = double.tryParse(_heightController.value.text);
    final double? _heightInches = double.tryParse(_heightInchesController.value.text);
    if (selectedHeightValue == 'm'){height = _height!;}
    else if (selectedHeightValue == 'cm'){height = (_height! / 100);}
    else if (selectedHeightValue == 'ft'){height = ((_height! * 12) + _heightInches!) * 0.0254;}
    else if (selectedHeightValue == 'in'){height = _height!  * 0.0254;}
  }

  void processWeight(){
    final double? _weight = double.tryParse(_weightController.value.text);
    if (selectedWeightValue == 'kg'){weight = _weight!;}
    else if (selectedWeightValue == 'lb'){weight = _weight! * 0.45359237;}
  }

  void calculateBMI() {
    _bmi = (weight / (height * height));
  }

  void comment(){
      if (_bmi < 18.5) {
        _comment = "Underweight";
      } else if (18.5 <= _bmi && _bmi < 25) {
        _comment = 'Normal BMI';
        _color = Colors.green;
      } else if (25 <= _bmi && _bmi < 30) {
        _comment = 'Overweight';
        _color = Colors.blueAccent;
      } else if (30 <= _bmi && _bmi < 40) {
        _comment = 'Obese';
        _color = Colors.red;
      } else {
        _comment = 'Morbidly Obese';
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
                      child: Text("BMI", textAlign: TextAlign.center,
                        //overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontWeight: FontWeight.bold,  fontSize: 30.dp, color: Colors.white),),
                    ),
                    Padding(padding: EdgeInsets.only(top: 4.h)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text (_bmi.toStringAsFixed(1), textAlign: TextAlign.center,
                          style: TextStyle(//fontWeight: FontWeight.bold,
                              fontSize: 40.dp),),
                        Text (" kg/m2", textAlign: TextAlign.center,
                          style: TextStyle(//fontWeight: FontWeight.bold,
                              fontSize: 23.dp),),
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