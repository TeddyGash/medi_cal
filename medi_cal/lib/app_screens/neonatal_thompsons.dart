import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:medi_cal/app_screens/neonatalCalcHome.dart';
import 'package:medi_cal/widget/customWidgets.dart';

class ThompsonsScore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomAppView(
      pageTitle: 'ThompsonsScore',
      label: "Thompson's Score",
      backButtonDestination: NeonatalHome(),
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
  int _posture = -1;
  int _loc = -1;
  int _fits = -1;
  int _respiration = -1;
  int _frontanelle = -1;
  int _tone = -1;
  int _moro = -1;
  int _grasp = -1;
  int _suck = -1;
  int totalScore = 0;
  var _comment = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
          //key: _formKey,
          child:Container(
            padding: EdgeInsets.fromLTRB(5.w, 3.h, 5.w, 0.0.h),
            child:
              ListView(
                children: [
                  Text(
                    'Select as appropriate',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 15.0.dp,
                        fontWeight: FontWeight.normal, fontStyle: FontStyle.italic),
                  ),
                  Padding(
                    padding: EdgeInsets.all(1.h),
                  ),
                  Divider(height: 0.5.h, color: Colors.black),
                  Padding(
                    padding: EdgeInsets.all(1.h),
                  ),
                  Text(
                    '1. Posture',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0.dp,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      RadioListTile<int>(
                        visualDensity: VisualDensity(horizontal: -4.0, vertical: -4.0),
                        title: const Text('Normal (0)'),
                        value: 0,
                        groupValue: _posture,
                        onChanged: (value) {
                          setState(() {
                            _posture = value!;
                          });
                        },
                      ),
                      RadioListTile<int>(
                        visualDensity: VisualDensity(horizontal: -4.0, vertical: -4.0),
                        title: const Text('Fisting/cycling (+1)'),
                        value: 1,
                        groupValue: _posture,
                        onChanged: (value) {
                          setState(() {
                            _posture = value!;
                          });
                        },
                      ),
                      RadioListTile<int>(
                        visualDensity: VisualDensity(horizontal: -4.0, vertical: -4.0),
                        title: const Text('Strong distal flexion (+2)'),
                        value: 2,
                        groupValue: _posture,
                        onChanged: (value) {
                          setState(() {
                            _posture = value!;
                          });
                        },
                      ),
                      RadioListTile<int>(
                        visualDensity: VisualDensity(horizontal: -4.0, vertical: -4.0),
                        title: Text('Decerebrate (+3)'),
                        value: 3,
                        groupValue: _posture,
                        onChanged: (value) {
                          setState(() {
                            _posture = value!;
                          });
                        },
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(1.h),
                  ),
                  Divider(height: 0.5.h, color: Colors.black),
                  Padding(
                    padding: EdgeInsets.all(1.h),
                  ),
                  Text(
                    '2. Level of Consciousness',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0.dp,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RadioListTile<int>(
                        visualDensity: VisualDensity(horizontal: -4.0, vertical: -4.0),
                        title: const Text('Normal (0)'),
                        value: 0,
                        groupValue: _loc,
                        onChanged: (value) {
                          setState(() {
                            _loc = value!;
                          });
                        },
                      ),
                      RadioListTile<int>(
                          visualDensity: VisualDensity(horizontal: -4.0, vertical: -4.0),
                        title: const Text('Hyper alert (+1)'),
                        value: 1,
                        groupValue: _loc,
                        onChanged: (value) {
                          setState(() {
                            _loc = value!;
                          });
                        },
                      ),
                      RadioListTile<int>(
                          visualDensity: VisualDensity(horizontal: -4.0, vertical: -4.0),
                        title: const Text('Lethargic (+2)'),
                        value: 2,
                        groupValue: _loc,
                        onChanged: (value) {
                          setState(() {
                            _loc = value!;
                          });
                        },
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(1.h),
                  ),
                  Divider(height: 0.5.h, color: Colors.black),
                  Padding(
                    padding: EdgeInsets.all(1.h),
                  ),
                  Text(
                    '3. Fits',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0.dp,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RadioListTile<int>(
                  visualDensity: VisualDensity(horizontal: -4.0, vertical: -4.0),
                        title: const Text('None (0)'),
                        value: 0,
                        groupValue: _fits,
                        onChanged: (value) {
                          setState(() {
                            _fits = value!;
                          });
                        },
                      ),
                      RadioListTile<int>(
                          visualDensity: VisualDensity(horizontal: -4.0, vertical: -4.0),
                        title: const Text('Infrequent <3 per day (+1)'),
                        value: 1,
                        groupValue: _fits,
                        onChanged: (value) {
                          setState(() {
                            _fits = value!;
                          });
                        },
                      ),
                      RadioListTile<int>(
                          visualDensity: VisualDensity(horizontal: -4.0, vertical: -4.0),
                        title: const Text('Frequent >2 per day (+2)'),
                        value: 2,
                        groupValue: _fits,
                        onChanged: (value) {
                          setState(() {
                            _fits = value!;
                          });
                        },
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(1.h),
                  ),
                  Divider(height: 0.5.h, color: Colors.black),
                  Padding(
                    padding: EdgeInsets.all(1.h),
                  ),
                  Text(
                    '4. Respiration',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0.dp,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RadioListTile<int>(
                  visualDensity: VisualDensity(horizontal: -4.0, vertical: -4.0),
                        title: const Text('Normal (0)'),
                        value: 0,
                        groupValue: _respiration,
                        onChanged: (value) {
                          setState(() {
                            _respiration = value!;
                          });
                        },
                      ),
                      RadioListTile<int>(
                          visualDensity: VisualDensity(horizontal: -4.0, vertical: -4.0),
                        title: const Text('Hyperventilation (+1)'),
                        value: 1,
                        groupValue: _respiration,
                        onChanged: (value) {
                          setState(() {
                            _respiration = value!;
                          });
                        },
                      ),
                      RadioListTile<int>(
                          visualDensity: VisualDensity(horizontal: -4.0, vertical: -4.0),
                        title: const Text('Brief apnoea (+2)'),
                        value: 2,
                        groupValue: _respiration,
                        onChanged: (value) {
                          setState(() {
                            _respiration = value!;
                          });
                        },
                      ),
                      RadioListTile<int>(
                          visualDensity: VisualDensity(horizontal: -4.0, vertical: -4.0),
                        title: const Text('Intermittent Positive Pressure Ventilation (apnoea) (+3)'),
                        value: 3,
                        groupValue: _respiration,
                        onChanged: (value) {
                          setState(() {
                            _respiration = value!;
                          });
                        },
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(1.h),
                  ),
                  Divider(height: 0.5.h, color: Colors.black),
                  Padding(
                    padding: EdgeInsets.all(1.h),
                  ),
                  Text(
                    '5. Frontanelle',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0.dp,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RadioListTile<int>(
                  visualDensity: VisualDensity(horizontal: -4.0, vertical: -4.0),
                        title: const Text('Normal (0)'),
                        value: 0,
                        groupValue: _frontanelle,
                        onChanged: (value) {
                          setState(() {
                            _frontanelle = value!;
                          });
                        },
                      ),
                      RadioListTile<int>(
                          visualDensity: VisualDensity(horizontal: -4.0, vertical: -4.0),
                        title: const Text('Not full tense (+1)'),
                        value: 1,
                        groupValue: _frontanelle,
                        onChanged: (value) {
                          setState(() {
                            _frontanelle = value!;
                          });
                        },
                      ),
                      RadioListTile<int>(
                          visualDensity: VisualDensity(horizontal: -4.0, vertical: -4.0),
                        title: const Text('Tense (+2)'),
                        value: 2,
                        groupValue: _frontanelle,
                        onChanged: (value) {
                          setState(() {
                            _frontanelle = value!;
                          });
                        },
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(1.h),
                  ),
                  Divider(height: 0.5.h, color: Colors.black),
                  Padding(
                    padding: EdgeInsets.all(1.h),
                  ),
                  Text(
                    '6. Tone',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0.dp,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RadioListTile<int>(
                  visualDensity: VisualDensity(horizontal: -4.0, vertical: -4.0),
                        title: const Text('Normal (0)'),
                        value: 0,
                        groupValue: _tone,
                        onChanged: (value) {
                          setState(() {
                            _tone = value!;
                          });
                        },
                      ),
                      RadioListTile<int>(
                          visualDensity: VisualDensity(horizontal: -4.0, vertical: -4.0),
                        title: const Text('Hyper (+1)'),
                        value: 1,
                        groupValue: _tone,
                        onChanged: (value) {
                          setState(() {
                            _tone = value!;
                          });
                        },
                      ),
                      RadioListTile<int>(
                          visualDensity: VisualDensity(horizontal: -4.0, vertical: -4.0),
                        title: const Text('Hypo (+2)'),
                        value: 2,
                        groupValue: _tone,
                        onChanged: (value) {
                          setState(() {
                            _tone = value!;
                          });
                        },
                      ),
                      RadioListTile<int>(
                          visualDensity: VisualDensity(horizontal: -4.0, vertical: -4.0),
                        title: const Text('Flaccid (+3)'),
                        value: 3,
                        groupValue: _tone,
                        onChanged: (value) {
                          setState(() {
                            _tone = value!;
                          });
                        },
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(1.h),
                  ),
                  Divider(height: 0.5.h, color: Colors.black),
                  Padding(
                    padding: EdgeInsets.all(1.h),
                  ),
                  Text(
                    '7. Moro Reflex',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0.dp,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RadioListTile<int>(
                  visualDensity: VisualDensity(horizontal: -4.0, vertical: -4.0),
                        title: const Text('Normal (0)'),
                        value: 0,
                        groupValue: _moro,
                        onChanged: (value) {
                          setState(() {
                            _moro = value!;
                          });
                        },
                      ),
                      RadioListTile<int>(
                          visualDensity: VisualDensity(horizontal: -4.0, vertical: -4.0),
                        title: const Text('Partial (+1)'),
                        value: 1,
                        groupValue: _moro,
                        onChanged: (value) {
                          setState(() {
                            _moro = value!;
                          });
                        },
                      ),
                      RadioListTile<int>(
                          visualDensity: VisualDensity(horizontal: -4.0, vertical: -4.0),
                        title: const Text('Absent (+2)'),
                        value: 2,
                        groupValue: _moro,
                        onChanged: (value) {
                          setState(() {
                            _moro = value!;
                          });
                        },
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(1.h),
                  ),
                  Divider(height: 0.5.h, color: Colors.black),
                  Padding(
                    padding: EdgeInsets.all(1.h),
                  ),
                  Text(
                    '8. Grasp Reflex',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0.dp,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RadioListTile<int>(
                  visualDensity: VisualDensity(horizontal: -4.0, vertical: -4.0),
                        title: const Text('Normal (0)'),
                        value: 0,
                        groupValue: _grasp,
                        onChanged: (value) {
                          setState(() {
                            _grasp = value!;
                          });
                        },
                      ),
                      RadioListTile<int>(
                          visualDensity: VisualDensity(horizontal: -4.0, vertical: -4.0),
                        title: const Text('Poor (+1)'),
                        value: 1,
                        groupValue: _grasp,
                        onChanged: (value) {
                          setState(() {
                            _grasp = value!;
                          });
                        },
                      ),
                      RadioListTile<int>(
                          visualDensity: VisualDensity(horizontal: -4.0, vertical: -4.0),
                        title: const Text('Absent (+2)'),
                        value: 2,
                        groupValue: _grasp,
                        onChanged: (value) {
                          setState(() {
                            _grasp = value!;
                          });
                        },
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(1.h),
                  ),
                  Divider(height: 0.5.h, color: Colors.black),
                  Padding(
                    padding: EdgeInsets.all(1.h),
                  ),
                  Text(
                    '9. Suck',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0.dp,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RadioListTile<int>(
                  visualDensity: VisualDensity(horizontal: -4.0, vertical: -4.0),
                        title: const Text('Normal (0)'),
                        value: 0,
                        groupValue: _suck,
                        onChanged: (value) {
                          setState(() {
                            _suck = value!;
                          });
                        },
                      ),
                      RadioListTile<int>(
                          visualDensity: VisualDensity(horizontal: -4.0, vertical: -4.0),
                        title: const Text('Poor (+1)'),
                        value: 1,
                        groupValue: _suck,
                        onChanged: (value) {
                          setState(() {
                            _suck = value!;
                          });
                        },
                      ),
                      RadioListTile<int>(
                          visualDensity: VisualDensity(horizontal: -4.0, vertical: -4.0),
                        title: Text('Absent/bites (+2)'),
                        value: 2,
                        groupValue: _suck,
                        onChanged: (value) {
                          setState(() {
                            _suck = value!;
                          });
                        },
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(1.h),
                  ),
                  Divider(height: 0.5.h, color: Colors.black),
                  Padding(
                    padding: EdgeInsets.all(1.h),
                  ),
                  Container(
                    width: 70.0.w,
                    height: 6.0.h,
                    margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0.w),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                     borderRadius: BorderRadius.all(Radius.circular(20.0.w)),
                    ),
                    child: ElevatedButton(
                      onPressed: computeScore,
                      child: Text(
                        'Check Final Score',
                        style: TextStyle(
                            fontSize: 16.0.dp,
                            fontWeight: FontWeight.normal,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(2.0.w),
                  ),
                  Container(
                    width: 70.0.w,
                    height: 6.0.h,
                    margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0.w),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.all(Radius.circular(10.0.w)),
                    ),
                    child: ElevatedButton(
                      onPressed: resetSelection,
                      style: ElevatedButton.styleFrom(
                        primary: Colors.redAccent,),
                      child: Text(
                        'Reset Selection',
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 16.0.dp,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(2.0.w),
                  ),
                ],
              ),
          ),
        ));
  }

  double customHeight =  40.h;
  double customWidth =  80.w;

  void resetSelection() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => ThompsonsScore()));
  }

  void computeScore() {
    validateAnswers();
    sumAnswers();
    comment();
  }

  void validateAnswers() {
    if (_posture == -1 ||
        _loc == -1 ||
        _fits == -1 ||
        _respiration == -1 ||
        _frontanelle == -1 ||
        _tone == -1||
        _moro == -1||
        _grasp == -1||
        _suck == -1) {
      showErrorDialog();
    } else {
      showResultDialog();
    }
  }

  void sumAnswers() {
    totalScore = _posture +
        _loc +
        _fits +
        _respiration +
        _frontanelle +
    _tone +
    _moro +
    _grasp +
    _suck;
  }

  void comment() {
    if (0 <= totalScore && totalScore <= 10) {
      _comment = 'Mild HIE';
    } else if (11 <= totalScore && totalScore <= 14 ) {
      _comment = 'Moderate HIE';
    } else if (totalScore >= 15) {
      _comment = 'Severe HIE';
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
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(4.w))),
          contentPadding: EdgeInsets.all(0.0),
          content: Container(
              height: customHeight, width: customWidth,
              child: Column(
                  children: <Widget>[
                    Container(
                      width: customWidth,
                      padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(4.0.w),
                            topRight: Radius.circular(4.0.w)),
                      ),
                      child: Text("Thompson Score", textAlign: TextAlign.center,
                        //overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontWeight: FontWeight.bold,  fontSize: 23.dp, color: Colors.white),),
                    ),
                    Padding(padding: EdgeInsets.only(top: 4.h)),
                    Text ("$totalScore", textAlign: TextAlign.center,
                      style: TextStyle(//fontWeight: FontWeight.bold,
                          fontSize: 40.dp),),
                    Padding(padding: EdgeInsets.only(top: 3.h)),
                    Text("Comment" , textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23.dp, color: Colors.blueAccent),),
                    Padding(padding: EdgeInsets.only(top: 2.h)),
                    Padding(padding: EdgeInsets.only(top: 1.h)),
                    Text("$_comment", textAlign: TextAlign.center, style: TextStyle(fontStyle: FontStyle.italic,
                        fontSize: 18.dp, fontWeight: FontWeight.normal),),
                  ])),
        );
      },
    );
  }
}
