import 'package:flutter/material.dart';

import 'welcome_screen.dart';


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