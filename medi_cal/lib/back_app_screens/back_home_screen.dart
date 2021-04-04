import 'package:flutter/material.dart';

class HomeCore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.lightBlueAccent,
        child: Center(
            child: Container(
                padding: EdgeInsets.only(top: 0.0),
                alignment: Alignment.center,
                //color: Colors.deepPurple,
                child:
                      CalcList()
                    )));
  }
}


//WelcomeCore

 // ignore: non_constant_identifier_names
 CalcList () => GridView.count(
      primary: false,
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      children: <Widget>[
          Container(
          padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: const BorderRadius.all(const Radius.circular(8)),),
            child: Image.asset('assets/images/bmi.png'),
          ),
          Container( padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: const BorderRadius.all(const Radius.circular(8)),),
              child: Image.asset('assets/images/eGFR.png'),
            // child: Stack(
            //   children : [
            //   Image.asset('assets/images/eGFR.png'),
            //   Text ("eGFR Calculator"),//const Text('Heed not the rabble'),
          //color: Colors.teal[200],
          ),
          Container(
          padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: const BorderRadius.all(const Radius.circular(8)),),
          child: Image.asset('assets/images/hasbled.jpeg'),
          //color: Colors.teal[300],
          ),
          Container(
          padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: const BorderRadius.all(const Radius.circular(8)),),
            child: Image.asset('assets/images/CHADSVASC.jpeg'),
          ),
          Container(
          padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: const BorderRadius.all(const Radius.circular(8)),),
            child: Image.asset('assets/images/dvt.jpeg'),
          ),
          Container(
          padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: const BorderRadius.all(const Radius.circular(8)),),
            child: Image.asset('assets/images/pe2.webp'),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: const BorderRadius.all(const Radius.circular(8)),),
            child: Image.asset('assets/images/curb65.jpeg'),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: const BorderRadius.all(const Radius.circular(8)),),
            child: Image.asset('assets/images/electrolyte.jpeg'),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: const Text('Sound of screams but the'),
            color: Colors.teal[300],
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: const Text('Who scream'),
            color: Colors.teal[400],
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: const Text('Revolution is coming...'),
            color: Colors.teal[500],
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: const Text('Revolution, they...'),
            color: Colors.teal[600],
          ),
      ],
      );

// class CalcImageAsset extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     AssetImage assetImage = AssetImage('assets/images/bmi.png');
//     Image image = Image(
//       image: assetImage,
//       width: 250.0,
//       height: 250.0,
//     );
//     return Container(
//       child: image,
//     );
//   }
// }

// ignore: non_constant_identifier_names
// CalcImageAsset bmi_image = CalcImageAsset();
//     AssetImage assetImage = AssetImage('assets/images/bmi.png');


//CalcImageAsset gfr_image = CalcImageAsset('assets/images/eGFR.png');
// ignore: non_constant_identifier_names
//AssetImage gfr_image = AssetImage('assets/images/eGFR.png');