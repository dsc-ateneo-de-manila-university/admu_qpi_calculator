import 'package:flutter/material.dart';

class DataForm extends StatefulWidget {
  @override
  _DataFormState createState() => new _DataFormState();
}

class _DataFormState extends State<DataForm> {
  final _formKey = GlobalKey<FormState>();

  String _coursename = '';
  String _code = '';
  int _units = 0;
  var myLetterGrade = "W";
  var sliderValue = 0.0;
  double _grade = -1;

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey we created above
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Form(
          key: _formKey,
          child: new ListView(
            children: getFormWidget(),
          )),
    );
  }

  List<Widget> getFormWidget() {
    List<Widget> formWidget = new List();

    formWidget.add(new Container(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Text(
        'Course Data Form',
        style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            fontStyle: FontStyle.italic),
      ),
    ));

    formWidget.add(Container(
      width: MediaQuery.of(context).size.width / 3,
      padding:
          EdgeInsets.fromLTRB(0, 0, MediaQuery.of(context).size.width * .5, 0),
      child: new TextFormField(
        autofocus: true,
        decoration:
            InputDecoration(labelText: 'Course Code', hintText: 'Course'),
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
      ),
    ));

    formWidget.add(
      new Container(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Text(
                  'Number of Units',
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              child: DropdownButtonHideUnderline(
                child: ButtonTheme(
                  child: DropdownButton(
                    hint: Text(
                      _units.toString(),
                      style: TextStyle(fontSize: 17, color: Colors.grey[600]),
                    ),
                    items: [
                      DropdownMenuItem(
                        child: Text("1"),
                        value: 1,
                      ),
                      DropdownMenuItem(child: Text("2"), value: 2),
                      DropdownMenuItem(child: Text("3"), value: 3),
                      DropdownMenuItem(child: Text("4"), value: 4),
                      DropdownMenuItem(child: Text("5"), value: 5),
                      DropdownMenuItem(child: Text("6"), value: 6)
                    ],
                    onChanged: (value) {
                      setState(() {
                        _units = value;
                      });
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );

    formWidget.add(
      Container(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
        child: new Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 30),
                child: Text(
                  'Expected Grade',
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: Text(
                          'W',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue[300],
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 240,
                    child: SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.lightBlue[400],
                        inactiveTrackColor: Colors.white,
                        trackShape: RoundedRectSliderTrackShape(),
                        trackHeight: 4.0,
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 12.0),
                        thumbColor: Colors.white,
                        overlayColor: Colors.blue.withAlpha(32),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 28.0),
                        tickMarkShape: RoundSliderTickMarkShape(),
                        activeTickMarkColor: Colors.lightBlue[400],
                        inactiveTickMarkColor: Colors.white,
                        valueIndicatorShape: PaddleSliderValueIndicatorShape(),
                        valueIndicatorColor: Colors.white,
                        valueIndicatorTextStyle: TextStyle(
                          color: Colors.blue[300],
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                      child: Slider(
                        value: sliderValue,
                        min: 0,
                        max: 8,
                        divisions: 8,
                        label: myLetterGrade,
                        onChanged: (value) {
                          setState(
                            () {
                              sliderValue = value;
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
                            },
                          );
                        },
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Container(
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Text(
                          'A',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue[300],
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(colors: [Colors.blue[100], Colors.blue]),
              ),
              height: 50,
            ),
          ],
        ),
      ),
    );

    void onPressedSubmit() {
      if (_formKey.currentState.validate()) {
        _formKey.currentState.save();
        var arr = new List(5);
        arr[0] = _coursename;
        arr[1] = _code;
        arr[2] = _units;
        arr[3] = _grade;
        arr[4] = myLetterGrade;
        print('form submitted');
      }
    }

    formWidget.add(new FloatingActionButton(
        child: new Icon(Icons.check),
        backgroundColor: Colors.green,
        elevation: 2.0,
        onPressed: onPressedSubmit));

    return formWidget;
  }
}
