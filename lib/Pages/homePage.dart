import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rive_tea/Pages/Login.dart';
import 'package:rive_tea/Pages/loggedInScreen.dart';
import 'package:rive_tea/Pages/SignUp.dart';

class HomePageS extends StatelessWidget {
  @override
  Widget build(context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text(
              "Something is wrong.",
            ),
          );
        } else if (snapshot.hasData) {
          return HomeScreen();
        } else {
          return SignUp();
        }
      },
    );
  }
}

class HomePageL extends StatelessWidget {
  @override
  Widget build(context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text(
              "Something is wrong.",
            ),
          );
        } else if (snapshot.hasData) {
          return HomeScreen();
        } else {
          return Login();
        }
      },
    );
  }
}
