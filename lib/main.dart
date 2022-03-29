import 'package:flutter/material.dart';

import 'Pages/SignUp.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SignUp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SignUp(),
    );
  }
}
