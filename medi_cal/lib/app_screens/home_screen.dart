import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:medi_cal/app_screens/CHA2DS2VASc.dart';
import 'package:medi_cal/app_screens/GAcalculator.dart';
import 'package:medi_cal/app_screens/alvarado.dart';
import 'package:medi_cal/app_screens/bishop.dart';
import 'package:medi_cal/app_screens/bmi_inputscreen.dart';
import 'package:medi_cal/app_screens/curb_65.dart';
import 'package:medi_cal/app_screens/egfr.dart';
import 'package:medi_cal/app_screens/fluidsHome.dart';
import 'package:medi_cal/app_screens/gcs_home.dart';
import 'package:medi_cal/app_screens/hasbleed.dart';
import 'package:medi_cal/app_screens/neonatalCalcHome.dart';
import 'package:medi_cal/app_screens/weightEstimator.dart';
import 'package:medi_cal/app_screens/wellscore_dvt.dart';
import 'package:medi_cal/app_screens/wellscore_pe.dart';

import 'electrolytes.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "MediCal",
        home: Scaffold(
          appBar: AppBar(
            title: Text("MediCal"),
          ),
          body: HomeCore(),
        ));
  }
}

class HomeCore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.lightBlueAccent,
        child: Center(
            child: Container(
                padding: EdgeInsets.only(top: 0.0),
                alignment: Alignment.center,
                //color: Colors.deepPurple,
                child: CalcList(context))));
  }
}

// ignore: non_constant_identifier_names
CalcList(context) => GridView.count(
      primary: false,
      padding: EdgeInsets.all(5.0.w),
      crossAxisSpacing: 2.h,
      mainAxisSpacing: 2.w,
      crossAxisCount: 3,
      children: <Widget>[
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => NeonatalHome()));
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(3.0.w),
            ),
            elevation: 10,
            child: (ClipRRect(
              borderRadius: BorderRadius.circular(5.w),
              child: Image.asset('assets/images/neonatal.jpeg', fit: BoxFit.fill,),
            )),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => BmiInputScreen()));
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(3.0.w),
            ),
            elevation: 10,
            child: (ClipRRect(
              borderRadius: BorderRadius.circular(3.0.w),
              child: Image.asset('assets/images/bmi.png', fit: BoxFit.fill,),
            )),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context) => EGFR()));
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(3.0.w),
            ),
            elevation: 8,
            child: (ClipRRect(
              borderRadius: BorderRadius.circular(3.0.w),
              child: Image.asset('assets/images/eGFR.png', fit: BoxFit.fill,),
            )),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => HASBLED()));
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(3.0.w),
            ),
            elevation: 8,
            child: (ClipRRect(
              borderRadius: BorderRadius.circular(3.0.w),
              child: Image.asset('assets/images/hasbled.jpeg', fit: BoxFit.fill,),
            )),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => CHA2DS2VASc()));
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(3.0.w),
            ),
            elevation: 8,
            child: (ClipRRect(
              borderRadius: BorderRadius.circular(3.0.w),
              child: Image.asset('assets/images/CHADSVASC.jpeg', fit: BoxFit.fill,),
            )),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => WellsScoreDVT()));
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(3.0.w),
            ),
            elevation: 8,
            child: (ClipRRect(
              borderRadius: BorderRadius.circular(3.0.w),
              child: Image.asset('assets/images/dvt.jpeg', fit: BoxFit.fill,),
            )),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => WellsScorePE()));
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(3.0.w),
            ),
            elevation: 8,
            child: (ClipRRect(
              borderRadius: BorderRadius.circular(3.0.w),
              child: Image.asset('assets/images/pe.jpeg', fit: BoxFit.fill,),
            )),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context) => CURB65()));
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(3.0.w),
            ),
            elevation: 8,
            child: (ClipRRect(
              borderRadius: BorderRadius.circular(3.0.w),
              child: Image.asset('assets/images/curb65.jpeg', fit: BoxFit.fill,),
            )),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => ChooseMethod()));
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(3.0.w),
            ),
            elevation: 8,
            child: (ClipRRect(
              borderRadius: BorderRadius.circular(3.0.w),
              child: Image.asset('assets/images/GAcalculator.jpeg', fit: BoxFit.fill,),
            )),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => ALVARADO()));
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(3.0.w),
            ),
            elevation: 10,
            child: (ClipRRect(
              borderRadius: BorderRadius.circular(3.0.w),
              child: Image.asset('assets/images/alvarado.jpeg', fit: BoxFit.fill,),
            )),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context) => BISHOP()));
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(3.0.w),
            ),
            elevation: 10,
            child: (ClipRRect(
              borderRadius: BorderRadius.circular(3.0.w),
              child: Image.asset('assets/images/Bishop_score.jpeg', fit: BoxFit.fill,),
            )),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => GCSHome()));
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(3.0.w),
            ),
            elevation: 10,
            child: (ClipRRect(
              borderRadius: BorderRadius.circular(3.0.w),
              child: Image.asset('assets/images/GCS_score.jpeg', fit: BoxFit.fill,),
            )),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => SelectElectrolyte()));
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(3.0.w),
            ),
            elevation: 10,
            child: (ClipRRect(
              borderRadius: BorderRadius.circular(3.0.w),
              child: Image.asset('assets/images/electrolytes.jpeg', fit: BoxFit.fill,),
            )),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => FluidsHome()));
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(3.0.w),
            ),
            elevation: 10,
            child: (ClipRRect(
              borderRadius: BorderRadius.circular(3.0.w),
              child: Image.asset('assets/images/paed_fluid.jpeg', fit: BoxFit.fill,),
            )),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => WeightEstimator()));
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(3.0.w),
            ),
            elevation: 10,
            child: (ClipRRect(
              borderRadius: BorderRadius.circular(3.0.w),
              child: Image.asset('assets/images/child_growth.jpeg', fit: BoxFit.fill,),
            )),
          ),
        ),
      ],
    );
