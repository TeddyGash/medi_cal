import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'home_screen.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WelcomeCore();
  }
}

class WelcomeCore extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return  Material(
        color: Colors.lightBlueAccent,
        child: Center(
          child: Container(
              padding: EdgeInsets.all(8.w),
              alignment: Alignment.center,
              //color: Colors.deepPurple,
              child:
              Column(
                children: [
                  SizedBox(height: 5.h,),
                  Container (
                    child:
                    Text(
                      "Welcome",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(color: Colors.white, fontSize: 40.0.dp),
                    ),
                  ),
                  SizedBox(height: 5.h,),
                  Container (
                    child:
                    Text(
                      "to",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(color: Colors.white, fontSize: 24.0.dp),
                    ),
                  ),
                  SizedBox(height: 7.h,),
                  Container (
                    child:
                    Text(
                      "MediCal",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(color: Colors.white, fontSize: 73.0.dp, fontWeight: FontWeight.bold),
                    ),),
                  SizedBox(height: 10.h,),
                  Container(
                    alignment: Alignment.center,
                    child:
                    Text(
                      "All your medical calculators in one place.", textAlign: TextAlign.center,
                      textDirection: TextDirection.ltr,
                      style: TextStyle(color: Colors.white, fontSize: 18.0.dp, fontStyle: FontStyle.italic, fontFamily: 'Roboto',),
                    ),),
                  SizedBox(height: 10.h,),
                  GetStartedButton ()
                ],
              )
          ),
        ));


  }}

class GetStartedButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60.0.w,
      height: 8.0.h,
      child:
      ElevatedButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()));},

        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Get Started',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.dp,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            Icon(
              Icons.arrow_forward,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}

