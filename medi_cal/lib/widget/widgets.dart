import 'package:flutter/material.dart';
//import 'package:medi_cal/widget/groupButton.dart';
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
  //Function (bool selected) onSelected;


  _RadioFormFieldState();
  final _formKey = GlobalKey<FormState>();
  double groupValue;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FormField(builder: (formState) {
            return
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ChoiceChip(
                          //avatar: image.asset("assets/left.png", matchTextDirection: false, width: 20.0),
                          label: Text(yesText,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20)),
                          labelPadding:
                          EdgeInsets.symmetric(horizontal: 50),
                          selected: userChoice == 'yes',
                          onSelected: (bool selected) {
                            setState(() {
                              userChoice = selected ? 'yes' : null;
                            });
                          },
                          selectedColor: Color(0xFF0D47A1),
                          shape: ContinuousRectangleBorder(
                              borderRadius:
                              BorderRadius.circular(5.0))),
                    ),
                    Expanded(
                        child: ChoiceChip(
                            //avatar: image.asset("assets/right.png", matchTextDirection: false, width: 20.0),
                            label: Text(noText,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20)),
                            labelPadding:
                            EdgeInsets.symmetric(horizontal: 50),
                            selected: userChoice == 'no',
                            onSelected: (bool selected) {
                              setState(() {
                                userChoice = selected ? 'no' : null;
                              });
                            },
                            selectedColor: Color(0xFF0D47A1),
                            shape: ContinuousRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(5.0))))
                  ]);
          })
        ],
      ),
    );
  }}

/*
GroupButton(
//groupValue: _questionNumber,
selectedButton: -1,
isRadio: true,
spacing: 10,
onSelected: (index, isSelected) => setState(() => selectedButton = index),
buttons: ["Yes", "No"],
)*/
