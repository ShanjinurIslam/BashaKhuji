import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Stack(
        children: <Widget>[
          
          Positioned(
            top: 0,
            left: 0,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * .6,
              width: MediaQuery.of(context).size.width,
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    CupertinoIcons.home,
                    size: 200,
                    color: Colors.white,
                  ),
                  Text(
                    'বাসাখুঁজি',
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              )),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * .6,
            left: 0,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * .3,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SizedBox(
                      height: 60.0,
                      width: 300,
                      child: new RaisedButton(
                        elevation: 0.0,
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10.0)),
                        color: Colors.white,
                        child: new Text('Sign In',
                            style: new TextStyle(
                                fontSize: 15.0,
                                color: Colors.blue,
                                fontWeight: FontWeight.bold)),
                        onPressed: () =>
                            Navigator.pushNamed(context, '/signIn'),
                      ),
                    ),
                    SizedBox(
                      height: 60.0,
                      width: 300,
                      child: new RaisedButton(
                        elevation: 0.0,
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10.0)),
                        color: Colors.blue,
                        child: new Text('Sign Up',
                            style: new TextStyle(
                                fontSize: 15.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        onPressed: () =>
                            Navigator.pushNamed(context, '/signUp'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
