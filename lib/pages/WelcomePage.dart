import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

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
                  colors: [Colors.yellowAccent, Colors.greenAccent])),
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  "Shuttle Tracker",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  child: Text("Your home of campride locations", style: TextStyle(fontSize: 20)),
                  ),
              SizedBox(
                height: 10,
              ),    
              SizedBox(
                height: 450,
                //logo
              ),
              Container(
                  child: Text("Not a member yet? sign up", style: TextStyle(fontSize: 16)),
                  ),
              SizedBox(
                height: 10,
              ),    
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          padding: EdgeInsets.only(
                              left: 50, right: 50, top: 20, bottom: 20),
                          shadowColor: Colors.grey,
                          primary: Colors.greenAccent),
                      onPressed: () {
                        Get.toNamed("/login");
                      }, //navigate to the signUp page
                      child: Text(
                        "Login",
                        style: TextStyle(fontSize: 18),
                      )),
                  SizedBox(width: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        padding: EdgeInsets.only(
                            left: 50, right: 50, top: 20, bottom: 20),
                        shadowColor: Colors.grey,
                        primary: Colors.white),
                    onPressed: () {
                      Get.toNamed("/signup");
                    }, //navigate to the signUp page
                    child: Text(
                      "Signup",
                      style: TextStyle(fontSize: 18, color: Colors.greenAccent),
                    ),
                  ),
                ],
              ),
              Container(
                  //To hold the copyright symbol
                  )
            ],
          ),
        ),
      ),
    );
  }
}