/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

*/
/*
void main(){
  runApp(
      MaterialApp(
        home: Scaffold(
          body: SafeArea(
            child: MyApp(),
          ),
        ),
      )
  );
}
*//*



class MyCustomRadio extends StatefulWidget {
  final Function(int) onChanged;
  final int selectedValue;

  const MyCustomRadio({Key key, this.onChanged, this.selectedValue}) : super(key: key);
  @override
  _MyCustomRadioState createState() => _MyCustomRadioState();
}

class _MyCustomRadioState extends State<MyCustomRadio> {

  List<String> lst = ['No','Yes'];
  int selectedIndex = 99;
  final Function(int) onChanged;

  _MyCustomRadioState({
    //this.selectedValue,
    //this.onSelected,
    this.onChanged,
    //this.text,
  });

  */
/*List<IconData> iconList = [Icons.settings, Icons.bookmark, Icons.account_circle];
  int secondaryIndex = 0;*//*


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          customRadio(lst[0],0),
          customRadio(lst[1],1),
          //customRadio(lst[2],2),

          SizedBox(height: 30.0,),
        ],
      ),
    );
  }

  dynamic changeIndex(int index){
    setState(() {
      return selectedIndex = index;
      //onChanged(index);
    });
  }
  Widget customRadio(String txt,int index){
    return OutlineButton(
      onPressed: () {
        changeIndex(index);
        onChanged(index);
    },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      borderSide: BorderSide(color: selectedIndex == index ? Colors.cyan : Colors.grey),
      child: Text(txt,style: TextStyle(color: selectedIndex == index ?Colors.cyan : Colors.grey),),

    );
  }

  */
/*void changeSecondaryIndex(int index){
    setState(() {
      secondaryIndex = index;
    });
  }*//*


  */
/*Widget customRadio2(IconData icon,int index){
    return OutlineButton(
      onPressed: () => changeSecondaryIndex(index),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      borderSide: BorderSide(color: secondaryIndex == index ? Colors.deepOrangeAccent[700] : Colors.grey),
      child: Icon(icon,color:  secondaryIndex == index ? Colors.deepOrangeAccent : Colors.grey,),
    );
  }*//*

}*/
