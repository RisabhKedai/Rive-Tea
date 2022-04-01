import 'package:flutter/material.dart';
import 'package:rive_tea/Pages/ChatRoom.dart';

import 'Pages/SignUp.dart';
import 'Pages/Login.dart';
import 'Pages/Home.dart';

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
      home: ChatRoom(),
    );
  }
}
