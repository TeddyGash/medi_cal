import 'package:flutter/material.dart';
import 'package:medi_cal/back_app_screens/back_home_screen.dart';

import 'welcome_screen.dart';


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