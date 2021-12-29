import 'package:flutter/material.dart';
import 'package:medi_cal/widget/customRadio.dart';
import 'package:medi_cal/widget/customRadioButton.dart';
import 'package:medi_cal/widget/customWidgets.dart';
//import 'package:medi_cal/widget/groupRadioButton.dart';
//import 'package:medi_cal/widget/widgets.dart';

class CHA2DS2VASc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomAppView(
      pageTitle: 'CHADSVASc Score',
      appBarTitle: CustomAppBarLabel(
        label: "CHADSVASc Score",
      ),
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
  int _responseCHF = -1;
  int _responseHPT = -1;
  int _responseAge = -1;
  int _responseDM = -1;
  int _responsePrevTEE = -1;
  int _responseVascDx = -1;
  int _responseSex = -1;
  int totalScore = 0;
  var _strokeRisk = "";
  String _message = 'Please select as appropriate';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      //key: _formKey,
          child: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          Text(
            'Select as appropriate',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.normal),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
          ),
          Divider(height: 5.0, color: Colors.black),
          Padding(
            padding: EdgeInsets.all(2.0),
          ),
          Text(
            '1. Congestive heart failure?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15.0,
            ),
          ),
            Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyRadioListTile(
                value: 1,
                groupValue: _responseCHF,
                answer: 'Yes',
                //title: Text('One'),
                onChanged: (value) => setState(() => _responseCHF = value),
              ),
              MyRadioListTile(
                value: 0,
                groupValue: _responseCHF,
                answer: 'No',
                //title: Text('Two'),
                onChanged: (value) => setState(() => _responseCHF = value),
              ),
            ],
          ),//.createState().userChoice,
          Divider(
            height: 5.0,
            color: Colors.black,
          ),
          Padding(
            padding: EdgeInsets.all(2.0),
          ),
          Text(
            '2. Hypertension (SBP > 160mmHg)?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15.0,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyRadioListTile(
                value: 1,
                groupValue: _responseHPT,
                answer: 'Yes',
                //title: Text('One'),
                onChanged: (value) => setState(() => _responseHPT = value),
              ),
              MyRadioListTile(
                value: 0,
                groupValue: _responseHPT,
                answer: 'No',
                //title: Text('Two'),
                onChanged: (value) => setState(() => _responseHPT = value),
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
            '3. Age?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15.0,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyRadioListTile(
                value: 0,
                groupValue: _responseAge,
                answer: '<65yrs',
                //title: Text('One'),
                onChanged: (value) => setState(() => _responseAge = value),
              ),
              MyRadioListTile(
                value: 1,
                groupValue: _responseAge,
                answer: '65-74yrs',
                //title: Text('Two'),
                onChanged: (value) => setState(() => _responseAge = value),
              ),
              MyRadioListTile(
                value: 2,
                groupValue: _responseAge,
                answer: '≥75yrs',
                //title: Text('Two'),
                onChanged: (value) => setState(() => _responseAge = value),
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
            '4. Diabetes Mellitus?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15.0,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyRadioListTile(
                value: 1,
                groupValue: _responseDM,
                answer: 'Yes',
                //title: Text('One'),
                onChanged: (value) => setState(() => _responseDM = value),
              ),
              MyRadioListTile(
                value: 0,
                groupValue: _responseDM,
                answer: 'No',
                //title: Text('Two'),
                onChanged: (value) => setState(() => _responseDM = value),
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
            '5. Stroke/Transient Ischemic Attack/Thromboembolic event?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15.0,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyRadioListTile(
                value: 1,
                groupValue: _responsePrevTEE,
                answer: 'Yes',
                //title: Text('One'),
                onChanged: (value) => setState(() => _responsePrevTEE = value),
              ),
              MyRadioListTile(
                value: 0,
                groupValue: _responsePrevTEE,
                answer: 'No',
                //title: Text('Two'),
                onChanged: (value) => setState(() => _responsePrevTEE = value),
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
            '6. Vascular disease (prior MI, PAD, aortic plaque)?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15.0,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyRadioListTile(
                value: 1,
                groupValue: _responseVascDx,
                answer: 'Yes',
                //title: Text('One'),
                onChanged: (value) => setState(() => _responseVascDx = value),
              ),
              MyRadioListTile(
                value: 0,
                groupValue: _responseVascDx,
                answer: 'No',
                //title: Text('Two'),
                onChanged: (value) => setState(() => _responseVascDx = value),
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
            '7. Sex category?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15.0,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyRadioListTile(
                value: 1,
                groupValue: _responseSex,
                answer: 'Female',
                //title: Text('One'),
                onChanged: (value) => setState(() => _responseSex = value),
              ),


          MyRadioListTile(
            value: 0,
            groupValue: _responseSex,
            answer: 'Male',
            //title: Text('Two'),
            onChanged: (value) => setState(() => _responseSex = value),
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
            onPressed:computeScore,
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
            onPressed:resetSelection,
             style: ElevatedButton.styleFrom(
               primary: Colors.redAccent),
            child: Text(
              'Reset Selection',
              style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.normal,
                  color: Colors.white),
            ),
          ),
        ],
      ),
    ));
  }

  void resetSelection() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => CHA2DS2VASc()));
  }

  void computeScore() {
    //validateAnswers();
    calculateScore();
    comment();
  }

  void sumAnswers() {
    totalScore = _responseCHF +
            _responseHPT +
            _responseAge +
            _responseDM +
            _responsePrevTEE +
            _responseVascDx +
            _responseSex;
  }

  void calculateScore() {
    validateAnswers();
    sumAnswers();
  }

  void comment() {
    if (totalScore == 0) {
      _strokeRisk = 'Low Risk';
    } else if (totalScore == 1) {
      _strokeRisk = 'Intermediate Risk. Aspirin/OAC may be started';
    } else if (totalScore >= 2) {
      _strokeRisk = 'High Risk. \n OAC needed.';
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
          title: Text(
            "CHA2DS2VASc Score:", textAlign: TextAlign.center,
            //overflow: TextOverflow.ellipsis,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: Container(
              height: 150,
              width: 200,
              child: Column(
                  //mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "$totalScore\n", textAlign: TextAlign.center,
                      //overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          //fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                    Text(
                      'Stroke Risk:\n',
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text('$_strokeRisk', textAlign: TextAlign.center),
                  ])),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            TextButton(
              child: new Text("Back"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: new Text("Reset"),
              onPressed: () {
                Navigator.of(context).pop();
                resetSelection();
              },
            ),
          ],
        );
      },
    );
  }

  void validateAnswers() {
    if (_responseCHF == -1 ||
        _responseHPT == -1 ||
        _responseAge == -1 ||
        _responseDM == -1 ||
        _responsePrevTEE == -1 ||
        _responseVascDx == -1 ||
        _responseSex == -1) {
      showErrorDialog();
    } else {
      showResultDialog();
    }
  }
}

