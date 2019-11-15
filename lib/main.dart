import 'package:bashakhuji/view/home.dart';
import 'package:bashakhuji/view/landing_page.dart';
import 'package:bashakhuji/view/signin.dart';
import 'package:bashakhuji/view/signup.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'বাসাখুঁজি',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => new LandingPage(),
        '/signIn': (context) => new SignIn(),
        '/signUp': (context) => new SignUp(),
        '/home': (context) => new Home(),
      },
    );
  }
}
