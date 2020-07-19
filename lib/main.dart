import 'package:flutter/material.dart';
import 'screens/SignIn.dart';
import 'screens/SignUp.dart';
import 'screens/HomePage.dart';
import 'screens/Dashboard.dart';
import 'screens/ProductPage.dart';
import 'screens/uploadscreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: HomePage(pageTitle: 'Welcome to Orange Needle'),
      routes: {
        SignUpPage.id: (BuildContext context) => SignUpPage(),
        SignInPage.id: (BuildContext context) => SignInPage(),
        Dashboard.id: (BuildContext context) => Dashboard(),
        ProductPage.id: (BuildContext context) => ProductPage(),
        uploadScreen.id: (BuildContext context) => uploadScreen(),
      },
    );
  }
}
