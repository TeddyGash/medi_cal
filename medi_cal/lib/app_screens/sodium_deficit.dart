import 'package:flutter/material.dart';
import 'package:medi_cal/widget/customWidgets.dart';

class SodiumDeficit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomAppView(
      pageTitle: 'Sodium Deficit Calculator',
      appBarTitle: CustomAppBarLabel(
        label: "Sodium Deficit Calculator",
      ),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      body: Container(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 15,),
              TextField(
                keyboardType:
                TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(labelText: 'Serum Na in mmol/L'),
                //controller: _heightController,
              ),
              TextField(
                keyboardType:
                TextInputType.numberWithOptions(decimal: false),
                decoration: InputDecoration(labelText: 'Weight in kg'),
                //controller: _heightController,
              ),
              SizedBox(height: 25,),
              MaterialButton(
                onPressed: () {},
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
          )),
    );
  }
}