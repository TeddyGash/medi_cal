import 'package:flutter/material.dart';
import 'package:medi_cal/app_screens/adultFluids.dart';
import 'package:medi_cal/widget/customWidgets.dart';

class AdultMaintenance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomAppView(
      pageTitle: 'AdultDailyMaintenance',
      label: "Daily Maintenance(Adult)",
      backButtonDestination: AdultFluids(),
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

  final _form = GlobalKey<FormState>(); //for storing form state.

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
                //height: MediaQuery.of(context).size.height / 4.7,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "\u2022 These are average values based on research, for the tropics.\n",
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
                      "\u2022 It is valid for average adults weighing around 70kg without any fluid deficits or ongoing losses and is NIL PER OS.\n",
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
                      "\u2022 Clinical judgement should however always take precedence.\n",
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
              SizedBox(height: 20,),
              Text(
                " Total Fluid/24h.\n",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  //fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'helvetica_neue_light',
                ),
                textAlign: TextAlign.start,
              ),
              Text(
                "     -  3000ml.\n",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontStyle: FontStyle.italic,
                  fontFamily: 'helvetica_neue_light',
                ),
                textAlign: TextAlign.start,
              ),
              Text(
                "Recommended Fluids:\n",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  //fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'helvetica_neue_light',
                ),
                textAlign: TextAlign.start,
              ),
              Text(
                "- Ringer's Lactate: 2000ml.\n",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                  fontStyle: FontStyle.italic,
                  fontFamily: 'helvetica_neue_light',
                ),
                textAlign: TextAlign.start,
              ),
              Text(
                "- Dextrose 5%: 1000ml + 50mmol KCl.\n",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                  fontStyle: FontStyle.italic,
                  fontFamily: 'helvetica_neue_light',
                ),
                textAlign: TextAlign.start,
              ),
            ],
          ),
        ),
      ),
    );
  }
  void close() {
    Navigator.of(context, rootNavigator: true).pop();
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => AdultFluids()));
  }
}
