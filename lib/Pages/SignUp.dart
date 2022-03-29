import 'package:flutter/material.dart';

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
            colors: const [Color(0xFF73AEF5)],
            stops: const [0.1],
          )),
        ),
        Container(
          height: double.infinity,
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(
              horizontal: 40.0,
              vertical: 120.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Sign In',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Nexa',
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Phone Number',
                      style: TextStyle(
                        color: Colors.purple,
                        fontFamily: 'Nexa',
                        fontSize: 16.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      alignment: Alignment.center,
                      height: 60.0,
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

// class signup extends StatefulWidget {
//   const signup({Key? key}) : super(key: key);

//   @override
//   State<signup> createState() => _signupState();
// }

// class _signupState extends State<signup> {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(10),
//       child: ListView(
//         children: <Widget>[
//           Container(
//               alignment: Alignment.center,
//               padding: const EdgeInsets.all(10),
//               child: const Text(
//                 'Rive-Tea',
//                 style: TextStyle(
//                     color: Colors.blue,
//                     fontWeight: FontWeight.w500,
//                     fontSize: 30),
//               )),
//           Container(
//               alignment: Alignment.center,
//               padding: const EdgeInsets.all(10),
//               child: const Text(
//                 'Sign in',
//                 style: TextStyle(fontSize: 20),
//               )),
//         ],
//       ),
//     );
//   }
// }
