import 'package:flutter/material.dart';


class BmiInputScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "BMI Calculator",
        home: Scaffold(
          appBar: AppBar(title: Text("BMI Calculator"),),
          body: BmiInputCore (),
        )
    );
  }
}

class BmiInputCore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.lightBlueAccent,
        child: Center(
            child: Container(
              padding: EdgeInsets.only(top: 0.0),
              alignment: Alignment.center,)));}}