import 'package:flutter/material.dart';
import 'package:medi_cal/app_screens/home_screen.dart';
import 'package:medi_cal/widget/customRadio.dart';
import 'package:medi_cal/widget/customWidgets.dart';

class BISHOP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomAppView(
      pageTitle: 'BISHOP Score',
      appBarTitle: CustomAppBarLabel(
        label: "BISHOP Score",
      ),
      backButtonDestination: HomeScreen(),
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
  int _responsePosition = -1;
  int _responseConsistency = -1;
  int _responseEffacement = -1;
  int _responseDilatation = -1;
  int _responseStation = -1;
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
                '1. Cervical Position?',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyRadioListTile(
                    value: 0,
                    groupValue: _responsePosition,
                    answer: 'Posterior',
                    //title: Text('One'),
                    onChanged: (value) => setState(() => _responsePosition = value),
                  ),
                  MyRadioListTile(
                    value: 1,
                    groupValue: _responsePosition,
                    answer: 'Central',
                    //title: Text('Two'),
                    onChanged: (value) => setState(() => _responsePosition = value),
                  ),
                  MyRadioListTile(
                    value: 2,
                    groupValue: _responsePosition,
                    answer: 'Anterior',
                    //title: Text('Two'),
                    onChanged: (value) => setState(() => _responsePosition = value),
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
                '2. Cervical Consistency?',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyRadioListTile(
                    value: 0,
                    groupValue: _responseConsistency,
                    answer: 'Firm',
                    //title: Text('One'),
                    onChanged: (value) => setState(() => _responseConsistency = value),
                  ),
                  MyRadioListTile(
                    value: 1,
                    groupValue: _responseConsistency,
                    answer: 'Medium',
                    //title: Text('Two'),
                    onChanged: (value) => setState(() => _responseConsistency = value),
                  ),
                  MyRadioListTile(
                    value: 2,
                    groupValue: _responseConsistency,
                    answer: 'Soft',
                    //title: Text('Two'),
                    onChanged: (value) => setState(() => _responseConsistency = value),
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
                '3. Cervical Effacement?',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyRadioListTile(
                    value: 0,
                    groupValue: _responseEffacement,
                    answer: '0-30%',
                    //title: Text('One'),
                    onChanged: (value) => setState(() => _responseEffacement = value),
                  ),
                  MyRadioListTile(
                    value: 1,
                    groupValue: _responseEffacement,
                    answer: '40-50%',
                    //title: Text('Two'),
                    onChanged: (value) => setState(() => _responseEffacement = value),
                  ),
                  MyRadioListTile(
                    value: 2,
                    groupValue: _responseEffacement,
                    answer: '60-70%',
                    //title: Text('Two'),
                    onChanged: (value) => setState(() => _responseEffacement = value),
                  ),
                  MyRadioListTile(
                    value: 3,
                    groupValue: _responseEffacement,
                    answer: '≥80%',
                    //title: Text('Two'),
                    onChanged: (value) => setState(() => _responseEffacement = value),
                  ),
                ],
              ),
              Divider(
                height: 5.0,
                color: Colors.black,
              ),
              Text(
                '4. Cervical Dilatation?',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyRadioListTile(
                    value: 0,
                    groupValue: _responseDilatation,
                    answer: '0cm',
                    //title: Text('One'),
                    onChanged: (value) => setState(() => _responseDilatation = value),
                  ),
                  MyRadioListTile(
                    value: 1,
                    groupValue: _responseDilatation,
                    answer: '1-2cm',
                    //title: Text('Two'),
                    onChanged: (value) => setState(() => _responseDilatation = value),
                  ),
                  MyRadioListTile(
                    value: 2,
                    groupValue: _responseDilatation,
                    answer: '3-4cm',
                    //title: Text('Two'),
                    onChanged: (value) => setState(() => _responseDilatation = value),
                  ),
                  MyRadioListTile(
                    value: 3,
                    groupValue: _responseDilatation,
                    answer: '≥5cm',
                    //title: Text('Two'),
                    onChanged: (value) => setState(() => _responseDilatation = value),
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
                '5. Fetal Station?',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyRadioListTile(
                    value: 0,
                    groupValue: _responseStation,
                    answer: '-3',
                    //title: Text('One'),
                    onChanged: (value) => setState(() => _responseStation = value),
                  ),
                  MyRadioListTile(
                    value: 1,
                    groupValue: _responseStation,
                    answer: '-2',
                    //title: Text('Two'),
                    onChanged: (value) => setState(() => _responseStation = value),
                  ),
                  MyRadioListTile(
                    value: 2,
                    groupValue: _responseStation,
                    answer: '-1 or 0',
                    //title: Text('Two'),
                    onChanged: (value) => setState(() => _responseStation = value),
                  ),
                  MyRadioListTile(
                    value: 3,
                    groupValue: _responseStation,
                    answer: '+1 or +3',
                    //title: Text('Two'),
                    onChanged: (value) => setState(() => _responseStation = value),
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
                onPressed: computeScore,
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

  void resetSelection() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => BISHOP()));
  }

  void computeScore() {
    validateAnswers();
    sumAnswers();
    comment();
  }

  void validateAnswers() {
    if (_responsePosition == -1 ||
        _responseConsistency == -1 ||
        _responseEffacement == -1 ||
        _responseDilatation == -1 ||
        _responseStation == -1 ) {
      showErrorDialog();
    } else {
      showResultDialog();
    }
  }

  void sumAnswers() {
    totalScore = _responsePosition +
        _responseConsistency +
        _responseEffacement +
        _responseDilatation +
        _responseStation ;
  }

  void comment() {
    if (0 <= totalScore && totalScore <= 4) {
      _comment = 'Unfavourable Cervix';
    } else if (5 <= totalScore && totalScore <= 6 ) {
      _comment = 'Intermediate';
    } else if (totalScore >= 7) {
      _comment = 'Favourable Cervix';
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
          title: Text("Bishop Score:", textAlign: TextAlign.center,
            //overflow: TextOverflow.ellipsis,
            style: TextStyle(fontWeight: FontWeight.bold),),
          content: Container ( height: 150, width: 200,
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text ("$totalScore/13\n", textAlign: TextAlign.center,
                      //overflow: TextOverflow.ellipsis,
                      style: TextStyle(//fontWeight: FontWeight.bold,
                          fontSize: 25),),
                    Text('Comment:\n', textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                    Text('$_comment', textAlign: TextAlign.center),
                  ])),
        );
      },
    );
  }
}
