import 'package:flutter/material.dart';
import 'package:medi_cal/app_screens/bmi_inputscreen.dart';
import 'package:medi_cal/app_screens/egfr.dart';
import 'package:medi_cal/app_screens/hasbleed.dart';
import 'package:medi_cal/app_screens/CHA2DS2VASc.dart';
import 'package:medi_cal/app_screens/wellscore_dvt.dart';
import 'package:medi_cal/app_screens/wellscore_pe.dart';
import 'package:medi_cal/app_screens/curb_65.dart';
import 'package:medi_cal/app_screens/GAcalculator3.dart';
import 'package:medi_cal/app_screens/alvarado.dart';

//import 'welcome_screen.dart';


class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "MediCal",
        home: Scaffold(
            appBar: AppBar(title: Text("MediCal"),),
            body: HomeCore (),
        )
    );
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
                child:
                CalcList(context)
            )));
  }
}

// ignore: non_constant_identifier_names
CalcList (context) => GridView.count(
  primary: false,
  padding: const EdgeInsets.all(20),
  crossAxisSpacing: 10,
  mainAxisSpacing: 10,
  crossAxisCount: 2,
  children: <Widget>[
      GestureDetector(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context) =>
                BmiInputScreen()
        ));},
        child: (
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: const BorderRadius.all(const Radius.circular(8)),),
            child: Image.asset('assets/images/bmi.png'),
          )),),
      GestureDetector(
        onTap: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (BuildContext context) => EGFR()
              ));},
        child: (
            Container( padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: const BorderRadius.all(const Radius.circular(8)),),
        child: Image.asset('assets/images/eGFR.png'),
      )),),
    GestureDetector(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context) => HASBLED()
            ));},
      child: (
    Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: const BorderRadius.all(const Radius.circular(8)),),
      child: Image.asset('assets/images/hasbled.jpeg'),
      //color: Colors.teal[300],
    )),),
    GestureDetector(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context) => CHA2DS2VASc()
            ));},
      child: (
    Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: const BorderRadius.all(const Radius.circular(8)),),
      child: Image.asset('assets/images/CHADSVASC.jpeg'),
    )),),
    GestureDetector(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context) => WellsScoreDVT()
            ));},
      child: (
    Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: const BorderRadius.all(const Radius.circular(8)),),
      child: Image.asset('assets/images/dvt.jpeg'),
    )),),
    GestureDetector(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context) => WellsScorePE()
            ));},
      child: (
    Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: const BorderRadius.all(const Radius.circular(8)),),
      child: Image.asset('assets/images/pe.jpeg'),
    )),),
    GestureDetector(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context) => CURB65()
            ));},
      child: (
    Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: const BorderRadius.all(const Radius.circular(8)),),
      child: Image.asset('assets/images/curb65.jpeg'),
    )),),
    GestureDetector(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context) => ChooseMethod()
            ));},
      child: (
    Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: const BorderRadius.all(const Radius.circular(8)),),
      child: Image.asset('assets/images/GAcalculator.jpeg'),
    )),),
    GestureDetector(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context) => ALVARADO()
            ));},
      child: (
    Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: const BorderRadius.all(const Radius.circular(8)),),
      child: Image.asset('assets/images/alvarado.jpeg'),
    )),),
    GestureDetector(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context) => ChooseMethod()
            ));},
      child: (
    Container(
      padding: const EdgeInsets.all(8),
      child: Image.asset('assets/images/Bishop_score.jpeg'),
    )),),
    GestureDetector(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context) => ChooseMethod()
            ));},
      child: (
    Container(
      padding: const EdgeInsets.all(8),
      child: Image.asset('assets/images/GCS_score.jpeg'),
    )),),
    Container(
      padding: const EdgeInsets.all(8),
      child: const Text('Revolution is coming...'),
      color: Colors.teal[500],
    ),
    Container(
      padding: const EdgeInsets.all(8),
      child: const Text('Revolution, they...'),
      color: Colors.teal[600],
    ),
  ],
);
