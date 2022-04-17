import 'package:flutter/material.dart';
import 'package:medi_cal/app_screens/paediatricFluids.dart';
import 'package:medi_cal/widget/customWidgets.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

class PaedDailySCD extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomAppView(
      pageTitle: 'PaedSCD',
      appBarTitle: CustomAppBarLabel(
        label: "SCD Crisis Maintenance",
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
                //height: MediaQuery.of(context).size.height / 4.8,
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
                      "\u2022 This calculator makes use of the Holliday-Segar formula.\n",
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
                      "\u2022 It is an estimate that seeks to hydrate a child in "
                          "SC Crisis with a minimum of 1.5x the daily maintenance fluid.\n",
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
                      "\u2022 Clinical judgement should however take precedence over these estimates especially in ACS.\n",
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

  double _weight;

  double _fluids;

  String _maxLimitComment;

  String _fluidsToDisplay;

  double _flowRate;

  String _flowRateRounded;

  double _adjustedFluid;

  void compute() {
    hollidaySegarFormula();
    adjustFluid();
    roundFluid();
    calcFlowRate();
    roundFlowRate();
    displayResult(context);
  }


  void hollidaySegarFormula(){
    final double _weight = double.tryParse(_weightController.value.text);
    if (_weight<3.5){_fluids = 80*_weight;}
    else if (_weight<=10 && _weight>=3.5){_fluids=100*_weight;}
    else if (_weight>10&&_weight<=20){_fluids=1000+ (50*(_weight-10));}
    else if (_weight>20){_fluids=1500+ (20*(_weight-20));}
  }

  void adjustFluid(){
    _adjustedFluid = _fluids*1.5;
  }

void roundFluid(){
    _fluidsToDisplay = _adjustedFluid.toStringAsFixed(2);}


  void calcFlowRate(){
     _flowRate= _adjustedFluid/24;
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
                  'Daily Maintenance Fluid (SCD)',
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
        builder: (BuildContext context) => PaedDailySCD()));
  }
}
