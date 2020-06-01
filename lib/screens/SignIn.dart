import 'package:flutter/material.dart';
import 'package:orangeneedles/Components/Textstyles.dart';
import 'package:orangeneedles/Components//colours.dart';
import 'package:orangeneedles/Components/inputFields.dart';
import 'package:page_transition/page_transition.dart';
import 'SignUp.dart';
import 'Dashboard.dart';

class SignInPage extends StatefulWidget {
  final String pageTitle;

  SignInPage({Key key, this.pageTitle}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: white,
          title: Text('Sign In',
              style: TextStyle(
                  color: Colors.grey, fontFamily: 'Poppins', fontSize: 15)),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                // Navigator.of(context).pushReplacementNamed('/signup');
                Navigator.pushReplacement(
                    context,
                    PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child: SignUpPage()));
              },
              child: Text('Sign Up', style: contrastText),
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
                          height: 250,
                        ),
                      ),
                      Text('Welcome Back!', style: h3),
                      Text("Howdy, let's authenticate", style: taglineText),
                      TextInput('Username'),
                      PasswordInput('Password'),
                      FlatButton(
                        onPressed: () {},
                        child:
                            Text('Forgot Password?', style: contrastTextBold),
                      )
                    ],
                  ),
                  Positioned(
                    bottom: 15,
                    right: -15,
                    child: FlatButton(
                      onPressed: () {
//                        Navigator.pushReplacement(
//                            context,
//                            PageTransition(
//                              type: PageTransitionType.rightToLeft,
////                              child: Dashboard(),
//                            ));
                      },
                      color: primaryColor,
                      padding: EdgeInsets.all(13),
                      shape: CircleBorder(),
                      child: Icon(Icons.arrow_forward, color: white),
                    ),
                  )
                ],
              ),
              height: 570,
              width: double.infinity,
              decoration: authPlateDecoration,
            ),
          ],
        ));
  }
}
