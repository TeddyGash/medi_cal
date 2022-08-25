import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:medi_cal/app_screens/neonatalCalcHome.dart';
import 'package:medi_cal/widget/customWidgets.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

class SBR extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomAppView(
      pageTitle: 'SBR',
      label: "Serum Bilirubin",
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

class _InputFieldsState extends State<InputFields> {

  final _bilirubinController = TextEditingController();

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      body: Form(
        key: _form, //assigning key to form
        child: Container(
          padding: EdgeInsets.all(12.w),
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
                    TextWidget(text: "\u2022 The values from this calculator are guides based on practice in the tropics.\n"),
                    TextWidget(text: "\u2022 It helps to guide when to start phototherapy or Exchange Transfusion based on baby's weight.\n"),
                    TextWidget(text: "\u2022 It is valid for both term and preterm neonates (≤28days).\n"),
                    TextWidget(text: "\u2022 Clinical judgement should however always take precedence over these guides"),
                  ],
                ),
              ),

              Row(
                children: [
                  SizedBox(
                    width: 55.w,
                    child: TextFormField(
                      keyboardType:
                      TextInputType.numberWithOptions(decimal: true),
                      decoration: InputDecoration(labelText: 'weight in kg *'),
                      controller: _weightController,
                      validator: Validators.compose([
                        Validators.required('weight is required'),
                        Validators.min(0, "invalid weight"),
                        //Validators.max(12, 'valid only up to 12yrs'),
                      ]),
                    ),
                  ),
                  SizedBox(width: 10.w,
                      child: Text("kg",
                        style: TextStyle(
                    fontSize: 12.0.dp,
                  ),))
                ],
              ),
              SizedBox(height: 2.h,),

              Row(
                children: [
                  SizedBox(
                    width: 55.w,
                    child: TextFormField(
                      keyboardType:
                      TextInputType.numberWithOptions(decimal: true),
                      decoration: InputDecoration(labelText: 'total Bilirubin'),
                      controller: _bilirubinController,
                      validator: Validators.compose([
                        Validators.required('required'),
                        Validators.min(0, "invalid bilirubin"),
                        //Validators.max(28, ''),
                      ]),
                    ),
                  ),
                  SizedBox(width: 12.w,
                      child: Text("umol/L",
                        style: TextStyle(
                          fontSize: 12.0.dp,
                        ),))
                ],
              ),
              SizedBox(height: 2.h,),

              MaterialButton(
                onPressed: () {
                  _saveForm();
                  compute();
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

  late double _photoLevel;

  late String _roundedPhotoLevel;

  late double _exchangeLevel;

  late String _roundedExchangeLevel;

  late String _comment;

  late double _exchangeVolume;

  late String _roundedExchangeVolume = "";

  bool _needsExchange = false;

  Color _color = Colors.black;

  void compute() {
    calcLevels();
    comment();
    queryExchange();
    showResultDialog();
  }

  void calcLevels() {
    final double? _weight = double.tryParse(_weightController.value.text);
    if (_weight! >= 2)
    {_photoLevel = 240;}
    else
    {_photoLevel = ((_weight * 10) - 5) * 17;}
    _roundedPhotoLevel = _photoLevel.toStringAsFixed(1);

    if (_weight >= 2)
    {_exchangeLevel = 340;}
    else
    {_exchangeLevel =  _weight * 10 * 17;}

    _roundedExchangeLevel = _exchangeLevel.toStringAsFixed(1);
  }

  void calcExchangeVolume() {
    final double? _weight = double.tryParse(_weightController.value.text);
    _exchangeVolume = _weight! * 80 * 2;
    _roundedExchangeVolume = "("+ _exchangeVolume.toStringAsFixed(0)+")ml";
  }

  void comment() {
    final double? _weight = double.tryParse(_weightController.value.text);
    final double? _sbr = double.tryParse(_bilirubinController.value.text);
    if (_weight! >= 2 && _sbr! < 240) {
      _comment = "SBR below Phototherapy Level";
      _color = Colors.green;
    }
    else if (_weight >= 2 && (_sbr! >= 240 && _sbr < 340)) {
      _comment = "Needs Phototherapy";
      _color = Colors.blueAccent;
    }
    else if (_weight >= 2 && _sbr! >= 340) {
      _comment = "Needs Exchange Transfusion";
      calcExchangeVolume();
      _needsExchange = true;
      _color = Colors.red;
    }
    else if (_weight < 2 && _sbr! < _photoLevel) {
      _comment = "SBR below Phototherapy Level";
      _color = Colors.green;
    }
    else if (_weight < 2 && (_sbr! >= _photoLevel && _sbr < _exchangeLevel)) {
      _comment = "Needs Phototherapy";
      _color = Colors.blueAccent;
    }
    else if (_weight < 2 && _sbr! >= _exchangeLevel) {
      _comment = "Needs Exchange Transfusion";
      calcExchangeVolume();
      _needsExchange = true;
      _color = Colors.red;
    }
  }

  void queryExchange () {
    final double? _weight = double.tryParse(_weightController.value.text);
    final double? _sbr = double.tryParse(_bilirubinController.value.text);
    if (_weight! >= 2 && _sbr! < 340) {
      _needsExchange = false;
      _roundedExchangeVolume="";
    }
    else if (_weight < 2 && _sbr! < _exchangeLevel) {
      _needsExchange = false;
      _roundedExchangeVolume="";
    }
  }

  void showResultDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(4.w))),
            contentPadding: EdgeInsets.all(0.0),
          content: Container(
              height: 37.h, width: 80.w,
              child: Column(
                  children: <Widget>[
                    Container(
                      width: 80.w,
                      padding: EdgeInsets.only(top: 2.0.h, bottom: 2.0.h),
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(4.0.w),
                            topRight: Radius.circular(4.0.w)),
                      ),
                      child: Text("Serum Bilirubin", textAlign: TextAlign.center,
                        //overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontWeight: FontWeight.bold,  fontSize: 24.dp, color: Colors.white),),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 1.0.h, horizontal: 3.0.w),
                      child:
                        Column(
                          children: [
                            Padding(padding: EdgeInsets.only(top: 2.h)),
                        Row(
                          children: [
                            Padding(padding: EdgeInsets.only(top: 4.h)),
                            SizedBox(
                              width: 39.w,
                              child: Text ("Phototherapy Level:\n" , textAlign: TextAlign.start,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: TextStyle(fontWeight: FontWeight.normal,
                                    fontSize: 14.dp),),
                            ),
                            SizedBox(
                              width: 26.w,
                              child: Text ("$_roundedPhotoLevel"+"umol/L\n" , textAlign: TextAlign.center,
                                //overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontWeight: FontWeight.bold,
                                    fontSize: 14.dp),),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 39.w,
                              child: Text ("Exchange Transfusion Level:\n" , textAlign: TextAlign.start,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: TextStyle(fontWeight: FontWeight.normal,
                                    fontSize: 14.dp),),
                            ),
                            SizedBox(
                              width: 26.w,
                              child: Text ("$_roundedExchangeLevel"+"umol/L" , textAlign: TextAlign.center,
                                //overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontWeight: FontWeight.bold,
                                    fontSize: 14.dp, color: Colors.black,),),
                            ),
                          ],
                        ),
                          SizedBox(height: 5.h),
                          Text('$_comment', textAlign: TextAlign.center, style: TextStyle(fontStyle: FontStyle.italic,
                            fontSize: 16.dp, color: _color),),
                          Text('$_roundedExchangeVolume',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontStyle: FontStyle.italic,
                              fontSize: 14.dp),),],
                        ),
                    ),
        ])));
      },
    );
  }
}