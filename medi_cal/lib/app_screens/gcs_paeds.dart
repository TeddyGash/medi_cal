import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:medi_cal/widget/customWidgets.dart';
import 'gcs_home.dart';

class PaediatricGCS extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomAppView(
      pageTitle: 'PaediatricGCS',
      label: "Paediatric GCS",
      backButtonDestination: GCSHome(),
      pageBody: InputFields(),
    );
  }
}

// Define a custom Form widget.
class InputFields extends StatefulWidget {
  @override
  _InputFieldsState createState() => _InputFieldsState();
}

// Define a corresponding State class.
// This class holds data related to the form.
class _InputFieldsState extends State<InputFields> {
  //final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  int _eyes = -1;
  int _verbal = -1;
  int _motor = -1;

  int totalScore = 0;
  var _comment = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
          //key: _formKey,
          child:ListView(
            children: [
              Text(
                'Select as appropriate',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.normal),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
              ),
              Divider(height: 5.0, color: Colors.black),
              Text(
                '1. Eyes',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RadioListTile<int>(
                    title: const Text('Opens eyes spontaneously(4)'),
                    value: 4,
                    groupValue: _eyes,
                    onChanged: (value) {
                      setState(() {
                        _eyes = value!;
                      });
                    },
                  ),
                  RadioListTile<int>(
                    title: const Text('Opens eyes in response to speech(3)'),
                    value: 3,
                    groupValue: _eyes,
                    onChanged: (value) {
                      setState(() {
                        _eyes = value!;
                      });
                    },
                  ),
                  RadioListTile<int>(
                    title: const Text('Opens eyes in response to painful stimuli(2)'),
                    value: 2,
                    groupValue: _eyes,
                    onChanged: (value) {
                      setState(() {
                        _eyes = value!;
                      });
                    },
                  ),
                  RadioListTile<int>(
                    title: const Text('Does not open eyes(1)'),
                    value: 1,
                    groupValue: _eyes,
                    onChanged: (value) {
                      setState(() {
                        _eyes = value!;
                      });
                    },
                  ),
                ],
              ),
              Divider(
                height: 5.0,
                color: Colors.black,
              ),
              Padding(
                padding: EdgeInsets.all(2.0),
              ),
              Text(
                '2. Verbal',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RadioListTile<int>(
                    title: Text('Smiles, orients to sounds, follows objects, interacts(5)'),
                    value: 5,
                    groupValue: _verbal,
                    onChanged: (value) {
                      setState(() {
                        _verbal = value!;
                      });
                    },
                  ),
                  RadioListTile<int>(
                    title: Text('Cries but consolable, inappropriate interactions(4)'),
                    value: 4,
                    groupValue: _verbal,
                    onChanged: (value) {
                      setState(() {
                        _verbal = value!;
                      });
                    },
                  ),
                  RadioListTile<int>(
                    title: Text('Inconsistently inconsolable, moaning(3)'),
                    value: 3,
                    groupValue: _verbal,
                    onChanged: (value) {
                      setState(() {
                        _verbal = value!;
                      });
                    },
                  ),
                  RadioListTile<int>(
                    title: Text('Inconsolable, agitated(2)'),
                    value: 2,
                    groupValue: _verbal,
                    onChanged: (value) {
                      setState(() {
                        _verbal = value!;
                      });
                    },
                  ),
                  RadioListTile<int>(
                    title: Text('No verbal response(1)'),
                    value: 1,
                    groupValue: _verbal,
                    onChanged: (value) {
                      setState(() {
                        _verbal = value!;
                      });
                    },
                  ),
                ],
              ),
              Divider(
                height: 5.0,
                color: Colors.black,
              ),
              Padding(
                padding: EdgeInsets.all(2.0),
              ),
              Text(
                '3. Motor',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RadioListTile<int>(
                    title: Text('Infant moves spontaneously or purposefully(6)'),
                    value: 6,
                    groupValue: _motor,
                    onChanged: (value) {
                      setState(() {
                        _motor = value!;
                      });
                    },
                  ),
                  RadioListTile<int>(
                    title: Text('Infant withdraws from touch(5)'),
                    value: 5,
                    groupValue: _motor,
                    onChanged: (value) {
                      setState(() {
                        _motor = value!;
                      });
                    },
                  ),
                  RadioListTile<int>(
                    title: Text('Infant withdraws from pain(4)'),
                    value: 4,
                    groupValue: _motor,
                    onChanged: (value) {
                      setState(() {
                        _motor = value!;
                      });
                    },
                  ),
                  RadioListTile<int>(
                    title: Text('Abnormal flexion to pain for an infant (decorticate response)(3)'),
                    value: 3,
                    groupValue: _motor,
                    onChanged: (value) {
                      setState(() {
                        _motor = value!;
                      });
                    },
                  ),
                  RadioListTile<int>(
                    title: Text('Extension to pain (decerebrate response)(2)'),
                    value: 2,
                    groupValue: _motor,
                    onChanged: (value) {
                      setState(() {
                        _motor = value!;
                      });
                    },
                  ),
                  RadioListTile<int>(
                    title: Text('No motor response(1)'),
                    value: 1,
                    groupValue: _motor,
                    onChanged: (value) {
                      setState(() {
                        _motor = value!;
                      });
                    },
                  ),
                ],
              ),
              Divider(
                height: 5.0,
                color: Colors.black,
              ),
              Padding(
                padding: EdgeInsets.all(2.0),
              ),
              ElevatedButton(
                onPressed: validateAnswers,
                child: Text(
                  'Check Final Score',
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.normal,
                      color: Colors.white),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(4.0),
              ),
              ElevatedButton(
                onPressed: resetSelection,
                style: ElevatedButton.styleFrom(
                  primary: Colors.redAccent,),
                child: Text(
                  'Reset Selection',
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 16.0,
                      color: Colors.white),
                ),
              )
            ],
          ),
        ));
  }

  Color _color = Colors.black;

  void resetSelection() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => PaediatricGCS()));
  }

  void computeScore() {
    sumAnswers();
    comment();
    showResultDialog();
  }

  void validateAnswers() {
    if (_eyes == -1 ||
        _verbal == -1 ||
        _motor == -1 ) {
      showErrorDialog();
    } else {
      computeScore();
    }
  }

  void sumAnswers() {
    totalScore = _eyes + _verbal + _motor;
  }

  void comment() {
    if (3 <= totalScore && totalScore <= 8) {
      _comment = 'Severe Head Injury';
      _color = Colors.red;
    } else if (9 <= totalScore && totalScore <= 12 ) {
      _comment = 'Moderate Head Injury';
      _color = Colors.blueAccent;
    } else if (totalScore >= 13) {
      _comment = 'Mild Head Injury';
      _color = Colors.green;
    }
  }

  void showErrorDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return ErrorDialog();
      },
    );
  }

  void showResultDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(3.0.w))),
              //contentPadding: EdgeInsets.only(top: 10.0),
          //title: 
          content: Container ( height: 30.h, width: 75.w,
              padding: EdgeInsets.all(0.0),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: 100.w,
                      height: 8.h,
                      margin: EdgeInsets.all(0.0),
                      padding: EdgeInsets.all(0.0),
                      color: Colors.blueAccent,
                      child: Text("GCS (Paediatric):", textAlign: TextAlign.center,
                        //overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                    Text ("$totalScore/15\n", textAlign: TextAlign.center,
                      //overflow: TextOverflow.ellipsis,
                      style: TextStyle(//fontWeight: FontWeight.bold,
                          fontSize: 25),),
                    Text('Comment:\n', textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                    Text('$_comment', textAlign: TextAlign.center,
                      style: TextStyle(color: _color),),
                  ])),
        );
      },
    );
  }
}
