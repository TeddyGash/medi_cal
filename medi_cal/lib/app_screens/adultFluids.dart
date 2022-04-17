import 'package:flutter/material.dart';
import 'package:medi_cal/app_screens/fluidsHome.dart';
import 'package:medi_cal/widget/customWidgets.dart';

import 'adult_fluids_abd.dart';
import 'adult_fluids_burns.dart';
import 'adult_fluids_enteritis.dart';
import 'adult_fluids_maintenance.dart';

class AdultFluids extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomAppView(
      pageTitle: 'AdultFluids',
      appBarTitle: CustomAppBarLabel(
        label: "Fluids Calculator (Adults)",
      ),
      backButtonDestination: FluidsHome(),
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
        child: ListView(
          children: [
            GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => AdultMaintenance()));
                },
                child: Container(
                  margin: EdgeInsets.only(top: 15, bottom: 15),
                  padding: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width / 1.3,
                  height: MediaQuery.of(context).size.height / 12.0,
                  decoration: BoxDecoration(
                    boxShadow: <BoxShadow>[
                      BoxShadow (
                          color: Colors.black54,
                          blurRadius: 15.0,
                          offset: Offset(10, 10)
                      )
                    ],
                    shape: BoxShape.rectangle,
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  child: Text(
                    "Daily Maintenance",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                      fontStyle: FontStyle.normal,
                      fontFamily: 'helvetica_neue_light',
                    ),
                    textAlign: TextAlign.center,
                  ),
                )),
            GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => AdultSurgicalAbdomen()));
                },
                child: Container(
                  margin: EdgeInsets.only(top: 15, bottom: 15),
                  padding: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width / 1.3,
                  height: MediaQuery.of(context).size.height / 12.0,
                  decoration: BoxDecoration(
                    boxShadow: <BoxShadow>[
                      BoxShadow (
                          color: Colors.black54,
                          blurRadius: 15.0,
                          offset: Offset(10, 10)
                      )
                    ],
                    shape: BoxShape.rectangle,
                    color: Colors.purple,
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  child: Text(
                    "Surgical Abdomen",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                      fontStyle: FontStyle.normal,
                      fontFamily: 'helvetica_neue_light',
                    ),
                    textAlign: TextAlign.center,
                  ),
                )),
            GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => AdultGastroenteritis()));
                },
                child: Container(
                  margin: EdgeInsets.only(top: 15, bottom: 15),
                  padding: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width / 1.3,
                  height: MediaQuery.of(context).size.height / 12.0,
                  decoration: BoxDecoration(
                    boxShadow: <BoxShadow>[
                      BoxShadow (
                          color: Colors.black54,
                          blurRadius: 15.0,
                          offset: Offset(10, 10)
                      )
                    ],
                    shape: BoxShape.rectangle,
                    color: Colors.green,
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  child: Text(
                    "Gastroenteritis",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                      fontStyle: FontStyle.normal,
                      fontFamily: 'helvetica_neue_light',
                    ),
                    textAlign: TextAlign.center,
                  ),
                )),
            GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => AdultBurns()));
                },
                child: Container(
                  margin: EdgeInsets.only(top: 15, bottom: 15),
                  padding: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width / 1.3,
                  height: MediaQuery.of(context).size.height / 12.0,
                  decoration: BoxDecoration(
                    boxShadow: <BoxShadow>[
                      BoxShadow (
                          color: Colors.black54,
                          blurRadius: 15.0,
                          offset: Offset(10, 10)
                      )
                    ],
                    shape: BoxShape.rectangle,
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  child: Text(
                    "Burns",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                      fontStyle: FontStyle.normal,
                      fontFamily: 'helvetica_neue_light',
                    ),
                    textAlign: TextAlign.center,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
