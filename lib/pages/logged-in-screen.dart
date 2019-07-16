import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DashboardScreen extends StatelessWidget {
  final FirebaseUser user;

  //constructor to get our user data
  DashboardScreen(this.user);

  /**
   * this is our main rendering method
   * @param BuildContext context
   * @result Widget
   */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Read Screen")),
        body: Center(
          child: Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 2 - 100),
              child: Column(
                children: <Widget>[
                  Text("You are now logged in"),
                  Container(
                      child: Column(
                    children: <Widget>[
                      Text(this.user.displayName),
                      Text(this.user.email),
                    ],
                  ))
                ],
              )),
        ));
  }
}
