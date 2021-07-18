import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuttle_tracker/authentication/firebaseController.dart';
import 'package:shuttle_tracker/providers/getController.dart';
import '../providers/instanceBinding.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Color _bottomBackground = Color(0xffE6D56A);
  Color _topBackground = Color(0xff806925);
  Color _buttonColor = Color(0xff74B51F);
  String _email = "", _password = "";
  bool _showPassword = true;

  var _firebaseService = Get.find<FirebaseController>();

  void login() {
    _firebaseService.login(_email, _password);
  }

  void _toggle() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [_bottomBackground, _topBackground])),
        child: Container(
            margin: EdgeInsets.only(
              left: 30,
              right: 30,
            ),
            padding: EdgeInsets.only(top: 50),
            child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      validator: (input) {
                        if (input == null || input.isEmpty) {
                          return "Please fill out this field";
                        } else if (!RegExp(
                                r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                            .hasMatch(input.toString())) {
                          return "Please fill out a valid email";
                        }
                      },
                      onSaved: (input) {
                        _email = input.toString();
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.grey[700],
                        ),
                        labelText: "Email",
                        labelStyle: TextStyle(color: Colors.black),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                                width: 3,
                                style: BorderStyle.solid,
                                color: _buttonColor)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                                width: 3,
                                style: BorderStyle.solid,
                                color: Colors.white)),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                                width: 3,
                                style: BorderStyle.solid,
                                color: Colors.red.shade400)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                                width: 3,
                                style: BorderStyle.solid,
                                color: Colors.red.shade400)),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      validator: (input) {
                        if (input == null || input.isEmpty) {
                          return "Please fill out this field";
                        }
                        if (!RegExp(
                                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$')
                            .hasMatch(input.toString())) {
                          return "password must contain atleast one uppercase letter, a \nlowercase letter and a number ";
                        }
                      },
                      onSaved: (input) {
                        _password = input.toString();
                      },
                      obscureText: _showPassword,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.grey[700],
                        ),
                        labelText: "Password",
                        labelStyle: TextStyle(color: Colors.black),
                        suffixIcon: IconButton(
                          icon: Icon(_showPassword
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            _toggle();
                          },
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                                width: 3,
                                style: BorderStyle.solid,
                                color: _buttonColor)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                                width: 3,
                                style: BorderStyle.solid,
                                color: Colors.white)),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                                width: 3,
                                style: BorderStyle.solid,
                                color: Colors.red.shade400)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                                width: 3,
                                style: BorderStyle.solid,
                                color: Colors.red.shade400)),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Processing Data')));
                            //todo
                          },
                          child: Container(
                              child: Text(
                            "forget password",
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.bold,
                                color: Colors.redAccent,
                                fontSize: 16),
                          )),
                        )
                      ],
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 2 / 3,
                      child: Builder(
                        builder: (context) => ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: _buttonColor,
                              shadowColor: Colors.red,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              )),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Processing Data')));
                              _formKey.currentState!.save();
                              login();
                            }
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Container(
                      child: Text(
                        "Don't have an account?",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 2 / 3,
                        height: 50,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25)),
                              primary: Colors.white,
                            ),
                            onPressed: () {
                              Get.toNamed('/signup');
                            },
                            child: Text("Create an account",
                                style: TextStyle(
                                    fontSize: 17, color: _buttonColor))),
                      )
                    ]),
                  ],
                ))),
      ),
    );
  }
}
