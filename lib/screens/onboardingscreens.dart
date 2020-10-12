import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  OnboardingScreen({Key key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  // LISTS FOR ONBOARDING COMPONENTS

  int onboardingIndex = 0;
  List<String> imageList = [
    'assets/onboarding1.png',
    'assets/onboarding2.png',
    'assets/onboarding3.png'
  ];
  List<String> titleList = [
    'Compute grades in a snap.',
    'Create schedules with ease',
    'Keep track of honors status.'
  ];
  List<String> textList = [
    'text for onboarding 1',
    'text for onboarding 2',
    'text for onboarding 3',
  ];
  List<String> buttonList2 = [
    'Next',
    'Next',
    'Sign up',
  ];

  List<double> pad = [0, 60, 60];
  List<double> height1 = [0, 40, 40];
  List<double> width1 = [0, 140, 140];
  List<double> width2 = [295, 140, 140];

  double _isActiveWidth = 0;
  Color _isActiveColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        //IMAGE
        Container(
          height: 300,
          width: double.infinity,
          child: FittedBox(
            child: Image.asset('${imageList[onboardingIndex]}'),
            fit: BoxFit.fill,
          ),
        ),
        //BREADCRUMBS
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Container(
            child: Row(
              children: [
                // #1
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 0, 4, 0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: _isActiveColor = onboardingIndex == 0
                            ? Colors.blue[700]
                            : Colors.grey,
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    height: 4,
                    width: _isActiveWidth = onboardingIndex == 0 ? 33 : 16,
                  ),
                ),
                // #2
                Padding(
                  padding: const EdgeInsets.only(right: 4),
                  child: Container(
                    decoration: BoxDecoration(
                        color: _isActiveColor = onboardingIndex == 1
                            ? Colors.blue[700]
                            : Colors.grey,
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    height: 4,
                    width: _isActiveWidth = onboardingIndex == 1 ? 33 : 16,
                  ),
                ),
                // #3
                Padding(
                  padding: const EdgeInsets.only(right: 4),
                  child: Container(
                    decoration: BoxDecoration(
                        color: _isActiveColor = onboardingIndex == 2
                            ? Colors.blue[700]
                            : Colors.grey,
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    height: 4,
                    width: _isActiveWidth = onboardingIndex == 2 ? 33 : 16,
                  ),
                )
              ],
            ),
          ),
        ),
        //TITLE
        Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Text(
            '${titleList[onboardingIndex]}',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        //TEXT
        Text('${textList[onboardingIndex]}'),
        // CONTAINER FOR BUTTON ROW
        Container(
            margin: EdgeInsets.fromLTRB(0, 130, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // BACK BUTTON
                Padding(
                  padding: EdgeInsets.only(right: pad[onboardingIndex]),
                  child: Container(
                    height: height1[onboardingIndex],
                    width: width1[onboardingIndex],
                    child: OutlineButton(
                        color: Colors.white,
                        borderSide: BorderSide(
                            color: const Color(0xff557AFE),
                            width: 1,
                            style: BorderStyle.solid),
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(8.0)),
                        onPressed: () {
                          setState(() {
                            onboardingIndex = onboardingIndex == 2
                                ? 1
                                : onboardingIndex = onboardingIndex == 1
                                    ? 0
                                    : onboardingIndex =
                                        onboardingIndex == 0 ? 0 : 0;
                          });
                        },
                        child: Text('Back')),
                  ),
                ),
                // NEXT BUTTON
                Container(
                  height: 40,
                  width: width2[onboardingIndex],
                  child: FlatButton(
                      color: Colors.blue,
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(8.0)),
                      onPressed: () {
                        setState(() {
                          onboardingIndex = onboardingIndex == 0
                              ? 1
                              : onboardingIndex = onboardingIndex == 1
                                  ? 2
                                  : onboardingIndex =
                                      onboardingIndex == 2 ? 2 : 2;
                        });
                      },
                      child: Text('${buttonList2[onboardingIndex]}',
                          style: TextStyle(color: Colors.white))),
                )
              ],
            ))
      ],
    ));
  }
}
