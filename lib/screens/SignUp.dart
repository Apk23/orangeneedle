import 'package:flutter/material.dart';
import 'package:orangeneedles/Components/Textstyles.dart';
import 'package:orangeneedles/Components/colours.dart';
import 'package:orangeneedles/Components/inputFields.dart';
import 'package:orangeneedles/screens/HomePage.dart';
import 'package:page_transition/page_transition.dart';
import 'SignIn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class SignUpPage extends StatefulWidget {
  final String pageTitle;
  static const String id = 'SignUp';

  SignUpPage({Key key, this.pageTitle});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool showSpinner = false;
   String email;
   String password;
   String username;
   String fullname;
   final _auth = FirebaseAuth.instance;
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
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
              child: ListView(
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
                      // TextInput('Username', onChanged: (value) {
                      //   username = value;
                      // }),
                      // TextInput('Full Name', onChanged: (value) {
                      //   fullname = value;
                      // }),
                      EmailInputField('Email Address', onChanged: (value) {
                        email = value.toString();
                      }),
                      PasswordInput('Password',onChanged: (value) {
                        password = value.toString();
                      })
                    ],
                  ),
                  Positioned(
                    bottom: 15,
                    right: -15,
                    child: FlatButton(
                      onPressed: () async{
                        setState(() {
                          showSpinner = true;
                        });
                        try { 
                        final newuser = await _auth.createUserWithEmailAndPassword(email: email, password: password); 
                        if (newuser != null ) {
                          Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.rightToLeft,
                              child: HomePage(),
                            ));
                        }
                        setState(() {
                          showSpinner = false;
                        });
                        } catch(e) {
                          print(e);
                        }
                    
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
      ),
    );
  }
}
