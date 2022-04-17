import 'package:flutter/material.dart';
import 'package:medi_cal/app_screens/paediatricFluids.dart';
import 'package:medi_cal/widget/customWidgets.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

class PaedDailyGE extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomAppView(
      pageTitle: 'PaedGE',
      appBarTitle: CustomAppBarLabel(
        label: "Gastroenteritis Maintenance",
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

  final _deficitVomitusController = TextEditingController();

  final _deficitDiarrhoeaController = TextEditingController();

  final _ongoingVomitusController = TextEditingController();

  final _ongoingDiarrhoeaController = TextEditingController();

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
                //height: MediaQuery.of(context).size.height / 5.7,
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
                      "\u2022 It is an estimate that takes into account fluid deficit, "
                          "ongoing losses and daily maintenance.\n",
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
                      "\u2022 Clinical judgement should always however take precedence over these estimates.\n",
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
              Text(
                "DEFICIT: Estimate how much fluid was lost through diarrhoea and vomiting "
                    "prior to onset of fluid therapy. Make the value 0 if deficit has been "
                    "corrected already.\n",
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
                      decoration: InputDecoration(labelText: 'deficit(diarrhoea) *'),
                      controller: _deficitDiarrhoeaController,
                      validator: Validators.compose([
                        Validators.required('Required. Put 0 if N/A.'),
                        Validators.min(0, "invalid volume"),
                        //Validators.max(12, 'valid only up to 12yrs'),
                      ]),
                    ),
                  ),
                  SizedBox(width: 50, child: Text("ml"))
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
                      decoration: InputDecoration(labelText: 'deficit(vomiting) *'),
                      controller: _deficitVomitusController,
                      validator: Validators.compose([
                        Validators.required('Required. Put 0 if N/A.'),
                        Validators.min(0, "invalid volume"),
                        //Validators.max(12, 'valid only up to 12yrs'),
                      ]),
                    ),
                  ),
                  SizedBox(width: 50, child: Text("ml"))
                ],
              ),
              SizedBox(height: 20,),
              Text(
                "ON-GOING LOSSES: Estimate how much fluid was lost through diarrhoea and vomiting "
                    "within the past 24h after onset of fluid therapy.\n",
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
                      decoration: InputDecoration(labelText: 'total volume of loose stools *'),
                      controller: _ongoingDiarrhoeaController,
                      validator: Validators.compose([
                        Validators.required('Required. Put 0 if N/A.'),
                        Validators.min(0, "invalid volume"),
                        //Validators.max(12, 'valid only up to 12yrs'),
                      ]),
                    ),
                  ),
                  SizedBox(width: 50, child: Text("ml"))
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 250,
                    child: TextFormField(
                      keyboardType:
                      TextInputType.numberWithOptions(decimal: false),
                      decoration: InputDecoration(labelText: 'total volume of vomitus *'),
                      controller: _ongoingVomitusController,
                      validator: Validators.compose([
                        Validators.required('Required. Put 0 if N/A.'),
                        Validators.min(0, "invalid volume"),
                        //Validators.max(12, 'valid only up to 12yrs'),
                      ]),
                    ),
                  ),
                  SizedBox(width: 50, child: Text("ml"))
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

  //double _weight;

  double _fluids;

  String _fluidsToDisplay;

  double _flowRate;

  String _flowRateRounded;

  double _deficitVomitus;

  double _deficitDiarrhoea;

  double _ongoingVomitus;

  double _ongoingDiarrhoea;

  double _totalDeficit;

  double _totalOngoing;

  double _totalFluids;

  void compute() {
    //verifyInputs();
    hollidaySegarFormula();
    calcDeficit();
    calcOngoing();
    calcTotalFluid();
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

  /*void verifyInputs(){
    double _deficitVomitus = double.tryParse(_deficitVomitusController.value.text);
    double _deficitDiarrhoea = double.tryParse(_deficitDiarrhoeaController.value.text);
    double _ongoingVomitus = double.tryParse(_ongoingVomitusController.value.text);
    double _ongoingDiarrhoea = double.tryParse(_ongoingDiarrhoeaController.value.text);
    if (_deficitVomitus=null){_deficitVomitus==0;}
    if (_deficitDiarrhoea=null){_deficitDiarrhoea==0;}
    if (_ongoingVomitus=null){_ongoingVomitus==0;}
    if (_ongoingDiarrhoea=null){_ongoingDiarrhoea==0;}
  }*/

  void calcDeficit(){
    final double _deficitVomitus = double.tryParse(_deficitVomitusController.value.text);
    final double _deficitDiarrhoea = double.tryParse(_deficitDiarrhoeaController.value.text);
    _totalDeficit = _deficitDiarrhoea + _deficitVomitus;
  }

  void calcOngoing(){
    final double _ongoingVomitus = double.tryParse(_ongoingVomitusController.value.text);
    final double _ongoingDiarrhoea = double.tryParse(_ongoingDiarrhoeaController.value.text);
    _totalOngoing = _ongoingDiarrhoea + _ongoingVomitus;
  }

    void calcTotalFluid(){
    _totalFluids = _fluids + _totalDeficit + _totalOngoing;
    }

  void roundFluid(){
    _fluidsToDisplay = _totalFluids.toStringAsFixed(2);}


  void calcFlowRate(){
    _flowRate= _totalFluids/24;
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
                  'Total Fluid/24h',
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
        builder: (BuildContext context) => PaedDailyGE()));
  }
}
