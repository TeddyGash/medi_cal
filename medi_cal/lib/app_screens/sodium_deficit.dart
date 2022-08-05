import 'package:flutter/material.dart';
import 'package:medi_cal/app_screens/electrolytes.dart';
import 'package:medi_cal/widget/customWidgets.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

class SodiumDeficit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomAppView(
      pageTitle: 'Sodium Deficit Calculator',
      appBarTitle: CustomAppBarLabel(
        label: "Sodium Deficit Calculator",
      ),
      backButtonDestination: SelectElectrolyte(),
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
  final _serumSodiumController = TextEditingController();

  /// the controller for the text field associated with "weight"
  final _weightController = TextEditingController();

  //final double serumSodium = double.tryParse(_serumSodiumController.value.text);
  //final double weight = double.tryParse(_weightController.value.text);

  final _form = GlobalKey<FormState>(); //for storing form state.

//saving form after validation
  void _saveForm() {
    final isValid = _form.currentState?.validate();
    if (!isValid!) {
      return;
    }
    else { compute();}
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
            children: <Widget>[
              TextFormField(
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(labelText: 'Serum Na in mmol/L'),
                controller: _serumSodiumController,
                validator: Validators.compose([
                  Validators.required('Serum Na is required'),
                  Validators.min(0, "Serum Na can't be negative"),
                  Validators.max(135, 'There is no deficit'),
                ]),
                //decoration: InputDecoration(labelText: 'Full Name'),
              ),

              TextFormField(
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(labelText: 'Weight in kg'),
                controller: _weightController,
                validator: Validators.compose([
              Validators.required('Weight is required'),
              Validators.min(0, "Invalid Weight"),
              Validators.max(500, 'Invalid Weight'),
            ]),
              ),
              SizedBox(height: 10,),

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
                        )
                    ),
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  late double _deficit;

  late String _deficitRounded;

  void compute() {
    calculateDeficit();
    showAlertDialog(context);
  }

  void calculateDeficit() {
    final double? serumSodium = double.tryParse(_serumSodiumController.value.text);
    final double? weight = double.tryParse(_weightController.value.text);
    _deficit = 0.6 * weight! * (135 - serumSodium!);
    _deficitRounded = _deficit.toStringAsFixed(2);
  }


  //void showResult() {}

  void showAlertDialog(BuildContext context) {
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
                  'Sodium Deficit',
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 24.0,
                    fontFamily: 'helvetica_neue_light',
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "$_deficitRounded mmol/L",
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
                  onPressed: ()  {
                    close();
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height/12,
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
                        )
                    ),
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
    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => SodiumDeficit()));
  }
}



/*
body: Container
(
padding: const EdgeInsets.all(40.0
)
,
child: Column
(
mainAxisAlignment: MainAxisAlignment.start,children: <
Widget>[
SizedBox
(
height: 15
,
)
,
TextField
(

TextField
(
keyboardType:TextInputType.numberWithOptions(decimal: false
)
,
decoration: InputDecoration
(
labelText: )
,
controller: _weightController,)
,
SizedBox
(
height: 25
,
)
,

)
,
]
,
)*/
