import 'package:firebase_auth_example/pages/logged-in-screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth_example/bloc/login-controlller.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LaunchPadScreen extends StatefulWidget {
  /**
   * create our widget state that we need to run the app
   * @return LaunchPadState
   */
  LaunchPadState createState() => LaunchPadState();
}

class LaunchPadState extends State<LaunchPadScreen> {
  /**
   * this is our main rendering method
   * @param BuildContext context - the widget tree that we need for rendering
   * @return Widget
   */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
                decoration: BoxDecoration(color: Colors.white),
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 2 - 100),
                child: Column(
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.only(bottom: 15),
                        child: Text("Sign on using",
                            style: TextStyle(fontSize: 19))),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            try {
                              bloc.login().then((FirebaseUser user) {
                                Navigator.push(
                                    (context),
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            DashboardScreen(user)));
                              });
                            } on Exception catch (ex) {
                              print(ex);
                            }
                          },
                          child: Container(
                              decoration: BoxDecoration(),
                              child: Image.asset(
                                  'assets/images/google-logo.png',
                                  height: 80,
                                  fit: BoxFit.fitHeight)),
                        )
                      ],
                    )
                  ],
                ))));
  }
}
