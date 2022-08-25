import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:medi_cal/widget/customWidgets.dart';
import 'package:medi_cal/app_screens/home_screen.dart';
import 'neonatal_thompsons.dart';
import 'neonatal_ballard.dart';
import 'neonatal_Fluids.dart';
import 'neonatal_sbr.dart';

class NeonatalHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomAppView(
      pageTitle: 'NeonatalHome',
      label: "Neonatal Calculators",
      backButtonDestination: HomeScreen(),
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
        padding:  EdgeInsets.fromLTRB(10.0.w, 4.0.h, 10.0.w, 5.0.h),
        child: ListView(
          children: [
            GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Fluids()));
                },
                child: Container(
                  margin: EdgeInsets.only(top: 2.h, bottom: 2.h),
                  padding: EdgeInsets.all(7),
                  width: 80.0.w,
                  height: 10.0.h,
                  decoration: BoxDecoration(
                    boxShadow: <BoxShadow>[
                      BoxShadow (
                          color: Colors.black54,
                          blurRadius: 5.0.w,
                          offset: Offset(2.w, 2.h)
                      )
                    ],
                    shape: BoxShape.rectangle,
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.all(Radius.circular(3.w)),
                  ),
                  child: Center(
                    child: Text(
                      "Maintenance Fluid",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28.0.dp,
                        fontStyle: FontStyle.normal,
                        fontFamily: 'helvetica_neue_light',
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )),
            GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => ThompsonsScore()));
                },
                child: Container(
                  margin: EdgeInsets.only(top: 2.h, bottom: 2.h),
                  padding: EdgeInsets.all(7),
                  width: 80.0.w,
                  height: 10.0.h,
                  decoration: BoxDecoration(
                    boxShadow: <BoxShadow>[
                      BoxShadow (
                          color: Colors.black54,
                          blurRadius: 5.0.w,
                          offset: Offset(2.w, 2.h)
                      )
                    ],
                    shape: BoxShape.rectangle,
                    color: Colors.purple,
                    borderRadius: BorderRadius.all(Radius.circular(3.w)),
                  ),
                  child: Center(
                    child: Text(
                      "Thompson's Score",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28.0.dp,
                        fontStyle: FontStyle.normal,
                        fontFamily: 'helvetica_neue_light',
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )),
            GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => BallardScore()));
                },
                child: Container(
                  margin: EdgeInsets.only(top: 2.h, bottom: 2.h),
                  padding: EdgeInsets.all(7),
                  width: 80.0.w,
                  height: 10.0.h,
                  decoration: BoxDecoration(
                    boxShadow: <BoxShadow>[
                      BoxShadow (
                          color: Colors.black54,
                          blurRadius: 5.0.w,
                          offset: Offset(2.w, 2.h)
                      )
                    ],
                    shape: BoxShape.rectangle,
                    color: Colors.green,
                    borderRadius: BorderRadius.all(Radius.circular(3.w)),
                  ),
                  child: Center(
                    child: Text(
                      "Ballard Score",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0.dp,
                        fontStyle: FontStyle.normal,
                        fontFamily: 'helvetica_neue_light',
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )),
            GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => SBR()));
                },
                child: Container(
                  margin: EdgeInsets.only(top: 2.h, bottom: 2.h),
                  padding: EdgeInsets.all(7),
                  width: 80.0.w,
                  height: 10.0.h,
                  decoration: BoxDecoration(
                    boxShadow: <BoxShadow>[
                      BoxShadow (
                          color: Colors.black54,
                          blurRadius: 5.0.w,
                          offset: Offset(2.w, 2.h)
                      )
                    ],
                    shape: BoxShape.rectangle,
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.all(Radius.circular(3.w)),
                  ),
                  child: Center(
                    child: Text(
                      "Serum Bilirubin",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0.dp,
                        fontStyle: FontStyle.normal,
                        fontFamily: 'helvetica_neue_light',
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
