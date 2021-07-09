import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  Color topBackground = Color(0xffE6D56A);
  Color bottomBackground = Color(0xff806925);
  Color _buttonColor = Color(0xff74B51F);
  bool _showPassword = true;
  String? _email, _password, _phone, _username;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  void _toggle() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [topBackground, bottomBackground])),
          child: Column(
            children: [
              IconButton(
                padding: EdgeInsets.only(right: 350),
                onPressed: () {
                  Get.back();
                },
                iconSize: 30,
                icon: Icon(
                  Icons.arrow_back,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Text("Signup",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20)),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                margin: EdgeInsets.only(left: 30, right: 30),
                padding: EdgeInsets.only(top: 10),
                child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (input) {
                            if (input == null || input.isEmpty) {
                              return "Field is required";
                            }
                            return null;
                          },
                          onSaved: (input) {
                            _username = input;
                          },
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.grey[700],
                            ),
                            hintText: "Username",
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                    color: _buttonColor,
                                    style: BorderStyle.solid,
                                    width: 3)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                    color: Colors.white,
                                    style: BorderStyle.solid,
                                    width: 3)),
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
                          height: 10,
                        ),
                        TextFormField(
                          validator: (input) {
                            if (input!.isEmpty) {
                              return "Please fill out this field";
                            } else if (!RegExp(
                                    r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                                .hasMatch(input)) {
                              return "Please fill out a valid email";
                            }
                            return null;
                          },
                          onSaved: (input) {
                            _email = input;
                          },
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.grey[700],
                            ),
                            hintText: "Email",
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                    color: _buttonColor,
                                    style: BorderStyle.solid,
                                    width: 3)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                    color: Colors.white,
                                    style: BorderStyle.solid,
                                    width: 3)),
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
                          height: 10,
                        ),
                        TextFormField(
                          validator: (input) {
                            if (input!.isEmpty) {
                              return "Please fill out thi form";
                            } else if (!RegExp(r"^\+(?:[0-9]●?){6,14}[0-9]$")
                                .hasMatch(input)) {
                              return "Please fill out a valid phone number";
                            }
                            return null;
                          },
                          onSaved: (input) {
                            _phone = input;
                          },
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.phone,
                              color: Colors.grey[700],
                            ),
                            hintText: "Phone",
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                    color: _buttonColor,
                                    style: BorderStyle.solid,
                                    width: 3)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                    color: Colors.white,
                                    style: BorderStyle.solid,
                                    width: 3)),
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
                          height: 10,
                        ),
                        TextFormField(
                          validator: (input) {
                            if (input == null || input.isEmpty) {
                              return "Please fill out this field";
                            } else if (input.length < 6) {
                              return "password should be more than six characters";
                            }
                            if (!RegExp(
                                    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$')
                                .hasMatch(input)) {
                              return "password must contain atleast one uppercase, a \nlowercase letter and a number ";
                            }
                            return null;
                          },
                          onSaved: (input) {
                            _password = input;
                          },
                          obscureText: _showPassword,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.grey[700],
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                _toggle();
                              },
                              icon: Icon(_showPassword
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                            ),
                            hintText: "Password",
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                    color: _buttonColor,
                                    style: BorderStyle.solid,
                                    width: 3)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                    color: Colors.white,
                                    style: BorderStyle.solid,
                                    width: 3)),
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
                          height: 40,
                        ),
                        SizedBox(
                            height: 50,
                            width: MediaQuery.of(context).size.width * 2/3,
                            child: Builder(
                                builder: (context) => ElevatedButton(
                                    child: Text(
                                      "sign up",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white),
                                    ),
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        _formKey.currentState!.save();
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                        primary: _buttonColor,
                                        padding: EdgeInsets.all(8),
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(25)
                                        )))))],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
