/*
import 'package:flutter/material.dart';

class EditableSelectButton extends StatelessWidget {
  EditableSelectButton({
    Key key,
    @required this.onChanged,
    @required this.initialValue,
    String parameter1,
    String parameter2,
  }) : super(key: key);

  final Function(double value) onChanged;
  double initialValue = -1;
  String parameter1 = 'Yes';
  String parameter2 = 'No';


  @override
  Widget build(BuildContext context) {
    return FormField<double>(
      validator: (value) {
        if (value == -1) return 'field is required';
        return null;
      },
      onSaved: (value) => onChanged(value),
      initialValue: initialValue,
      builder: (formState) {
        return Row(
          children: [
            Expanded(
              child: CustomSelectButton(
                yesText: parameter1,
                noText: parameter2,
                value: formState.value,
                onChanged: (value) {
                  formState.didChange(value);
                },
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
}

class RadioFormField extends StatelessWidget {
  final double initialValue;
  final Function(double value) onChanged;

  const RadioFormField({
    Key key,
    this.onChanged,
    this.initialValue = -1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormField<double>(
      validator: (value) {
        if (value == -1) return 'field is required';
        return null;
      },
      onSaved: (value) => onChanged(value),
      initialValue: initialValue,
      builder: (formState) {
        return Row(
          children: [
            EditableSelectButton(value: formState.value,onChanged: (
                value) {
              formState.didChange(value);
            }, initialValue: -1,
              parameter1: 'Yes', parameter2: 'No',),
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
}

*/
