import 'package:flutter/material.dart';

class MyRadioListTile extends StatelessWidget {
  final value;
  final groupValue;
  final String answer;
  //final Widget title;
  final ValueChanged onChanged;

  const MyRadioListTile({
    this.value,
    this.groupValue,
    required this.onChanged,
    required this.answer,
    //this.title,
  });

  @override
  Widget build(BuildContext context) {
    //final title = this.title;
    return InkWell(
      onTap: () => onChanged(value),
      child: Container(
        height: 46,
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            _customRadioButton,
            //SizedBox(width: 12),
            //if (title != null) title,
          ],
        ),
      ),
    );
  }

  Widget get _customRadioButton {
    final isSelected = value == groupValue;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue : null,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: isSelected ? Colors.blue : (Colors.grey[300])!,
          width: 2,
        ),
      ),
      child: Text(
        answer,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.grey[600],
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
    );
  }
}



/*class _MyPageState extends State<MyPage> {
  int _value = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          MyRadioListTile(
            value: 1,
            groupValue: _value,
            answer: 'A',
            //title: Text('One'),
            onChanged: (value) => setState(() => _value = value),
          ),
          MyRadioListTile(
            value: 2,
            groupValue: _value,
            answer: 'B',
            //title: Text('Two'),
            onChanged: (value) => setState(() => _value = value),
          ),
          MyRadioListTile(
            value: 3,
            groupValue: _value,
            answer: 'C',
            //title: Text('Three'),
            onChanged: (value) => setState(() => _value = value),
          ),
        ],
      ),
    );
  }
}*/
