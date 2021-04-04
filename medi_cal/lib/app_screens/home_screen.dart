import 'package:flutter/material.dart';
import 'package:medi_cal/app_screens/bmi_inputscreen.dart';

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
    Container( padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: const BorderRadius.all(const Radius.circular(8)),),
      child: Image.asset('assets/images/eGFR.png'),
      // child: Stack(
      //   children : [
      //   Image.asset('assets/images/eGFR.png'),
      //   Text ("eGFR Calculator"),//const Text('Heed not the rabble'),
      //color: Colors.teal[200],
    ),
    Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: const BorderRadius.all(const Radius.circular(8)),),
      child: Image.asset('assets/images/hasbled.jpeg'),
      //color: Colors.teal[300],
    ),
    Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: const BorderRadius.all(const Radius.circular(8)),),
      child: Image.asset('assets/images/CHADSVASC.jpeg'),
    ),
    Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: const BorderRadius.all(const Radius.circular(8)),),
      child: Image.asset('assets/images/dvt.jpeg'),
    ),
    Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: const BorderRadius.all(const Radius.circular(8)),),
      child: Image.asset('assets/images/pe2.webp'),
    ),
    Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: const BorderRadius.all(const Radius.circular(8)),),
      child: Image.asset('assets/images/curb65.jpeg'),
    ),
    Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: const BorderRadius.all(const Radius.circular(8)),),
      child: Image.asset('assets/images/electrolyte.jpeg'),
    ),
    Container(
      padding: const EdgeInsets.all(8),
      child: const Text('Sound of screams but the'),
      color: Colors.teal[300],
    ),
    Container(
      padding: const EdgeInsets.all(8),
      child: const Text('Who scream'),
      color: Colors.teal[400],
    ),
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
