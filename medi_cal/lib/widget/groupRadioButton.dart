/*import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:group_button/group_button.dart';


class RadioFormField extends StatefulWidget {
  RadioFormField({
    Key key,
  }) : super(key: key);

  @override
  _RadioFormFieldState createState() => _RadioFormFieldState();
//double groupValue;
}

class _RadioFormFieldState extends State<RadioFormField> {
  //double groupValue;
  var userChoice;
  String yesText = 'Yes';
  String noText = 'No';
  int groupValue = 0;
  //Function (bool selected) onSelected;


  _RadioFormFieldState();
  final _formKey = GlobalKey<FormState>();
  //int groupValue = 0;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FormField(builder: (formState) {
            return
              GFCard(
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      GFRadio(
                        type: GFRadioType.custom,
                        activeIcon: Text ('Yes'),
                        radioColor: Colors.red,
                        size: GFSize.LARGE,
                        activeBgColor: Colors.green,
                        inactiveBorderColor: Colors.black,
                        activeBorderColor: Colors.green,
                        value: 1,
                        groupValue: groupValue,
                        onChanged: (value) {
                          setState(() {
                            groupValue = value;
                          });
                        },
                      ),
                      GFRadio(
                        type: GFRadioType.custom,
                        activeIcon: Text('No'),
                        size: GFSize.MEDIUM,
                        value: 2,
                        groupValue: groupValue,
                        onChanged: (value) {
                          setState(() {
                            groupValue = value;
                          });
                        },
                        inactiveIcon: Icon(Icons.sentiment_dissatisfied),
                        customBgColor: Colors.red,
                        activeBgColor: Colors.green,
                        activeBorderColor: Colors.green,
                      ),
                      GFRadio(
                        type: GFRadioType.blunt,
                        size: GFSize.SMALL,
                        value: 3,
                        groupValue: groupValue,
                        onChanged: (value) {
                          setState(() {
                            groupValue = value;
                          });
                        },
                        inactiveIcon: null,
                        customBgColor: Colors.green,
                        activeBorderColor: Colors.green,
                      ),
                      GFRadio(
                        type: GFRadioType.blunt,
                        size: 25,
                        value: 4,
                        groupValue: groupValue,
                        onChanged: (value) {
                          setState(() {
                            groupValue = value;
                          });
                        },
                        inactiveIcon: null,
                        activeBorderColor: Colors.green,
                        customBgColor: Colors.green,
                      ),
                    ],
                  ));
          })
        ],
      ),
    );
  }}*/

/*
GroupButton(
//groupValue: _questionNumber,
selectedButton: -1,
isRadio: true,
spacing: 10,
onSelected: (index, isSelected) => setState(() => selectedButton = index),
buttons: ["Yes", "No"],
)*/




