import 'package:flutter/material.dart';
import 'package:orangeneedles/Components/Textstyles.dart';
import 'package:orangeneedles/Components//colours.dart';
import 'package:orangeneedles/Components/inputFields.dart';
import 'package:page_transition/page_transition.dart';
import 'SignUp.dart';
import 'Dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class SignInPage extends StatefulWidget {
  final String pageTitle;
  static const String id = 'SignIn';

  SignInPage({Key key, this.pageTitle}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool showSpinner = false;
  String email;
  String password;
  final _auth = FirebaseAuth.instance;
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
                            height: 250,
                          ),
                        ),
                        Text('Welcome Back!', style: h3),
                        Text("Howdy, let's authenticate", style: taglineText),
                        EmailInputField('Email', onChanged: (value){
                          email = value;
                        }),
                        PasswordInput('Password', onChanged: (value){
                          password = value;
                        },),
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
                        onPressed: () async{
                          setState(() {
                            showSpinner = true;
                          });
                          try {
                          final user = await _auth.signInWithEmailAndPassword(email: email, password: password);
                          if(user != null) {
                            Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.rightToLeft,
                                child: Dashboard(),
                              ));
                          }
                          setState(() {
                            showSpinner=false;
                          });
                          }catch(e){
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
                height: 570,
                width: double.infinity,
                decoration: authPlateDecoration,
              ),
            ],
          ),
        ));
  }
}
