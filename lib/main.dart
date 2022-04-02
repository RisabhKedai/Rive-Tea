import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:rive_tea/Pages/homePage.dart';
import 'package:rive_tea/Pages/signUp.dart';

import 'Providers/google_sign_in.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: MaterialApp(
        title: 'SignUp',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePageS(),
      ),
    );
  }
}
