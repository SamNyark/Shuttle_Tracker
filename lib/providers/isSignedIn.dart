import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuttle_tracker/authentication/firebaseController.dart';
import 'package:shuttle_tracker/pages/MainPage.dart';
import 'package:shuttle_tracker/pages/WelcomePage.dart';
import 'instanceBinding.dart';

class IsSignedIn extends StatefulWidget {
  const IsSignedIn({ Key? key }) : super(key: key);

  @override
  _IsSignedInState createState() => _IsSignedInState();
}

class _IsSignedInState extends State<IsSignedIn> {
  var users = Get.find<FirebaseController>();
  @override
  Widget build(BuildContext context) {
    return Obx(
       () => users.user == null ? WelcomePage() : MainPage());
  }
}