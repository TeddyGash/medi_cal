import 'package:flutter/material.dart';
import "./app_screens/welcome_screen.dart";

void main() {
  runApp(Medical());
}

class Medical extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "MediCal",
        home: Scaffold(
            appBar: AppBar(title: Text("MediCal"),),
            body: WelcomeScreen()
        )
    );
  }
}