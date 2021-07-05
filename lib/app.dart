import 'package:flutter/material.dart';
import 'pages/WelcomePage.dart';


class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: welcomePage(context)
    );
  }
}