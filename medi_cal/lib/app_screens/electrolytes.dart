import 'package:flutter/material.dart';
import 'package:medi_cal/app_screens/home_screen.dart';
import 'package:medi_cal/app_screens/potassium_deficit.dart';
import 'package:medi_cal/app_screens/sodium_deficit.dart';
import 'package:medi_cal/widget/customWidgets.dart';

class SelectElectrolyte extends StatefulWidget {
  @override
  _SelectElectrolyteState createState() => _SelectElectrolyteState();
}

class _SelectElectrolyteState extends State<SelectElectrolyte> {


  @override
  Widget build(BuildContext context) {
    return CustomAppView(
      pageTitle: 'ElectrolyteDeficitCalculator',
      appBarTitle: CustomAppBarLabel(
        label: "Electrolyte Deficit Calculator",
      ),
      backButtonDestination: HomeScreen(),
      pageBody: Center(
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
              ))),
    );
  }
}
