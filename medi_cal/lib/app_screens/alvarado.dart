import 'package:flutter/material.dart';
import 'package:medi_cal/app_screens/home_screen.dart';
import 'package:medi_cal/widget/customRadio.dart';
import 'package:medi_cal/widget/customWidgets.dart';

class ALVARADO extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomAppView(
      pageTitle: 'ALVARADO Score',
      label: "ALVARADO Score",
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
  int _responseMigAbdPain = -1;
  int _responseAnorexia = -1;
  int _responseNauseaVomiting = -1;
  int _responseRIFTenderness = -1;
  int _responseRBT = -1;
  int _responseFever = -1;
  int _responseLeucocytosis = -1;
  int _responseNeutrophilia = -1;
  int totalScore = 0;
  var _appendicitisProbability = "";
  //String _message = 'Please select as appropriate';



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlueAccent,
        body: Center(
            child: Container(
                width: 400,
                child: Card(
                    color: Colors.white,
                    elevation: 10,
                    child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                child: ListView(
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
                                    Padding(
                                      padding: EdgeInsets.all(2.0),
                                    ),
                                    Text(
                                      'SYMPTOMS:',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          backgroundColor: Colors.blue),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(2.0),
                                    ),
                                    Divider(height: 5.0, color: Colors.black),
                                    Padding(
                                      padding: EdgeInsets.all(2.0),
                                    ),
                                    Text(
                                      '1. Abdominal pain that migrates to the right iliac fossa?',
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
                                          groupValue: _responseMigAbdPain,
                                          answer: 'Yes',
                                          //title: Text('One'),
                                          onChanged: (value) => setState(() => _responseMigAbdPain = value),
                                        ),
                                        MyRadioListTile(
                                          value: 0,
                                          groupValue: _responseMigAbdPain,
                                          answer: 'No',
                                          //title: Text('Two'),
                                          onChanged: (value) => setState(() => _responseMigAbdPain = value),
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
                                      '2. Anorexia (loss of appetite) or ketones in the urine?',
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
                                          groupValue: _responseAnorexia,
                                          answer: 'Yes',
                                          //title: Text('One'),
                                          onChanged: (value) => setState(() => _responseAnorexia = value),
                                        ),
                                        MyRadioListTile(
                                          value: 0,
                                          groupValue: _responseAnorexia,
                                          answer: 'No',
                                          //title: Text('Two'),
                                          onChanged: (value) => setState(() => _responseAnorexia = value),
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
                                      '3. Nausea or vomiting?',
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
                                          groupValue: _responseNauseaVomiting,
                                          answer: 'Yes',
                                          //title: Text('One'),
                                          onChanged: (value) => setState(() => _responseNauseaVomiting = value),
                                        ),
                                        MyRadioListTile(
                                          value: 0,
                                          groupValue: _responseNauseaVomiting,
                                          answer: 'No',
                                          //title: Text('Two'),
                                          onChanged: (value) => setState(() => _responseNauseaVomiting = value),
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
                                        'SIGNS:',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 15.0,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            backgroundColor: Colors.blue),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(2.0),
                                    ),
                                    Divider(height: 5.0, color: Colors.black),
                                    Text(
                                      '4. Tenderness in the right iliac fossa?',
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
                                          value: 2,
                                          groupValue: _responseRIFTenderness,
                                          answer: 'Yes',
                                          //title: Text('One'),
                                          onChanged: (value) => setState(() => _responseRIFTenderness = value),
                                        ),
                                        MyRadioListTile(
                                          value: 0,
                                          groupValue: _responseRIFTenderness,
                                          answer: 'No',
                                          //title: Text('Two'),
                                          onChanged: (value) => setState(() => _responseRIFTenderness = value),
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
                                      '5. Rebound tenderness?',
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
                                          groupValue: _responseRBT,
                                          answer: 'Yes',
                                          //title: Text('One'),
                                          onChanged: (value) => setState(() => _responseRBT = value),
                                        ),
                                        MyRadioListTile(
                                          value: 0,
                                          groupValue: _responseRBT,
                                          answer: 'No',
                                          //title: Text('Two'),
                                          onChanged: (value) => setState(() => _responseRBT = value),
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
                                      '6. Fever of 37.3 °C or more?',
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
                                          groupValue: _responseFever,
                                          answer: 'Yes',
                                          //title: Text('One'),
                                          onChanged: (value) => setState(() => _responseFever = value),
                                        ),
                                        MyRadioListTile(
                                          value: 0,
                                          groupValue: _responseFever,
                                          answer: 'No',
                                          //title: Text('Two'),
                                          onChanged: (value) => setState(() => _responseFever = value),
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
                                      'LABORATORY FINDINGS:',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          backgroundColor: Colors.blue),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(2.0),
                                    ),
                                    Divider(height: 5.0, color: Colors.black),
                                    Text(
                                      '7. Leucocytosis > 10,000?',
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
                                          value: 2,
                                          groupValue: _responseLeucocytosis,
                                          answer: 'Yes',
                                          //title: Text('One'),
                                          onChanged: (value) => setState(() => _responseLeucocytosis = value),
                                        ),
                                        MyRadioListTile(
                                          value: 0,
                                          groupValue: _responseLeucocytosis,
                                          answer: 'No',
                                          //title: Text('Two'),
                                          onChanged: (value) => setState(() => _responseLeucocytosis = value),
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
                                      '8. Neutrophilia > 70%?',
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
                                          groupValue: _responseNeutrophilia,
                                          answer: 'Yes',
                                          //title: Text('One'),
                                          onChanged: (value) => setState(() => _responseNeutrophilia = value),
                                        ),
                                        MyRadioListTile(
                                          value: 0,
                                          groupValue: _responseNeutrophilia,
                                          answer: 'No',
                                          //title: Text('Two'),
                                          onChanged: (value) => setState(() => _responseNeutrophilia = value),
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
                              )
                            ]))))));
  }

  void resetSelection() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => ALVARADO()));
  }

  void computeScore() {
    validateAnswers();
    sumAnswers();
    comment();
  }

  void sumAnswers() {
    totalScore = _responseMigAbdPain +
        _responseAnorexia +
        _responseNauseaVomiting +
        _responseRIFTenderness +
        _responseRBT +
        _responseFever +
        _responseLeucocytosis +
        _responseNeutrophilia;
  }

  void comment() {
    if (0 <= totalScore && totalScore <= 4) {
      _appendicitisProbability = 'Appendicitis unlikely';
    } else if (5 <= totalScore && totalScore <= 6 ) {
      _appendicitisProbability = 'Appendicitis possible';
    } else if (totalScore >= 7) {
      _appendicitisProbability = 'Appendicitis very probable';
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
          title: Text("ALVARADO Score:", textAlign: TextAlign.center,
            //overflow: TextOverflow.ellipsis,
            style: TextStyle(fontWeight: FontWeight.bold),),
          content: Container ( height: 150, width: 200,
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text ("$totalScore/10\n", textAlign: TextAlign.center,
                      //overflow: TextOverflow.ellipsis,
                      style: TextStyle(//fontWeight: FontWeight.bold,
                          fontSize: 25),),
                    Text('Comment:\n', textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                    Text('$_appendicitisProbability', textAlign: TextAlign.center),
                  ])),
        );
      },
    );
  }

  void validateAnswers() {
    if (_responseMigAbdPain == -1 ||
        _responseAnorexia == -1 ||
        _responseNauseaVomiting == -1 ||
        _responseRIFTenderness == -1 ||
        _responseRBT == -1 ||
        _responseFever == -1 ||
        _responseLeucocytosis == -1 ||
        _responseNeutrophilia == -1) {
      showErrorDialog();
    } else {
      showResultDialog();
    }
  }
}
