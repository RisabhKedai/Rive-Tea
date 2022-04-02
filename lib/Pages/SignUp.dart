// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:rive_tea/Pages/Login.dart';
import 'package:rive_tea/Pages/homePage.dart';
import 'package:rive_tea/Widgets/button.dart';
import 'package:provider/provider.dart';
import 'package:rive_tea/Providers/google_sign_in.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: const [Color(0xFFFFFFFF)],
            stops: const [0.1],
          )),
        ),
        SizedBox(
          height: double.infinity,
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(
              horizontal: 40.0,
              vertical: 120.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 120.0,
                ),
                Text(
                  'Sign Up',
                  style: TextStyle(
                    color: Color.fromRGBO(46, 45, 54, 1),
                    fontFamily: 'Gilroy',
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 106.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: <Widget>[
                    Text(
                      'Phone Number',
                      style: TextStyle(
                        color: Color.fromRGBO(177, 177, 177, 1),
                        fontFamily: 'Gilroy',
                        fontSize: 16.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    SizedBox(
                      height: 80,
                      width: 333,
                      child: TextField(
                        // style: TextStyle(color: Color.fromRGBO(209, 209, 209, 1)),
                        keyboardType: TextInputType.number,
                        maxLength: 10,
                        decoration: InputDecoration(
                          fillColor: Color.fromRGBO(209, 209, 209, 1),
                          border: OutlineInputBorder(),
                          hintText: 'Enter your phone number',
                          hintStyle: TextStyle(
                            color: Color.fromRGBO(209, 209, 209, 1),
                            fontFamily: 'Gilroy',
                            fontSize: 16.0,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Container(
                      width: 333.0,
                      height: 53.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Color.fromRGBO(105, 109, 198, 1),
                      ),
                      child: Center(
                        child: Text(
                          'Get OTP',
                          style: TextStyle(
                            fontFamily: 'Gilroy',
                            fontSize: 18,
                            color: Colors.white,
                            height: 1,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Center(
                      // height: 16,
                      // width: 333,
                      // child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: <Widget>[
                          Text(
                            'existing member?',
                            style: TextStyle(
                              fontFamily: 'Gilroy',
                              fontSize: 16,
                              color: Color.fromRGBO(177, 177, 177, 1),
                              height: 1,
                            ),
                            //textAlign: TextAlign.center,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomePageL(),
                                ),
                              );
                            },
                            child: Text(
                              'Login',
                              style: TextStyle(
                                  fontFamily: 'Gilroy',
                                  fontSize: 16,
                                  color: Color.fromRGBO(105, 109, 198, 1),
                                  height: 1,
                                  fontWeight: FontWeight.w600),
                              // textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 64,
                    ),
                    Center(
                      child: Text(
                        'or',
                        style: TextStyle(
                            fontFamily: 'Gilroy',
                            fontSize: 16,
                            color: Color.fromRGBO(105, 109, 198, 1),
                            height: 1,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(
                      height: 56,
                    ),
                    Center(
                      child: Text(
                        'Sign Up Using',
                        style: TextStyle(
                            fontFamily: 'Gilroy',
                            fontSize: 16,
                            color: Color.fromRGBO(177, 177, 177, 1),
                            height: 1,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: <Widget>[
                          TextButton(
                            onPressed: () {
                              final provider =
                                  Provider.of<GoogleSignInProvider>(context,
                                      listen: false);
                              provider.googlelogin();
                            },
                            child: Image.asset('assets/Google.png'),
                          ),
                          SizedBox(
                            width: 40,
                          ),
                          Icon(
                            Icons.facebook,
                            size: 40,
                            color: Color.fromRGBO(19, 141, 229, 1),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ],
    ));
  }
}
