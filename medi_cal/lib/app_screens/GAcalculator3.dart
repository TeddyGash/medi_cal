import 'dart:async';

//import 'package:intl/intl.dart';
import 'package:direct_select/direct_select.dart';
import 'package:flutter/material.dart';
import 'package:medi_cal/app_screens/home_screen.dart';

class ChooseMethod extends StatefulWidget {
  @override
  _ChooseMethodState createState() => _ChooseMethodState();
}

class _ChooseMethodState extends State<ChooseMethod> {
  int _radioValue1 = -1;

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
      //add an error message if nothing is selected.
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "GAcalculator",
        home: Scaffold(
            appBar: AppBar(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("EGA/EDD Calculator"),
                  IconButton(
                    icon: const Icon(Icons.home,
                        color: Colors.white, size: 24.0, semanticLabel: "Home"),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    },
                  )
                ],
              ),
            ),
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
                                              onChanged:
                                                  _handleRadioValueChange1,
                                            ),
                                            Text(
                                              'LMP',
                                              style: TextStyle(fontSize: 13.0),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          //mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Radio(
                                              value: 2,
                                              groupValue: _radioValue1,
                                              onChanged:
                                                  _handleRadioValueChange1,
                                            ),
                                            Text(
                                              'GA',
                                              style: TextStyle(fontSize: 13.0),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          //mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Radio(
                                              value: 3,
                                              groupValue: _radioValue1,
                                              onChanged:
                                                  _handleRadioValueChange1,
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
                                        Padding(
                                          padding: EdgeInsets.all(4.0),
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
                                      ],
                                    ),
                                  )
                                ])))))));
  }
}

// LMP
class GAcalculatorLMP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "GAcalculator",
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("EGA/EDD Calculator"),
              IconButton(
                icon: const Icon(Icons.home,
                    color: Colors.white, size: 24.0, semanticLabel: "Home"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
              )
            ],
          ),
        ),
        body: GAcalculatorCoreLMP(),
      ),
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
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedLMP,
        firstDate: DateTime(2019, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedLMP)
      setState(() {
        selectedLMP = picked;
        //selectedLMP = _formatDate(dateFormat: 'dd/mm/yyyy');
      });
  }

  void resetSelection() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => ChooseMethod()));
  }

  @override
  Widget build(BuildContext context) {
    final _style = Theme.of(context).textTheme.display2;
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
                                        primary: Colors.redAccent,),
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
                              )
                            ]))))));
  }
}

// GA
class GAcalculatorGA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "GAcalculator",
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("EGA/EDD Calculator"),
              IconButton(
                icon: const Icon(Icons.home,
                    color: Colors.white, size: 24.0, semanticLabel: "Home"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
              )
            ],
          ),
        ),
        body: GAcalculatorCoreGA(),
      ),
    );
  }
}

class GAcalculatorCoreGA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.lightBlueAccent,
        child: Center(
            child: Container(
          padding: EdgeInsets.only(top: 0.0),
          alignment: Alignment.center,
          child: InputFieldsGA(),
        )));
  }
}

// Define a custom Form widget.
class InputFieldsGA extends StatefulWidget {
  @override
  _InputFieldsGAState createState() => _InputFieldsGAState();
}

// Define a corresponding State class.
// This class holds data related to the form.
class _InputFieldsGAState extends State<InputFieldsGA> {
  DateTime selectedLMP = DateTime.now();
  DateTime selectedEDD = DateTime.now();
  final weeks = List.generate(43, (i) => i + 1);

  final days = List.generate(6, (i) => i + 1);

  int _radioValue1 = 2;

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

  int selectedIndex1 = 0, selectedIndex2 = 0;

  List<Widget> _buildItems1() {
    return weeks
        .map((val) => MySelectionItem(
              title: val,
            ))
        .toList();
  }

  List<Widget> _buildItems2() {
    return days
        .map((val) => MySelectionItem(
              title: val,
            ))
        .toList();
  }

