import 'package:flutter/material.dart';

class RadioFormField extends StatefulWidget {
  RadioFormField({
    Key key,
  }) : super(key: key);

  @override
  _RadioFormFieldState createState() => _RadioFormFieldState();
//double groupValue;
}

class _RadioFormFieldState extends State<RadioFormField> {

  _RadioFormFieldState();

  final _formKey = GlobalKey<FormState>();
  int selectedValue = -1;

  //int index = -2;

  //int groupValue = 0;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FormField(builder: (formState) {
            return CustomRadio(
              selectedValue: selectedValue,
              onChanged: (int val) => selectedValue = val,
            );
          })
        ],
      ),
    );
  }
}

/*
GroupButton(
//groupValue: _questionNumber,
selectedButton: -1,
isRadio: true,
spacing: 10,
onSelected: (index, isSelected) => setState(() => selectedButton = index),
buttons: ["Yes", "No"],
)*/

class CustomRadio extends StatelessWidget {
  // @override
  // _CustomRadioState createState() => _CustomRadioState();
  int selectedValue;
  final VoidCallback onSelected;
  final Function(int) onChanged;
  final String text;

  CustomRadio({
    this.selectedValue,
    this.onSelected,
    this.onChanged,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        OutlineButton(
          onPressed: () {
            selectedValue = 1;
            onChanged(1);
          },
          child: Text('Yes',
              style: TextStyle(
                color: (selectedValue == 1) ? Colors.green : Colors.blueGrey,
              )),
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          borderSide: BorderSide(
              color: (selectedValue == 1) ? Colors.green : Colors.blueGrey),
        ),
        OutlineButton(onPressed: () {
          selectedValue = 0;
          onChanged(0);
        },
          child: Text('No',
              style: TextStyle(
                color: (selectedValue == 0) ? Colors.green : Colors.blueGrey,
              )),
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          borderSide: BorderSide(
              color: (selectedValue == 0) ? Colors.green : Colors.blueGrey),
        ),
      ],
    );
  }
}

/*class _CustomRadioState extends State<CustomRadio> {


  *//*void updateValue(int value) {
    selectedValue = value;
    //onChanged(1);
  }*//*


}*/
