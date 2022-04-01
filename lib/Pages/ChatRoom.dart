// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:rive_tea/Widgets/Chats.dart';

class ChatRoom extends StatelessWidget {
  const ChatRoom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 96,
          ),
          //   CategorySelector(),
          Expanded(
            child: Container(
              child: Column(
                children: const <Widget>[
                  Chats(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
