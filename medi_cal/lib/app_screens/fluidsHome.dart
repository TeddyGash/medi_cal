import 'package:flutter/material.dart';
import 'package:medi_cal/app_screens/adultFluids.dart';
import 'package:medi_cal/app_screens/home_screen.dart';
import 'package:medi_cal/app_screens/paediatricFluids.dart';
import 'package:medi_cal/app_screens/potassium_deficit.dart';
import 'package:medi_cal/app_screens/sodium_deficit.dart';

class FluidsHome extends StatefulWidget {
  @override
  _FluidsHomeState createState() => _FluidsHomeState();
}

class _FluidsHomeState extends State<FluidsHome> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "FluidsHome",
        home: Scaffold(
            appBar: AppBar(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Fluids Calculator"),
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
                        /*Text(
                          'Select Electrolyte',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 15.0, fontWeight: FontWeight.normal),
                        ),*/
                        /*SizedBox(height: 15),*/
                        Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                PaediatricFluids()));
                                  },
                                  child: SizedBox(
                                    //padding: EdgeInsets.all(10),
                                    width: MediaQuery.of(context).size.width / 1.3,
                                    height: MediaQuery.of(context).size.height / 3.3,
                                    child: (Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 10, color: Colors.black38),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(8)),
                                      ),
                                      margin: const EdgeInsets.all(4),
                                      child: Image.asset(
                                          'assets/images/paediatric.png'),
                                    )),
                                  )),
                              GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                AdultFluids()));
                                  },
                                  child: SizedBox(
                                    //padding: EdgeInsets.all(10),
                                    width: MediaQuery.of(context).size.width / 1.3,
                                    height: MediaQuery.of(context).size.height / 3.3,
                                    child: (Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 10, color: Colors.black38),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(8)),
                                      ),
                                      margin: const EdgeInsets.all(4),
                                      child: Image.asset(
                                          'assets/images/adult.png'),
                                    )),
                                  ))
                            ]),
                      ],
                    )))));
  }
}
