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
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: const Center(
          child: SizedBox(
            child: Text('Hello World'),
          ),
        ),
      ),
    );
  }
}
