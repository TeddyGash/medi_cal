
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:medi_cal/app_screens/GAcalculatorLMP.dart';
import 'package:medi_cal/app_screens/GAcalculatorGA.dart';
import 'package:medi_cal/app_screens/GAcalculatorEDD.dart';
import 'package:flutter/material.dart';
import 'package:medi_cal/app_screens/home_screen.dart';
import 'package:medi_cal/widget/customWidgets.dart';

class ChooseMethod extends StatefulWidget {
  @override
  _ChooseMethodState createState() => _ChooseMethodState();
}

class Method
{
  String label;
  String key;
  Method(this.label, this.key);
}

class _ChooseMethodState extends State<ChooseMethod> {
  int _responseMethod = -1;

  late String _selectedMethod = 'lmp';

  List<Method> _methodList = [
    Method("LMP", "lmp"),
    Method("eGA", "ga"),
    Method("EDD", 'edd'),
  ];

  List<Widget> _buildMethodChips () {
    List<Widget> chips = [];
    for (int i=0; i< _methodList.length; i++) {
      Widget item = Padding(
        padding: EdgeInsets.only(left:10, right: 5),
        child: ChoiceChip(
          label: Text(_methodList[i].label),
          labelStyle: TextStyle(color: Colors.white),
          elevation: 2.w,
          pressElevation: 1.w,
          shadowColor: Colors.teal,
          backgroundColor: Colors.black54,
          selectedColor: Colors.blue,
          selected: _selectedMethod == _methodList[i].key,
          onSelected: (bool value)
          {
            setState(() {
              _selectedMethod = _methodList[i].key;
            });
          },
        ),
      );
      chips.add(item);
    }
    return chips;
  }

  ///LMP FUNCTIONS
  DateTime selectedLMP = DateTime.now();
  DateTime selectedEDD = DateTime.now();

  final _weeks = List.generate(43, (i) => i + 1);

  final _days = List.generate(6, (i) => i + 1);



  int gaInDays = 0;
  int gaDays = 0;
  int gaWeeks = 0;
  DateTime eDD = DateTime.now();

  int _radioValue1 = 1;

