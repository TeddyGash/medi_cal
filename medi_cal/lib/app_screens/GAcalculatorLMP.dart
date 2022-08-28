import 'dart:async';
import 'package:flutter/material.dart';
import 'package:medi_cal/app_screens/GAcalculator.dart';
import 'package:medi_cal/app_screens/GAcalculatorGA.dart';
import 'package:medi_cal/app_screens/GAcalculatorEDD.dart';
import 'package:medi_cal/widget/customWidgets.dart';

// LMP
class GAcalculatorLMP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomAppView(
      pageTitle: 'EGA/EDD Calculator',
      label: "EGA/EDD Calculator",
      backButtonDestination: ChooseMethod(),
      pageBody: GAcalculatorCoreLMP(),
    );
  }
}

class GAcalculatorCoreLMP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.lightBlueAccent,
        child: Center(
            child: Container(
              padding: EdgeInsets.only(top: 0.0),
              alignment: Alignment.center,
              child: InputFieldsLMP(),
            )));
  }
}

// Define a custom Form widget.
class InputFieldsLMP extends StatefulWidget {
  @override
  _InputFieldsLMPState createState() => _InputFieldsLMPState();
}

// Define a corresponding State class.
// This class holds data related to the form.
class _InputFieldsLMPState extends State<InputFieldsLMP> {
  DateTime selectedLMP = DateTime.now();
  DateTime selectedEDD = DateTime.now();

  final weeks = List.generate(43, (i) => i + 1);

  final days = List.generate(6, (i) => i + 1);

  int gaInDays = -1;
  int gaDays = -1;
  int gaWeeks = -1;
  DateTime eDD = DateTime.now();

  int _radioValue1 = 1;

  void _handleRadioValueChange1(value) {
    setState(() {
      _radioValue1 = value;
    });
  }

  void goToInputScreen() {
    if (_radioValue1 == 1) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => GAcalculatorLMP()));
    } else if (_radioValue1 == 2) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => GAcalculatorGA()));
    } else if (_radioValue1 == 3) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => GAcalculatorEDD()));
    }
  }

  Future<void> _selectLMP(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedLMP,
      firstDate: DateTime(2019, 8),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedLMP)
      setState(() {
        selectedLMP = picked;
        //selectedLMP = _formatDate(dateFormat: 'dd/mm/yyyy');
      });
  }



  void calcGA() {
    int daysBetween(DateTime from, DateTime to) {
      from = DateTime(from.year, from.month, from.day);
      to = DateTime(to.year, to.month, to.day);
      return (to.difference(from).inHours / 24).round();
    }
    gaInDays = daysBetween(selectedLMP, DateTime.now());
    gaDays = gaInDays % 7;
    gaWeeks = gaInDays ~/ 7;

  }

  void calcEDD() {
    eDD = selectedLMP.add(const Duration(days: 280));
  }

  void displayResult() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (BuildContext context) => DisplayResultLMP()));
  }

  void compute() {
    calcGA();
    calcEDD();
    showResultDialog();
  }

  void resetSelection() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (BuildContext context) => ChooseMethod()));
  }

  void showResultDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Text(
            "GA/EDD Calculator", textAlign: TextAlign.center,
            //overflow: TextOverflow.ellipsis,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: Container(
              height: 150,
              width: 200,
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text('Gestational Age Today'),
                    Padding(
                      padding: EdgeInsets.all(5.0),
                    ),
                        Text(
                          "$gaWeeks" + 'week(s), ' "$gaDays" + 'day(s)',
                          style: TextStyle(fontSize: 13.0),
                        ),
                    //Divider(height: 5.0, color: Colors.black),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                    ),
                    Text (
                      'EDD: ',
                    ),
                    Padding(
                      padding: EdgeInsets.all(5.0),
                    ),
                    Text(
                      "$eDD.toLocal()}"
                          .split(' ')[0],
                      style: TextStyle(fontSize: 13.0),
                    ),
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
                //Navigator.of(context).pop();
                resetSelection();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    //final _style = Theme.of(context).textTheme.display2;
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
                                      'Calculate based on:',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold,
                                          fontStyle: FontStyle.italic),
                                    ),
                                    Row(
                                      //mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Radio(
                                          value: 1,
                                          groupValue: _radioValue1,
                                          onChanged: _handleRadioValueChange1,
                                        ),
                                        Text(
                                          'LMP',
                                          style: TextStyle(fontSize: 13.0),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Radio(
                                          value: 2,
                                          groupValue: _radioValue1,
                                          onChanged: _handleRadioValueChange1,
                                        ),
                                        Text(
                                          'GA',
                                          style: TextStyle(fontSize: 13.0),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Radio(
                                          value: 3,
                                          groupValue: _radioValue1,
                                          onChanged: _handleRadioValueChange1,
                                        ),
                                        Text(
                                          'EDD',
                                          style: TextStyle(fontSize: 13.0),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                    ),
                                    ElevatedButton(
                                      onPressed: goToInputScreen,
                                      child: Text(
                                        'Input Value',
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.white),
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Divider(height: 5.0, color: Colors.black),
                                        Padding(
                                          padding: EdgeInsets.all(10.0),
                                        ),
                                        ElevatedButton(
                                          onPressed: () => _selectLMP(context),
                                          child: Text('Select LMP'),
                                        ),
                                        Text(
                                            "${selectedLMP.toLocal()}"
                                                .split(' ')[0],
                                            textAlign: TextAlign.center),
                                        SizedBox(
                                          height: 20.0,
                                        ),
                                        SizedBox(
                                          height: 20.0,
                                        ),
                                        Divider(
                                          height: 5.0,
                                          color: Colors.black,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(2.0),
                                        ),
                                        ElevatedButton(
                                          onPressed: compute,
                                          child: Text(
                                            'Calculate',
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
                                            primary: Colors.redAccent,
                                          ),
                                          child: Text(
                                            'Reset Selection',
                                            style: TextStyle(
                                                fontWeight: FontWeight.normal,
                                                fontSize: 16.0,
                                                color: Colors.white),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(4.0),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ]))))));
  }
}

