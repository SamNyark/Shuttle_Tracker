import 'package:flutter/material.dart';
import 'package:shuttle_tracker/pages/MainPage.dart';
import 'package:shuttle_tracker/pages/loginPage.dart';
import 'package:shuttle_tracker/pages/signUpPage.dart';
import 'pages/WelcomePage.dart';
import 'package:get/get.dart';


class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(name: '/main', page: () => MainPage()),
        GetPage(name: '/welcome', page: () => WelcomePage()),
        GetPage(name: '/login', page: () => LoginPage()),
        GetPage(name: '/signup', page: () => SignUpPage())
      ],
      initialRoute: "/welcome",
    );
  }
}