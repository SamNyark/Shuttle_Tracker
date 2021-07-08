import 'package:flutter/material.dart';
import 'pages/WelcomePage.dart';
import 'package:get/get.dart';


class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomePage()
    );
  }
}