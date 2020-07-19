import 'package:flutter/material.dart';
import 'package:orangeneedles/Components/Textstyles.dart';
import 'package:orangeneedles/Components/colours.dart';
import 'package:orangeneedles/Components/inputFields.dart';
import 'package:page_transition/page_transition.dart';
import 'SignIn.dart';
import 'Dashboard.dart';

class SignUpPage extends StatefulWidget {
  final String pageTitle;
  static const String id = 'SignUp';

  SignUpPage({Key key, this.pageTitle});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: white,
        title: Text('Sign Up',
            style: TextStyle(
                color: Colors.grey, fontFamily: 'Poppins', fontSize: 15)),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              // Navigator.of(context).pushReplacementNamed('/signin');
              Navigator.pushReplacement(
                  context,
                  PageTransition(
                      type: PageTransitionType.rightToLeft,
                      child: SignInPage()));
            },
            child: Text('Sign In', style: contrastText),
          )
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 18, right: 18),
            child: Stack(
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: Image.asset(
                        'images/welcome.png',
                        height: 200,
                      ),
                    ),
                    Text('Welcome to Orange Needle!', style: h3),
                    Text('Let\'s get started', style: taglineText),
                    TextInput('Username'),
                    TextInput('Full Name'),
                    EmailInputField('Email Address'),
                    PasswordInput('Password')
                  ],
                ),
                Positioned(
                  bottom: 15,
                  right: -15,
                  child: FlatButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: Dashboard(),
                          ));
                    },
                    color: primaryColor,
                    padding: EdgeInsets.all(13),
                    shape: CircleBorder(),
                    child: Icon(Icons.arrow_forward, color: white),
                  ),
                )
              ],
            ),
            width: double.infinity,
            height: 570,
            decoration: authPlateDecoration,
          ),
        ],
      ),
    );
  }
}
