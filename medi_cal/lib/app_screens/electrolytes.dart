import 'package:flutter/material.dart';
import 'package:medi_cal/app_screens/GAcalculatorEDD.dart';
import 'package:medi_cal/app_screens/GAcalculatorGA.dart';
import 'package:medi_cal/app_screens/GAcalculatorLMP.dart';
import 'package:medi_cal/app_screens/home_screen.dart';
import 'package:medi_cal/app_screens/potassium_deficit.dart';
import 'package:medi_cal/app_screens/sodium_deficit.dart';

import 'bmi_inputscreen.dart';

class SelectElectrolyte extends StatefulWidget {
  @override
  _SelectElectrolyteState createState() => _SelectElectrolyteState();
}

class _SelectElectrolyteState extends State<SelectElectrolyte> {
  int _selectedElectrolyte = -1;

  /*void _handleRadioValueChange1(value) {
    setState(() {
      _radioValue1 = value;
    });
  }*/

  void goToInputScreen() {
    if (_selectedElectrolyte == 1) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => GAcalculatorLMP()));
    } else if (_selectedElectrolyte == 2) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => GAcalculatorGA()));
    } else if (_selectedElectrolyte == 3) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => GAcalculatorEDD()));
      //add an error message if nothing is selected.
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "ElectrolyteDeficitCalculator",
        home: Scaffold(
            appBar: AppBar(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Electrolyte Deficit Calculator"),
                  IconButton(
                    icon: const Icon(Icons.home,
                        color: Colors.white, size: 24.0, semanticLabel: "Home"),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    },
                  )
                ],
              ),
            ),
            body: Center(
                child: Container(
                    width: 400,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 15),
                        Text(
                          'Select Electrolyte',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                              fontSize: 15.0, fontWeight: FontWeight.normal),
                        ),
                        SizedBox(height: 15),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                SodiumDeficit()));
                                  },
                                  child: SizedBox(
                                    height: 170,
                                    width: 170,
                                    child: (Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 10, color: Colors.black38),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(8)),
                                      ),
                                      margin: const EdgeInsets.all(4),
                                      child: Image.asset(
                                          'assets/images/sodium2.jpeg'),
                                    )),
                                  )),
                              GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                PotassiumDeficit()));
                                  },
                                  child: SizedBox(
                                    height: 170,
                                    width: 170,
                                    child: (Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 10, color: Colors.black38),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(8)),
                                      ),
                                      margin: const EdgeInsets.all(4),
                                      child: Image.asset(
                                          'assets/images/potassium2.webp'),
                                    )),
                                  ))
                            ]),
                      ],
                    )))));
  }
}
