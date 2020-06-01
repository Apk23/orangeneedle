import 'package:flutter/material.dart';
import 'package:orangeneedles/Components/Textstyles.dart';
import 'package:orangeneedles/Components/colours.dart';
import 'package:orangeneedles/Components/button.dart';
import 'package:page_transition/page_transition.dart';
import 'SignUp.dart';
import 'SignIn.dart';

class HomePage extends StatefulWidget {
  final String pageTitle;

  HomePage({Key key, this.pageTitle});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'images/welcome.png',
            height: 300,
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10, top: 0),
            child: Text('Welcome!', style: logoStyle),
          ),
          Container(
            width: 200,
            margin: EdgeInsets.only(bottom: 0),
            child: froyoFlatBtn('Sign In', () {
              Navigator.pushReplacement(
                  context,
                  PageTransition(
                      type: PageTransitionType.upToDown,
                      duration: Duration(seconds: 1),
                      child: SignInPage()));
            }),
          ),
          Container(
            width: 200,
            padding: EdgeInsets.all(0),
            child: froyoOutlineBtn('Sign Up', () {
              Navigator.pushReplacement(
                  context,
                  PageTransition(
                      type: PageTransitionType.upToDown,
                      duration: Duration(seconds: 1),
                      child: SignUpPage()));
              // Navigator.of(context).pushReplacementNamed('/signup');
            }),
          ),
          Container(
            margin: EdgeInsets.only(top: 25),
          )
        ],
      )),
      backgroundColor: bgColor,
    );
  }
}