  void _handleRadioValueChange1(value) {
    setState(() {
      _radioValue1 = value;
    });
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

  void goToInputScreen() {
    if (_selectedMethod == 'lmp') {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => GAcalculatorLMP()));
    } else if (_selectedMethod == 'ga') {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => GAcalculatorGA()));
    } else if (_selectedMethod == 'edd') {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => GAcalculatorEDD()));
      //add an error message if nothing is selected.
    }
  }

  ///GESTATIONAL AGE FUNCTIONS
  DateTime lmp = DateTime.now();

  int? selectedWeek = 1;
  int selectedDay = 1;

  int selectedWeekIndex = 0, selectedDaysIndex = 0;

  /*List<Widget> _buildWeekItems() {
    return weeks
        .map((val) => MySelectionItem(
      title: val,
    ))
        .toList();
  }*/

  /*List<Widget> _buildDaysItems() {
    return days
        .map((val) => MySelectionItem(
      title: val,
    ))
        .toList();
  }*/

  void resetSelectionToGA() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (BuildContext context) => ChooseMethod()));
  }

  void computeGA() {
    calcLMPFromGA();
    calcEDDFromLMP();
    showResultDialog();
  }

  void calcLMPFromGA() {
    selectedWeek = _weeks[selectedWeekIndex];
    selectedDay = _days[selectedDaysIndex];
    lmp = DateTime.now().subtract( Duration(days: ((selectedWeek! * 7) + selectedDay)));
  }

  void calcEDDFromLMP() {
    eDD = lmp.add(Duration(days: 280));
  }

  void showResultDialogGA() {
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
                    Text('Calculated LMP'),
                    Padding(
                      padding: EdgeInsets.all(5.0),
                    ),
                    Text(
                      "$lmp.toLocal()}"
                          .split(' ')[0],
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

  ///EDD FUNCTIONS

  Future<void> _selectEDD(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedEDD,
        firstDate: DateTime(2019, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedEDD)
      setState(() {
        selectedEDD = picked;
      });
  }

  void resetSelectionToEDD() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (BuildContext context) => ChooseMethod()));
  }

  void computeEDD() {
    calcLMPFromEDD();
    calcGAFromEDD();
    showResultDialog();
  }

  void calcLMPFromEDD() {
    lmp = selectedEDD.subtract(Duration(days: 280));
  }

  void calcGAFromEDD() {
    int daysBetween(DateTime from, DateTime to) {
      from = DateTime(from.year, from.month, from.day);
      to = DateTime(to.year, to.month, to.day);
      return (to.difference(from).inHours / 24).round();
    }
    gaInDays = daysBetween(lmp, DateTime.now());
    gaDays = gaInDays % 7;
    gaWeeks = gaInDays ~/ 7;
  }

  void showResultDialogEDD() {
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
                    Text('Calculated LMP'),
                    Padding(
                      padding: EdgeInsets.all(5.0),
                    ),
                    Text(
                      "$lmp.toLocal()}"
                          .split(' ')[0],
                      style: TextStyle(fontSize: 13.0),
                    ),
                    //Divider(height: 5.0, color: Colors.black),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                    ),
                    Text (
                      'Gestational Age Today',
                    ),
                    Padding(
                      padding: EdgeInsets.all(5.0),
                    ),
                    Text("$gaWeeks" + 'week(s), ' "$gaDays" + 'day(s)',
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
    return CustomAppView(
      pageTitle: 'EGA/EDD Calculator',
      label: "Pregnancy Dating",
      backButtonDestination: HomeScreen(),
      pageBody: Center(
          child: Container(
              width: 100.w,
              child: ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.all(1.h),
                  ),
                  Text(
                    'Calculate based on:',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [ Wrap(
                      spacing: 10.w,
                      direction: Axis.horizontal,
                      children: _buildMethodChips(),
                    ),]
                  ),
                  Padding(
                    padding: EdgeInsets.all(1.h),
                  ),

                  //Divider(height: 5.0, color: Colors.black),
                  ///LMP INPUT AREA
                  if (_selectedMethod == 'lmp')...[
                    Column(
                      children: [
                        //Divider(height: 5.0, color: Colors.black),

                        Container(
                          width: 80.w,
                          padding: EdgeInsets.all(5.w),
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Colors.black26,
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          ),
                          child:
                            Column(
                              children: [
                                Text("Select LMP from calendar",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 14.dp, fontStyle: FontStyle.italic),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 20.w),
                                  child: Divider(height: 5.0, color: Colors.black),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(0.5.h),
                                ),
                                Text("LMP:",
                                    textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 18.dp, fontWeight: FontWeight.bold),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(0.1.h),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                        "${selectedLMP.toLocal()}"
                                            .split(' ')[0],
                                        textAlign: TextAlign.center,
                                    style: TextStyle( fontSize: 16)),
                                    IconButton(
                                      icon: Icon(Icons.date_range),
                                      padding: EdgeInsets.zero,
                                      iconSize: 4.h,
                                      onPressed: () => _selectLMP(context),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(2.h),
                        ),
                        Text("EGA:",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18.dp, fontWeight: FontWeight.bold),),
                        Padding(
                          padding: EdgeInsets.all(1.h),
                        ),
                        Text("$gaWeeks" + 'week(s), ' "$gaDays" + 'day(s)',
                          style: TextStyle(fontSize: 16.0),
                        ),
                        Padding(
                          padding: EdgeInsets.all(2.h),
                        ),
                        Text("EDD:",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18.dp, fontWeight: FontWeight.bold),),
                        Padding(
                          padding: EdgeInsets.all(1.h),
                        ),
                        Text(
                          "$eDD.toLocal()}"
                              .split(' ')[0],
                          style: TextStyle(fontSize: 16.0),
                        ),
                        Padding(
                          padding: EdgeInsets.all(1.h),
                        ),
                        MaterialButton(
                          onPressed: compute,
                          child: Container(
                            width: 70.w,
                            height: 10.0.h,
                            padding: EdgeInsets.all(15.0),
                            child: Material(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(7.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      'Calculate',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.0.dp,
                                        fontFamily: 'helvetica_neue_light',
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                )),
                          ),
                        ),
                        MaterialButton(
                          onPressed:resetSelection,
                          child: Container(
                            width: 70.w,
                            height: 10.0.h,
                            padding: EdgeInsets.only(left: 4.w, right: 4.w, bottom: 7.w),
                            child: Material(
                                color: Colors.redAccent,
                                borderRadius: BorderRadius.circular(7.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      'Reset Selection',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.0.dp,
                                        fontFamily: 'helvetica_neue_light',
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                )),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(4.0),
                        ),
                      ],
                    ),
                  ]
                    ///GESTATIONAL AGE INPUT AREA
                  else if (_selectedMethod == 'ga')...[
                    Column(
                      children: [
                        Container(
                          width: 80.w,
                          padding: EdgeInsets.all(5.w),
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Colors.black26,
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          ),
                          child: Column (
                             children: [
                            Text("Select EGA today",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 14.dp, fontStyle: FontStyle.italic),
                            ),
                               Padding(
                                 padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 20.w),
                                 child: Divider(height: 5.0, color: Colors.black),
                               ),
                            Text("EGA:",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 18.dp, fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: EdgeInsets.all(0.1.h),
                            ),
                            Row(
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                //mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(
                                    width: 10.w,
                                    child: DropdownButton2<int>(
                                      items: _weeks.map((_week) =>
                                          DropdownMenuItem<int>(
                                            value: _week,
                                            child: Text(
                                              _week.toString(),
                                              style: TextStyle(
                                                  fontSize: 20.dp,
                                                  fontWeight: FontWeight.bold
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.center,
                                            ),
                                          ))
                                          .toList(),
                                      value: selectedWeek,
                                      onChanged: (value) {
                                        setState(() {
                                          //String
                                          selectedWeek = value as int;
                                        });
                                      },
                                      buttonPadding: EdgeInsets.only(left: 2.w,),
                                      buttonHeight: 8.h,
                                      buttonWidth: 13.w,
                                      itemHeight: 5.h,
                                      dropdownMaxHeight: 40.h,
                                      dropdownDecoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(2.w),
                                        //color: Colors.black12
                                      ),
                                      iconSize: 0,
                                      alignment: AlignmentDirectional.center,
                                      dropdownWidth: 15.w,


                                    ),
                                  ),
                                  SizedBox(
                                    width: 16.w,
                                    child: Text(
                                      'week(s)',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 15.0.dp,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 7.w,
                                    child: DropdownButton2<int>(

                                      items: _days.map((_day) =>
                                          DropdownMenuItem<int>(
                                            value: _day,
                                            child: Text(
                                              _day.toString(),
                                              style: TextStyle(
                                                fontSize: 20.dp,
                                                fontWeight: FontWeight.bold
                                              ),
                                            ),
                                          ))
                                          .toList(),
                                      value: selectedDay,
                                      onChanged: (value) {
                                        setState(() {
                                          //String
                                          selectedDay = value as int;
                                        });
                                      },
                                      buttonPadding: EdgeInsets.only(left: 2.w,),
                                      buttonHeight: 8.h,
                                      buttonWidth: 12.w,
                                      itemHeight: 5.h,
                                      dropdownMaxHeight: 40.h,
                                      dropdownDecoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(2.w),
                                      ),
                                      iconSize: 0,
                                      alignment: AlignmentDirectional.center,
                                      dropdownWidth: 12.w,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 13.w,
                                    child: Text(
                                      'day(s)',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 15.0.dp,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ),
                                ]),
                          ],),
                        ),
                        Padding(
                          padding: EdgeInsets.all(2.h),
                        ),
                        Text("LMP:",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18.dp, fontWeight: FontWeight.bold),
                        ),
                        Padding(
                        padding: EdgeInsets.all(1.h),
                        ),
                        Text(
                        "${lmp.toLocal()}"
                            .split(' ')[0],
                        textAlign: TextAlign.center,
                        style: TextStyle( fontSize: 16)),
                        Padding(
                          padding: EdgeInsets.all(2.h),
                        ),
                        Text("EDD:",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18.dp, fontWeight: FontWeight.bold),),
                        Padding(
                          padding: EdgeInsets.all(1.h),
                        ),
                        Text(
                          "$eDD.toLocal()}"
                              .split(' ')[0],
                          style: TextStyle(fontSize: 16.0),
                        ),
                        Padding(
                          padding: EdgeInsets.all(1.h),
                        ),
                        MaterialButton(
                          onPressed: compute,
                          child: Container(
                            width: 70.w,
                            height: 10.0.h,
                            padding: EdgeInsets.all(15.0),
                            child: Material(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(7.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      'Calculate',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.0.dp,
                                        fontFamily: 'helvetica_neue_light',
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                )),
                          ),
                        ),
                        MaterialButton(
                          onPressed:resetSelection,
                          child: Container(
                            width: 70.w,
                            height: 10.0.h,
                            padding: EdgeInsets.only(left: 4.w, right: 4.w, bottom: 7.w),
                            child: Material(
                                color: Colors.redAccent,
                                borderRadius: BorderRadius.circular(7.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      'Reset Selection',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.0.dp,
                                        fontFamily: 'helvetica_neue_light',
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                )),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(4.0),
                        ),
                      ],
                    ),
                  ]
                  /// EDD INPUT AREA
                  else if (_selectedMethod == 'edd')...[
                      Column(
                        children: [
                          //Divider(height: 5.0, color: Colors.black),

                          Container(
                            width: 80.w,
                            padding: EdgeInsets.all(5.w),
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: Colors.black26,
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            ),
                            child:
                            Column(
                              children: [
                                Text("Select EDD from calendar",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 14.dp, fontStyle: FontStyle.italic),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 20.w),
                                  child: Divider(height: 5.0, color: Colors.black),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(0.5.h),
                                ),
                                Text("EDD:",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 18.dp, fontWeight: FontWeight.bold),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(0.1.h),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                        "${selectedEDD.toLocal()}"
                                            .split(' ')[0],
                                        textAlign: TextAlign.center,
                                        style: TextStyle( fontSize: 16)),
                                    IconButton(
                                      icon: Icon(Icons.date_range),
                                      padding: EdgeInsets.zero,
                                      iconSize: 4.h,
                                      onPressed: () => _selectLMP(context),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(2.h),
                          ),
                          Text("LMP:",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 18.dp, fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: EdgeInsets.all(1.h),
                          ),
                          Text(
                              "${lmp.toLocal()}"
                                  .split(' ')[0],
                              textAlign: TextAlign.center,
                              style: TextStyle( fontSize: 16)),
                          Padding(
                            padding: EdgeInsets.all(2.h),
                          ),
                          Text("EGA:",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 18.dp, fontWeight: FontWeight.bold),),
                          Padding(
                            padding: EdgeInsets.all(1.h),
                          ),
                          Text("$gaWeeks" + 'week(s), ' "$gaDays" + 'day(s)',
                            style: TextStyle(fontSize: 16.0),
                          ),
                          Padding(
                            padding: EdgeInsets.all(1.h),
                          ),
                          MaterialButton(
                            onPressed: compute,
                            child: Container(
                              width: 70.w,
                              height: 10.0.h,
                              padding: EdgeInsets.all(15.0),
                              child: Material(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(7.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        'Calculate',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16.0.dp,
                                          fontFamily: 'helvetica_neue_light',
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  )),
                            ),
                          ),
                          MaterialButton(
                            onPressed:resetSelection,
                            child: Container(
                              width: 70.w,
                              height: 10.0.h,
                              padding: EdgeInsets.only(left: 4.w, right: 4.w, bottom: 7.w),
                              child: Material(
                                  color: Colors.redAccent,
                                  borderRadius: BorderRadius.circular(7.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        'Reset Selection',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16.0.dp,
                                          fontFamily: 'helvetica_neue_light',
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  )),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(4.0),
                          ),
                        ],
                      ),


                  ],
                ],
              ))),
    );
  }
}

class MySelectionItem extends StatelessWidget {
  final int title;
  final bool isForList;

  const MySelectionItem({required this.title, this.isForList = true})
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
      width: 20.w,
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
