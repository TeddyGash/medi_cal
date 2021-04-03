import 'package:flutter/material.dart';
//import './app_screens/home_screen.dart';
import 'home_screen.dart';


class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.lightBlueAccent,
        child: Center(
          child: Container(
              padding: EdgeInsets.only(top: 60.0),
              alignment: Alignment.center,
              //color: Colors.deepPurple,
              child: Column(
                children: [
                  Container (
                child: 
                  Text(
                    "Welcome",
                    textDirection: TextDirection.ltr,
                    style: TextStyle(color: Colors.white, fontSize: 40.0),
                  ), margin: EdgeInsets.all(10.0),
                  ),
                  Container (
                    child:
                      Text(
                          "to",
                    textDirection: TextDirection.ltr,
                    style: TextStyle(color: Colors.white, fontSize: 24.0),
                  ), margin: EdgeInsets.all(10.0),
                  ),
                  Container (
                    child:
                  Text(
                    "MediCal",
                    textDirection: TextDirection.ltr,
                    style: TextStyle(color: Colors.white, fontSize: 80.0),
                  ), margin: EdgeInsets.all(20.0),),
                  Container(
                    alignment: Alignment.center,
                    child:
                  Text(
                    "All your medical calculators in one place.",
                    textDirection: TextDirection.ltr,
                    style: TextStyle(color: Colors.white, fontSize: 24.0),
                  ),margin: EdgeInsets.all(30.0),),
                  GetStartedButton ()
                ],
              )
          ),
        ));
  }
}

class GetStartedButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 70.0),
      width: 250.0,
      height: 50.0,
    child:
        ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()));},
          //Colors.green, //: Theme.of(context).accentColor,
          //child: Padding(
           // padding: EdgeInsets.fromLTRB(
               // SizeConfig.safeBlockHorizontal * 5,
               // 0,
               // SizeConfig.safeBlockHorizontal * 5,
              //  0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Get Started',
                  style: TextStyle(
                    fontSize: 20,
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