class DisplayResultLMP extends StatefulWidget {
  @override
  _DisplayResultLMPState createState() => _DisplayResultLMPState();
}

// Define a corresponding State class.
// This class holds data related to the form.
class _DisplayResultLMPState extends State<DisplayResultLMP> {

  DateTime selectedLMP = DateTime.now();


  int gaInDays = -1;
  int gaDays = -1;
  int gaWeeks = -1;
  DateTime eDD = DateTime.now();

  int _radioValue1 = 1;

  void _handleRadioValueChange1(value) {
    setState(() {
      _radioValue1 = value;
    });
  }

  void goToInputScreen() {
    if (_radioValue1 == 1) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => GAcalculatorLMP()));
    } else if (_radioValue1 == 2) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => GAcalculatorGA()));
    } else if (_radioValue1 == 3) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => GAcalculatorEDD()));
    }
  }

  Future<void> _selectLMP(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedLMP,
      firstDate: DateTime(2019, 8),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedLMP)
      setState(() {
        selectedLMP = picked;
        //selectedLMP = _formatDate(dateFormat: 'dd/mm/yyyy');
      });
  }


  void calcGA() {
    int daysBetween(DateTime from, DateTime to) {
      from = selectedLMP;
      to = DateTime.now();
      return (to.difference(from).inHours / 24).round();
    }
    gaInDays = daysBetween(selectedLMP, DateTime.now());
    gaDays = gaInDays % 7;
    gaWeeks = gaInDays ~/ 7;
  }

  void calcEDD() {
    eDD = selectedLMP.add(const Duration(days: 280));
  }

  /*void displayResult() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (BuildContext context) => DisplayResultLMP()));
  }*/

  void resetSelection() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (BuildContext context) => ChooseMethod()));
  }


  @override
  Widget build(BuildContext context) {
    //final _style = Theme.of(context).textTheme.display2;
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
                                      'Calculate based on:',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold,
                                          fontStyle: FontStyle.italic),
                                    ),
                                    Row(
                                      //mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Radio(
                                          value: 1,
                                          groupValue: _radioValue1,
                                          onChanged: _handleRadioValueChange1,
                                        ),
                                        Text(
                                          'LMP',
                                          style: TextStyle(fontSize: 13.0),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Radio(
                                          value: 2,
                                          groupValue: _radioValue1,
                                          onChanged: _handleRadioValueChange1,
                                        ),
                                        Text(
                                          'GA',
                                          style: TextStyle(fontSize: 13.0),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Radio(
                                          value: 3,
                                          groupValue: _radioValue1,
                                          onChanged: _handleRadioValueChange1,
                                        ),
                                        Text(
                                          'EDD',
                                          style: TextStyle(fontSize: 13.0),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                    ),
                                    ElevatedButton(
                                      onPressed: goToInputScreen,
                                      child: Text(
                                        'Input Value',
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.white),
                                      ),
                                    ),
                                    Divider(height: 5.0, color: Colors.black),
                                    Padding(
                                      padding: EdgeInsets.all(10.0),
                                    ),
                                    ElevatedButton(
                                      onPressed: () => _selectLMP(context),
                                      child: Text('Select LMP'),
                                    ),
                                    Text(
                                        "${selectedLMP.toLocal()}"
                                            .split(' ')[0],
                                        textAlign: TextAlign.center),
                                    SizedBox(
                                      height: 20.0,
                                    ),
                                    SizedBox(
                                      height: 20.0,
                                    ),
                                    Divider(
                                      height: 5.0,
                                      color: Colors.black,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(2.0),
                                    ),
                                    ElevatedButton(
                                      //onPressed: computeScore,
                                      onPressed: () {  },
                                      child: Text(
                                        'Calculate',
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
                                        primary: Colors.redAccent,
                                      ),
                                      child: Text(
                                        'Reset Selection',
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 16.0,
                                            color: Colors.white),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(4.0),
                                    ),
                                    SizedBox(
                                      height: 20.0,
                                    ),
                                    Divider(
                                      height: 5.0,
                                      color: Colors.black,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(2.0),
                                    ),
                                    Row(
                                      children: [
                                        Text (
                                          'GA : ',
                                        ),
                                        Text(
                                          "$gaWeeks" + 'week(s), ' "$gaDays" + 'day(s)',
                                          style: TextStyle(fontSize: 13.0),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text (
                                          'EDD : ',
                                        ),
                                        Text(
                                          "$eDD.toLocal()}"
                                              .split(' ')[0],
                                          style: TextStyle(fontSize: 13.0),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ]))))));
  }
}





