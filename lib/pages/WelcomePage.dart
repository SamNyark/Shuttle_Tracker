import 'dart:html';

import 'package:flutter/material.dart';

Widget welcomePage(BuildContext context) {
  return Scaffold(
    resizeToAvoidBottomInset: false,
    body: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.yellowAccent, Colors.greenAccent])),
      child: Column(
        children: [
          Container(
              //logo,
              ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 2 / 3,
            child: Text("Shuttle Tracker"),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
              //Told hold detailed information about the app
              ),
          ElevatedButton(
              onPressed: signUpClick, //navigate to the signUp page
              child: Text(
                "SignUp",
                style: TextStyle(),
              )),
          ElevatedButton(
            onPressed: loginClick, //navigate to the signUp page
            child: Text(
              "login",
              style: TextStyle(),
            ),
          ),
          Container(
              //To hold the copyright symbol
              )
        ],
      ),
    ),
  );
}

void signUpClick() {}

void loginClick() {}
