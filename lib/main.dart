import 'package:flutter/material.dart';
import 'screens/SignIn.dart';
import 'screens/SignUp.dart';
import 'screens/HomePage.dart';
import 'screens/Dashboard.dart';
import 'screens/ProductPage.dart';

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
      routes: <String, WidgetBuilder>{
        '/signup': (BuildContext context) => SignUpPage(),
        '/signin': (BuildContext context) => SignInPage(),
        '/dashboard': (BuildContext context) => Dashboard(),
//        '/productPage': (BuildContext context) => ProductPage(),
      },
    );
  }
}
