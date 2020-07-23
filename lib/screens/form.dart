import 'package:flutter/material.dart';

class FormApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Form Page',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new FormPage(title: 'Form Page'),
    );
  }
}

class FormPage extends StatefulWidget {
  FormPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _FormPageState createState() => new _FormPageState();
}

class _FormPageState extends State<FormPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Container(
          padding: new EdgeInsets.fromLTRB(40, 0, 40, 0),
          child: new DataForm()),
    );
  }
}

class DataForm extends StatefulWidget {
  @override
  _DataFormState createState() => new _DataFormState();
}

class _DataFormState extends State<DataForm> {
  final _formKey = GlobalKey<FormState>();

  String _coursename = '';
  String _code = '';
  int _units = -1;
  var myLetterGrade = "W";
  var sliderValue = 0.0;
  double _grade = -1;

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey we created above
    return Form(
        key: _formKey,
        child: new ListView(
          children: getFormWidget(),
        ));
  }

  List<Widget> getFormWidget() {
    List<Widget> formWidget = new List();

    formWidget.add(new TextFormField(
      decoration: InputDecoration(labelText: 'Course Name', hintText: 'Course'),
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter a Course Name';
        }
        return null;
      },
      onSaved: (value) {
        setState(() {
          _coursename = value;
        });
      },
    ));

    formWidget.add(new TextFormField(
      decoration: InputDecoration(labelText: 'Course Code', hintText: 'Code'),
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter a Course Code';
        }
        return null;
      },
      onSaved: (value) {
        setState(() {
          _code = value;
        });
      },
    ));

    formWidget.add(new TextFormField(
      decoration: InputDecoration(
          hintText: 'No. of Units', labelText: 'Enter Number of Units'),
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value.isEmpty)
          return 'Please enter a value';
        else
          return null;
      },
      onSaved: (value) {
        setState(() {
          _units = int.tryParse(value);
        });
      },
    ));

    formWidget.add(new Container(
      width: 350.0,
      height: 300.0,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
                child: Text(
              myLetterGrade,
              style: TextStyle(fontSize: 72.0),
            )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Slider(
                  min: 0.0,
                  max: 8.0,
                  divisions: 8,
                  value: sliderValue,
                  activeColor: Colors.blue,
                  inactiveColor: Colors.blueGrey,
                  onChanged: (newValue) {
                    setState(() {
                      sliderValue = newValue;
                      if (sliderValue < 2.0) {
                        myLetterGrade = "F";
                        _grade = 0.0;
                      }
                      if (sliderValue >= 2.0 && sliderValue < 4.0) {
                        myLetterGrade = "D";
                        _grade = 1.0;
                      }
                      if (sliderValue >= 4.0 && sliderValue < 5.0) {
                        myLetterGrade = "C";
                        _grade = 2.0;
                      }
                      if (sliderValue >= 5.0 && sliderValue < 6.0) {
                        myLetterGrade = "C+";
                        _grade = 2.5;
                      }
                      if (sliderValue >= 6.0 && sliderValue < 7.0) {
                        myLetterGrade = "B";
                        _grade = 3.0;
                      }
                      if (sliderValue >= 7.0 && sliderValue < 8.0) {
                        myLetterGrade = "B+";
                        _grade = 3.5;
                      }
                      if (sliderValue == 8.0) {
                        myLetterGrade = "A";
                        _grade = 4.0;
                      }
                    });
                  }),
            ),
          ),
        ],
      ),
    ));

    void onPressedSubmit() {
      if (_formKey.currentState.validate()) {
        _formKey.currentState.save();
        var arr = new List(5);
        arr[0] = _coursename;
        arr[1] = _code;
        arr[2] = _units;
        arr[3] = _grade;
        arr[4] = myLetterGrade;
        Scaffold.of(context)
            .showSnackBar(SnackBar(content: Text('Submitted Successfully')));
      }
    }

    formWidget.add(new RaisedButton(
        color: Colors.blue,
        textColor: Colors.white,
        child: new Text('Submit'),
        onPressed: onPressedSubmit));

    return formWidget;
  }
}
