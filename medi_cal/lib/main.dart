import 'package:flutter/material.dart';
import "./app_screens/welcome_screen.dart";
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:device_preview/device_preview.dart';


/*void main() {
  runApp(Medical());
}*/

void main() => runApp(
  DevicePreview(
    enabled: !true,
    builder: (context) => Medical(), // Wrap your app
  ),
);

class Medical extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return FlutterSizer(
        builder: (context, orientation, screenType) {
       return MaterialApp(
           useInheritedMediaQuery: true,
           locale: DevicePreview.locale(context),
           builder: DevicePreview.appBuilder,
           debugShowCheckedModeBanner: false,
           title: "MediCal",
           home: Scaffold(
              appBar: AppBar(title: Text("MediCal"),),
              body: WelcomeScreen()
        )
    );});}
  }



