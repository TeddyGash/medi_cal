import 'package:flutter/material.dart';
import 'package:medi_cal/app_screens/home_screen.dart';
import 'package:medi_cal/widget/customWidgets.dart';
import 'gcs_adult.dart';
import 'gcs_paeds.dart';

class GCSHome extends StatefulWidget {
  @override
  _GCSHomeState createState() => _GCSHomeState();
}

class _GCSHomeState extends State<GCSHome> {

  @override
  Widget build(BuildContext context) {
    return CustomAppView(
      pageTitle: 'GCSHome',
      label: "GCS Calculator",
      backButtonDestination: HomeScreen(),
      pageBody: Center(
          child: Container(
              width: 400,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 15),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          PaediatricGCS()));
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
                                          AdultGCS()));
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
              ))),
    );
  }
}
