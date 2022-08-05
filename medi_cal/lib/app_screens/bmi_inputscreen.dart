import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medi_cal/app_screens/home_screen.dart';
import 'package:medi_cal/widget/customWidgets.dart';

class BmiInputScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomAppView(
      pageTitle: 'BMI',
      appBarTitle: CustomAppBarLabel(
        label: "BMI Calculator",
      ),
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

  late double _bmi;

  // the message at the beginning
  String _message = 'Please enter height and weight';

  void _calculate() {
    final double? height = double.tryParse(_heightController.value.text);
    final double? weight = double.tryParse(_weightController.value.text);

    if (height! <= 0 || weight! <= 0) {
      setState(() {
        _message = "Height and weight must be positive numbers";
      });
      return;
    }

    setState(() {
      _bmi = weight / (height * height);
      if (_bmi < 18.5) {
        _message = "Underweight";
      } else if (_bmi < 25) {
        _message = 'Normal BMI';
      } else if (_bmi < 30) {
        _message = 'Overweight';
      } else if (_bmi < 40) {
        _message = 'Obese';
      } else {
        _message = 'Morbidly Obese';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
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
  }
}
