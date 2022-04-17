import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medi_cal/app_screens/paediatricFluids.dart';
import 'package:medi_cal/widget/customWidgets.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

class PaedDailyBurns extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomAppView(
      pageTitle: 'PaedDailyBurns',
      appBarTitle: CustomAppBarLabel(
        label: "Burns Maintenance",
      ),
      backButtonDestination: PaediatricFluids(),
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

  final _weightController = TextEditingController();

  final _tbsaController = TextEditingController();

  final _burnsTimerController = TextEditingController();

  //int _response1st24h = -1;


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
                //width: MediaQuery.of(context).size.width / 1.3,
                //height: MediaQuery.of(context).size.height / 4.3,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "\u2022 This calculator makes use of the Parkland's formula.\n",
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
                      "\u2022 It is an estimate that makes use of TBSA for burns of 2nd degree "
                          "and above.\n",
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
                      "\u2022 It is applicable for children <50kg, with TBSA ≥10% "
                          "and burns severity of ≥2nd degree.\n",
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
                      "\u2022 Clinical judgement should however always take precedence "
                          "over these estimates.\n",
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
                        Validators.max(50, 'use adult calculator'),
                      ]),
                    ),
                  ),
                  SizedBox(width: 50, child: Text("kg"))
                ],
              ),
              SizedBox(height: 20,),
              Text(
                "Estimated TBSA, excluding 1st degree burns.\n",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12.0,
                  fontStyle: FontStyle.italic,
                  fontFamily: 'helvetica_neue_light',
                ),
                textAlign: TextAlign.start,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 250,
                    child: TextFormField(
                      keyboardType:
                      TextInputType.numberWithOptions(decimal: false),
                      decoration: InputDecoration(labelText: 'TBSA (%) *'),
                      controller: _tbsaController,
                      validator: Validators.compose([
                        Validators.required('TBSA Required.'),
                        Validators.min(0, "invalid TBSA"),
                        Validators.max(50, 'max TBSA is 50%'),
                      ]),
                    ),
                  ),
                  SizedBox(width: 50, child: Text("%"))
                ],
              ),
              SizedBox(height: 20,),
              Text(
                "How long ago did burns occur?\n",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12.0,
                  fontStyle: FontStyle.italic,
                  fontFamily: 'helvetica_neue_light',
                ),
                textAlign: TextAlign.start,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 250,
                    child: TextFormField(
                      keyboardType:
                      TextInputType.numberWithOptions(decimal: false),
                      decoration: InputDecoration(labelText: 'hours after burns (hrs) *'),
                      controller: _burnsTimerController,
                      validator: Validators.compose([
                        Validators.required('Required.'),
                        Validators.min(0, "invalid TBSA"),
                        //Validators.max(50, 'max is 50%'),
                      ]),
                    ),
                  ),
                  SizedBox(width: 50, child: Text("hrs"))
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

  double _parkland;

  double _maintenance;

  double _halfFluid;

  String _roundedHalf;

  double _totalFluid;

  double _first8hrFlowRate;

  double _remaining16hrFlowRate;

  String _first8hrFlowRateRounded;

  String _remaining16hrFlowRateRounded;

  String _totalFluidRounded;

  double _value24hrFlowRate;

  String _value24hrFlowRateRounded;

  void compute() {
    parklandFormula();
    maintenance();
    calcTotalFluid();
    roundTotalFluid();
    halfTotalFluid();
    roundHalf();
    first8hrFlowRate();
    roundFlowRates();
    displayResult();
  }

  void parklandFormula(){
    final double _weight = double.tryParse(_weightController.value.text);
    final double _tbsa = double.tryParse(_tbsaController.value.text);
    _parkland = 3*_tbsa*_weight;
  }

  void maintenance(){
    final double _weight = double.tryParse(_weightController.value.text);
    if (_weight<=10){_maintenance=4*_weight;}
    else if (_weight>10&&_weight<=20){_maintenance=40+(2*(_weight-10));}
    else if (_weight>20){_maintenance=60 + (1*(_weight-20));}
  }

  void calcTotalFluid(){
    _totalFluid = _parkland + _maintenance;
  }

  void roundTotalFluid(){
    _totalFluidRounded = _totalFluid.toStringAsFixed(2);}

  void halfTotalFluid(){
    _halfFluid = _totalFluid/2;
  }

  void roundHalf(){
    _roundedHalf = _halfFluid.toStringAsFixed(2);}

    ///will require how long after burns before initiation of intervention.
  ///needs to optimised further!!!
  void first8hrFlowRate(){
    final double _timer = double.tryParse(_burnsTimerController.value.text);
    if (_timer<8){_first8hrFlowRate= _halfFluid/(8-_timer); _remaining16hrFlowRate = _halfFluid/16;}
    else if (_timer>8){_first8hrFlowRate=_totalFluid/24; _value24hrFlowRate = _totalFluid/24;}
  }


  void roundFlowRates(){
    final double _timer = double.tryParse(_burnsTimerController.value.text);
    if (_timer<8){
    _first8hrFlowRateRounded = _first8hrFlowRate.toStringAsFixed(0);
    _remaining16hrFlowRateRounded = _remaining16hrFlowRate.toStringAsFixed(0);}
   else _value24hrFlowRateRounded = _value24hrFlowRate.toStringAsFixed(0);
  }

  void displayResult_8hr(BuildContext context){
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
                  'Fluids/24h (Burns)',
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 24.0,
                    //fontStyle: FontStyle.bold,
                    fontFamily: 'helvetica_neue_light',
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "First 8hrs",
                  //maxLines: 11,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'RobotoMono',
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "Volume: $_roundedHalf ml",
                  //maxLines: 11,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontFamily: 'RobotoMono',
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "Flow rate: $_first8hrFlowRateRounded ml/h",
                  //maxLines: 11,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontFamily: 'RobotoMono',
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "Remaining 16hrs",
                  //maxLines: 11,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'RobotoMono',
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "Volume: $_roundedHalf ml",
                  //maxLines: 11,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontFamily: 'RobotoMono',
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "Flow rate: $_remaining16hrFlowRateRounded ml/h",
                  //maxLines: 11,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontFamily: 'RobotoMono',
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "Total volume/24h",
                  //maxLines: 11,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'RobotoMono',
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "$_totalFluidRounded ml/24h",
                  //maxLines: 11,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
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

  void displayResult_24hr(BuildContext context){
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
                  'Fluids/24h (Burns)',
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'helvetica_neue_light',
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "Total Volume/24h",
                  //maxLines: 11,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'RobotoMono',
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "$_totalFluidRounded ml",
                  //maxLines: 11,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontFamily: 'RobotoMono',
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "Flow rate",
                  //maxLines: 11,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'RobotoMono',
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "$_value24hrFlowRateRounded ml/h",
                  //maxLines: 11,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
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

  void displayResult(){
    final double _timer = double.tryParse(_burnsTimerController.value.text);
    if (_timer<=8){displayResult_8hr(context);}
    else if (_timer>8){displayResult_24hr(context);}
  }

  void close() {
    Navigator.of(context, rootNavigator: true).pop();
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => PaedDailyBurns()));
  }
}