/*class EditableSelectButton extends StatelessWidget {
  EditableSelectButton({
    Key key,
    @required this.onChanged,
    @required this.initialValue,
    this.yesButtonColor,
    this.noButtonColor,
    this.value,
  }) : super(key: key);

  final Function(double value) onChanged;
  final double initialValue;
  final Color yesButtonColor;
  final Color noButtonColor;
  final double value;

  @override
  Widget build(BuildContext context) {
    return FormField<double>(
      validator: (value) {
        if (value == -1) return 'field is required';
        return null;
      },
      onSaved: (value) => onChanged(value),
      initialValue: -1,
      builder: (formState) {
        return Row(
          children: [
            OutlinedButton(
              //color: yesButtonColor,
              onPressed: () {
                onChanged(1.0);
              },
              child: Row(
                children: [
                  Text('Yes'),
                  if (value == 1.0) Icon(Icons.done, size: 20)
                ],
              ),
            ),
            SizedBox(width: 16),
            OutlinedButton(
              //color: noButtonColor,
              onPressed: () {
                onChanged(0.0);
              },
              child: Row(
                children: [
                  Text('No'),
                  if (value == 0.0) Icon(Icons.done, size: 20)
                ],
              ),
            ),
            if (formState.hasError) ...[
              SizedBox(width: 10),
              Text(
                '*',
                style: TextStyle(color: Colors.red, fontSize: 20),
              )
            ]
          ],
        );
      },
    );
  }
}*/