class MySelectionItem extends StatelessWidget {
  final int title;
  final bool isForList;

  const MySelectionItem({ required this.title, this.isForList = true})
      : super();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.0,
      child: isForList
          ? Padding(
        child: _buildItem(context),
        padding: EdgeInsets.all(10.0),
      )
          : Card(
        margin: EdgeInsets.symmetric(horizontal: 10.0),
        child: Stack(
          children: <Widget>[
            _buildItem(context),
            Align(
              alignment: Alignment.centerRight,
              child: Icon(Icons.arrow_drop_down),
            )
          ],
        ),
      ),
    );
  }

  _buildItem(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      child: Text("$title"),
    );
  }
}

/*
void computeScore() {
  validateAnswers();
  calculateScore();
  comment();
}

void sumAnswers() {

}

void calculateScore() {
  validateAnswers();
  sumAnswers();
}

void comment() {
}
}

void showErrorDialog() {
  // flutter defined function
  showDialog(
    context: context,
    builder: (BuildContext context) {
      // return object of type Dialog
      return AlertDialog(
        title: new Text("Alert"),
        content: new Text("You left some parameters unanswered."),
        actions: <Widget>[
          // usually buttons at the bottom of the dialog
          TextButton(
            child: new Text("Back"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
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
          "CURB-65 Score:", textAlign: TextAlign.center,
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
                    'Pneumonia Severity:\n',
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text('$_pneumonia_severity', textAlign: TextAlign.center),
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
  if ()
  {
    showErrorDialog();
  } else {
    showResultDialog();
  }
*/
