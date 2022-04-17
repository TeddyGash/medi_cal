import 'package:flutter/material.dart';
import 'package:medi_cal/app_screens/home_screen.dart';

class ResetSelectionButton extends StatelessWidget {
  const ResetSelectionButton({
    Key key,
    @required GlobalKey<FormState> formKey,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        _formKey.currentState.reset();
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.redAccent,
      ),
      child: Text(
        'Reset Selection',
        style: TextStyle(
            fontWeight: FontWeight.normal, fontSize: 16.0, color: Colors.white),
      ),
    );
  }
}

class ResultDialog extends StatelessWidget {
  ///eg. Well's Score or GCS
  final String dialogTitle;

  ///Calculated value
  final String score;

  ///eg. PE Risk or Bleeding Risk or just Comment
  final String parameter;

  ///Comment on the calculated value eg. Normal, High, High Risk, etc.
  final String comment;

  const ResultDialog({
    Key key,
    @required String peRisk,
    @required GlobalKey<FormState> formKey,
    this.dialogTitle,
    this.score,
    this.parameter,
    this.comment,
  })  : _peRisk = peRisk,
        _formKey = formKey,
        super(key: key);

  final String _peRisk;
  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        dialogTitle, textAlign: TextAlign.center,
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
                  score, textAlign: TextAlign.center,
                  //overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      //fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
                Text(
                  parameter,
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text(comment, textAlign: TextAlign.center),
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
            _formKey.currentState.reset();
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}

class CustomAppBarLabel extends StatelessWidget {
  final String label;

  const CustomAppBarLabel({
    Key key,
    this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label),
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
    );
  }
}

class CustomAppView extends StatelessWidget {
  final String pageTitle;
  final Widget appBarTitle;
  final Widget pageBody;
  final backButtonDestination;

   const CustomAppView({
    Key key,
    this.pageTitle,
    this.appBarTitle,
    this.pageBody, this.backButtonDestination,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: pageTitle,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => backButtonDestination),
                );
              }),
          title: appBarTitle,
        ),
        body: pageBody,
      ),
    );
  }
}

/*class CustomSelectButton extends StatelessWidget {
  final Color yesButtonColor;
  final Color noButtonColor;
  final double value;
  final Function(double value) onChanged;
  final String yesText;

  final String noText;

  CustomSelectButton({
    Key key,
    this.value,
    this.onChanged,
    this.yesButtonColor,
    this.noButtonColor,
    this.yesText = 'Yes',
    this.noText = 'No',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        OutlinedButton(
          //color: yesButtonColor,
          onPressed: () {
            onChanged(1.0);
          },
          child: Row(
            children: [
              Text(yesText),
              if (value == 1.0) Icon(Icons.done, size: 20)
            ],
          ),
        ),
        SizedBox(width: 16),
        OutlinedButton(
          //color: noButtonColor,
          onPressed: () {
            onChanged(0.0);
          },
          child: Row(
            children: [
              Text(noText),
              if (value == 0.0) Icon(Icons.done, size: 20)
            ],
          ),
        ),
      ],
    );
  }
}*/

/*class RadioFormField extends StatefulWidget {

  final double initialValue;
  final Function (double value) onChanged;
  final Color yesButtonColor;
  final Color noButtonColor;
  double value;
  final String option1;
  final String option2;

  //onChanged(value) => value = value;
  //var onChanged;

   RadioFormField({
    Key key,
     this.onChanged,
    this.initialValue = -1,
    this.yesButtonColor,
    this.noButtonColor,
    this.value,
    this.option1 = 'Yes',
    this.option2 = 'No',
  }) : super(key: key);

  @override
  _RadioFormFieldState createState() => _RadioFormFieldState();
}*/

/*class _RadioFormFieldState extends State<RadioFormField> {

  void setValue (double value) => setState(() => value = value);
  double option1value;
  double option2value;


  _RadioFormFieldState();
  @override
  Widget build(BuildContext context) {
    return FormField<double>(
      validator: (value) {
        if (value == -1) return 'field is required';
        return null;
      },
      onSaved: (value) => setState(() => value = value),
      initialValue: -1,
      builder: (formState) {
        return Row(
          children: [
            OutlinedButton(
              //color: yesButtonColor,
              onPressed: () => setValue(widget.value = 1.0),
              child: Row(
                children: [
                  Text(widget.option1),
                  if (widget.value == 1.0) Icon(Icons.done, size: 20)
                ],
              ),
            ),
            SizedBox(width: 16),
            OutlinedButton(
              //color: noButtonColor,
              onPressed: () => setValue(widget.value = 0.0),
              child: Row(
                children: [
                  Text(widget.option2),
                  if (widget.value == 0.0) Icon(Icons.done, size: 20)
                ],
              ),
            ),
            if (formState.hasError) ...[
              SizedBox(width: 10),
              Text(
                '*',
                style: TextStyle(color: Colors.red, fontSize: 20),
              )
            ],
          ],
        );
      },
    );
  }
}*/

class ErrorDialog extends StatelessWidget {
  const ErrorDialog({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
  }
}