  void resetSelection() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => ChooseMethod()));
  }

  @override
  Widget build(BuildContext context) {
    final _style = Theme.of(context).textTheme.display2;
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
                                      //mainAxisAlignment: MainAxisAlignment.center,
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
                                      //mainAxisAlignment: MainAxisAlignment.center,
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
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                    ),
                                    Divider(height: 5.0, color: Colors.black),
                                    Padding(
                                      padding: EdgeInsets.all(2.0),
                                    ),
                                    SizedBox(
                                      height: 20.0,
                                    ),
                                    Text(
                                      "Select EGA today",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Expanded(
                                            child: DirectSelect(
                                                itemExtent: 55.0,
                                                selectedIndex: selectedIndex1,
                                                //backgroundColor: Colors.red,
                                                child: MySelectionItem(
                                                  isForList: false,
                                                  title: weeks[selectedIndex1],
                                                ),
                                                onSelectedItemChanged: (index) {
                                                  setState(() {
                                                    selectedIndex1 = index;
                                                  });
                                                },
                                                items: _buildItems1()),
                                          ),
                                          Text(
                                            'weeks',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.normal),
                                          ),
                                          Expanded(
                                            child: DirectSelect(
                                                itemExtent: 55.0,
                                                selectedIndex: selectedIndex2,
                                                //backgroundColor: Colors.red,
                                                child: MySelectionItem(
                                                  isForList: false,
                                                  title: days[selectedIndex2],
                                                ),
                                                onSelectedItemChanged: (index) {
                                                  setState(() {
                                                    selectedIndex2 = index;
                                                  });
                                                },
                                                items: _buildItems2()),
                                          ),
                                          Text(
                                            'days',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.normal),
                                          ),
                                        ]),
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
}

// EDD
class GAcalculatorEDD extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "GAcalculator",
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("EGA/EDD Calculator"),
              IconButton(
                icon: const Icon(Icons.home,
                    color: Colors.white, size: 24.0, semanticLabel: "Home"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
              )
            ],
          ),
        ),
        body: GAcalculatorCoreEDD(),
      ),
    );
  }
}

class GAcalculatorCoreEDD extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.lightBlueAccent,
        child: Center(
            child: Container(
          padding: EdgeInsets.only(top: 0.0),
          alignment: Alignment.center,
          child: InputFieldsEDD(),
        )));
  }
}

// Define a custom Form widget.
class InputFieldsEDD extends StatefulWidget {
  @override
  _InputFieldsEDDState createState() => _InputFieldsEDDState();
}

// Define a corresponding State class.
// This class holds data related to the form.
class _InputFieldsEDDState extends State<InputFieldsEDD> {
  DateTime selectedLMP = DateTime.now();
  DateTime selectedEDD = DateTime.now();
  final weeks = List.generate(43, (i) => i + 1);

  final days = List.generate(6, (i) => i + 1);

  int _radioValue1 = 3;

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

  Future<void> _selectEDD(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedEDD,
        firstDate: DateTime(2019, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedEDD)
      setState(() {
        selectedEDD = picked;
      });
  }

  void resetSelection() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => ChooseMethod()));
  }

  @override
  Widget build(BuildContext context) {
    final _style = Theme.of(context).textTheme.display2;
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
                                      //mainAxisAlignment: MainAxisAlignment.center,
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
                                      //mainAxisAlignment: MainAxisAlignment.center,
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
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                    ),
                                    Divider(height: 5.0, color: Colors.black),
                                    Padding(
                                      padding: EdgeInsets.all(2.0),
                                    ),
                                    ElevatedButton(
                                      onPressed: () => _selectEDD(context),
                                      child: Text('Select EDD'),
                                    ),
                                    Text(
                                        "${selectedEDD.toLocal()}"
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
}

class MySelectionItem extends StatelessWidget {
  final int title;
  final bool isForList;

  const MySelectionItem({Key key, this.title, this.isForList = true})
      : super(key: key);

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
