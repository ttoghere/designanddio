import 'package:designanddio/screens/login_screen.dart';
import 'package:designanddio/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'consts/theme_consts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: themeData,
      title: 'Material App',
      home: LoginScreen(),
    );
  }
}
