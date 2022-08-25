import 'package:flutter/material.dart';
import 'package:medi_cal/app_screens/electrolytes.dart';
import 'package:medi_cal/widget/customWidgets.dart';
import 'package:wc_form_validators/wc_form_validators.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/gestures.dart';

class PotassiumDeficit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomAppView(
      pageTitle: 'Potassium Deficit Calculator',
      label: "Potassium Deficit Calculator",
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
  final _serumPotassiumController = TextEditingController();

  /// the controller for the text field associated with "weight"
  final _weightController = TextEditingController();

  //final double serumSodium = double.tryParse(_serumSodiumController.value.text);
  //final double weight = double.tryParse(_weightController.value.text);

  final _form = GlobalKey<FormState>(); //for storing form state.
  final Uri _url = Uri.parse('https://emedicine.medscape.com/article/2054364-overview#:~:text=Adult%2Felderly%3A%203.5%2D5.0,%3A%204.1%2D5.3%20mEq%2FL');

//saving form after validation
  void _saveForm() {
    final isValid = _form.currentState!.validate();
    if (!isValid) {
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
              Container(
                padding: EdgeInsets.all(10),
                //width: MediaQuery.of(context).size.width / 1.3,
                //height: MediaQuery.of(context).size.height / 5.0,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(text: 'The reference ranges for blood potassium levels are as follows:\n'),
                  TextWidget(text: '\u2022 Adult/elderly: 3.5-5.0 mmol/L',),
                  TextWidget(text: '\u2022 Child: 3.4-4.7 mmol/L',),
                  TextWidget(text: '\u2022 Infant: 4.1-5.3 mmol/L',),
                  TextWidget(text: '\u2022 Newborn: 3.9-5.9 mmol/L \n',),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Source: ',
                            style: new TextStyle(color: Colors.white),
                          ),
                          TextSpan(
                            text: 'Medscape',
                            style: TextStyle(color: Colors.black),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () { launchUrl(_url);
                              },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              TextFormField(
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(labelText: 'Serum K in mmol/L'),
                controller: _serumPotassiumController,
                validator: Validators.compose([
                  Validators.required('Serum K is required'),
                  Validators.min(0, "Serum K can't be negative"),
                  Validators.max(3.5, 'There is no deficit'),
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

  /*Future<void> _onOpen(LinkableElement link) async {
    if (await canLaunch(link.url)) {
      await launch(link.url);
    } else {
      throw 'Could not launch $link';
    }
  }*/

  late double _deficit;

  late String _deficitRounded;

  void compute() {
    calculateDeficit();
    showAlertDialog(context);
  }

  void calculateDeficit() {
    final double serumPotassium = double.tryParse(_serumPotassiumController.value.text)!;
    final double weight = double.tryParse(_weightController.value.text)!;
    _deficit = 0.4 * weight * (3.5 - serumPotassium);
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
                  'Potassium Deficit',
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
    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => PotassiumDeficit()));
  }
}


